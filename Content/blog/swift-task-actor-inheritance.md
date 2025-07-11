---
id: swift-task-actor-inheritance
title: Task actor inheritance
subtitle: Where do I run again?
description: Understanding Task actor context inheritance in Swift concurrency
tags: concurrency, swift
image: /media/blog/swift-task-actor-inheritance/header.webp
imageDescription: "Cozy 16-bit pixel-art banner showing person in front of the computer with bubbles floating around monitor connected by thin line"
date: 2025-06-14
lastModified: 2025-06-14
---
For me Tasks were sort of black boxes which allowed me to switch to the async context of the app. Typically I assumed those will move me to some background Thread. I also love magic trick of constraining Task to `MainActor`:
```swift
Task { @MainActor in [...] }
```
And there was this vague Task actor context inheritance (+ do not ever use .detached!).

So here we are in WWDC25 period and I started looking into concurrency related sessions. Upcoming features of default actor isolation and approachable concurrency seemed to make it simpler, but different at the same time. So I started experimenting with Tasks trying to understand them little bit better.

<h2> Actor context inheritance </h2>
You may have heard that tasks inherits calling actor context and that you should not use `Task.detached` unless explicitly needing to dispatch with specified priority no matter what is the calling context. But how does this context gets inherited, why does it even matter?

Problem here is reasoning about the code execution and possibilities of `race conditions`.
On its own, Task will start asynchronous work on arbitrary Thread (using cooperative thread pool). If we could pass context of calling actor to such task we would then make things simpler to reason about, especially from perspective of race conditions.
Here comes our actor context inheritance. Whenever we call  task from within the context of an actor (eg MainActor, by using function annotation) task will inherit its context. This in turn assure its callback will be dispatched using our inherited (Main) actor. If we however add any layer between actor context and Task creation - we loose our actor inheritance. This part boggled me for a while... 

Key factor here (and whole point of complete concurrency checking) is that those things happen at `compile time`.
For me that was **Aha! moment** and something that helped me understand what is going on and what has just changed in `Swift 6.2`.

Tasks do inherit calling actor context, but do so in a compile time, not through runtime. After some consideration it becomes obvious - that is the only way to have reliable and predictable behavior. This also allows to provide compile time safety and certainty when it comes to race conditions. All of this happens because of explicitly marked callback parameter: [@_inheritActorContext](https://github.com/swiftlang/swift/blob/9a0a831b0198e1b794a66316487aacef3d692ca4/docs/ReferenceGuides/UnderscoredAttributes.md#_inheritactorcontext).

Below you can find simple example that shows exactly that:

```swift
final class IsolationCheck {
    @MainActor
    var isolated = false
    
    @MainActor
    func runIsolated() {
        Task {
            isolated.toggle()
            Task {
                isolated.toggle()
            }
            Task.detached {
                self.isolated.toggle() // ❌ error:
                // Main actor-isolated property 'isolated'
                // can not be mutated from a nonisolated context
            }
        }
    }
    
    nonisolated func runNonIsolated() {
        Task {
            isolated.toggle() // ❌ error:
            // Main actor-isolated property 'isolated'
            // can not be mutated from a nonisolated context
            Task { @MainActor in
                isolated.toggle()
                Task {
                    isolated.toggle()
                }
            }
        }
    }
}
```

See that the code above allows me to interact with MainActor isolated property within the task if this task is spawned from within the context of MainActor (which it inherits).
In case I would switch to detached task or did spawn Task outside of MainActor context (see `nonisolated func runNonIsolated()`) I do end up with compiler error. Also if I would fix that, code in that task will run on arbitrary Thread and not on MainActor thread.

All of the above allowed me to understand that there are really two possibilities on how the task will run:
- Either on specific actor through inheritance of its context. 
- Or outside any actor on some thread from cooperative thread pool.

<center>
    <img
        src="/media/blog/swift-task-actor-inheritance/same-same.webp"
        alt="Same same meme"
        width="90%"
    />
</center>

Latest concurrency changes does not affect it at all - behavior stays the same. However since everything gets annotated as MainActor by default, we will most probably end up with our Tasks inheriting this context. You still need to remember however, that there is possibility to spawn a Task that ends up outside of MainActor without @concurrent annotation. This can happen if you create Task from `nonisolated` function, be it `async` or `sync`. This is due to nature of actor context inheritance: at compile time.

That's it!<br>
You can also check out [Task-actor-inheritance](https://github.com/TomaszLizer/swift-concurrency-explorations/tree/Task-actor-inheritance) branch in my repo where I explored those Task behaviors in example iOS app.

<center>
    <picture>
        <source
            srcset="/media/blog/swift-task-actor-inheritance/tasks-explorations-app-dark.webp"
            media="(prefers-color-scheme: dark)"
        />
        <img
            src="/media/blog/swift-task-actor-inheritance/tasks-explorations-app-light.webp"
            alt="Site generated using swift run and SwiftGen plugin"
        />
    </picture>
</center>
