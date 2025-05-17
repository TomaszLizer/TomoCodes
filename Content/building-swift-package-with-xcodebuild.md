---
type: blog
id: building-swift-package-with-xcodebuild
title: Packages, resources, and the fine print
subtitle: How to build and run Swift Package using xcodebuild
image: /media/building-swift-package-with-xcodebuild/header.webp
tags: tip, swift package, xcodebuild
date: 2025-05-16
lastModified: 2025-05-16
---
As I am working on this site (which is build using [Ignite](https://github.com/twostraws/Ignite)) I am encountering interesting problems I haven't faced on a daily basis working with projects in Xcode. Initially I have started working using Xcode, however as I needed to interact with different file types (like markdown) I finally switched to Visual Studio Code. Before I did that however I had already sprinkled this project with Xcode conveniences. One of those especially being assets catalog (`*.xcassets`). I was not only blessed with visual format for working with colors, but at the same time brought compile time safety with `ColorResource`. Cats and rainbows everywhere!

My happiness disappeared quickly when I tried to run my project from command line using `swift run`. I was immediately surrounded by errors like the one below:
```bash
error: type 'ColorResource' has no member 'accent'
```
My first thought was: *"but asset catalogs are supported in packages"*. I had even confirmed my assumptions with [official documentation](https://developer.apple.com/documentation/xcode/bundling-resources-with-a-swift-package) from Apple. My second thought then was: *"right - must be some issue with resource processing, lemme add that"*. And so I did. Shiny new line in Package.swift: `resources: [.process("Resources/Colors.xcassets")]`

And I was happy with it. But `swift run` was not. Still was it angry at me and I didn't ever wanted to bother that poor fella.

So I started searching, reading, looking through obscure parts of docs and xcode release notes. Pieces started falling into place. Common motive here was `xcode`. But hey - was I still naive at that point. Given lack of information about `ColorResource` besides ones associated with Xcode I assumed it is Xcode only feature to autogenerate those nice accessors. Shame, but well - there is our old buddy [SwiftGen](https://github.com/SwiftGen/SwiftGen) and I like him a lot!

And I integrated SwiftGen plugin - this time two new additions to package definition: SwiftGen as package dependency and a plugin of the target. Also needed to create customized stencil templates (as the bundled ones caused all sort of errors) and voila. Almost works. Obviously that couldn't end up being simple and again wild errors appeared.
```bash
error: a prebuild command cannot use executables built from source, including executable target 'swiftgen'
```
Error itself does not made much sense since `swiftgen` is a binaryTarget hence no building from source occurs.
I was unable to find any meaningful solution, so started tinkering. In the end it seems like Xcode 16.3 (and hence Swift 6.1) are to blame. Dropping back to Xcode 16.2 and all is fine.
Here I ended up just using SwiftGenPlugin CLI with and committing generated files to repo.
```bash
swift package --allow-writing-to-package-directory generate-code-for-resources
```

SwiftGen integrated, code compiles and runs - **victory** - one would wish, but not so fast... Again...

It quickly turns out that code compiles and even runs without any interruptions, however page does not look right. 

<center>
    <picture>
        <source
            srcset="/media/building-swift-package-with-xcodebuild/website-broken-colors-dark.webp"
            media="(prefers-color-scheme: dark)"
        />
        <img
            src="/media/building-swift-package-with-xcodebuild/website-broken-colors-light.webp"
            alt="Site generated using swift run and SwiftGen plugin"
            width="90%"
        />
    </picture>
</center>

After building site with `swift run` all colors seems to not exist. And to my surprise it does not cause a crash - just all values are zeros.

At this stage I understood and accepted my fate. I was doomed and forced to use Xcode. Or xcode build system... And all of that time I was missing the *fine print*: Xcode. Every piece of the documentation that related to asset folders, auto-generated `ColorResource` etc - it was all in the context of `Xcode`.

So here it is, topic of this article: how to build Swift Package with xcodebuild? Command required to do that is long and cumbersome, but we don't need to really type it every time. Instead we can just have it as a shell script.
So here we go: `touch buildAndRun.sh`
```bash
#!/bin/bash
appName="TomoCodes"
configuration="debug"
derivedDataPath=".build/derivedData"
    
# Build Swift Code
xcodebuild \
    -configuration $configuration \
    -scheme "$appName" \
    -sdk macosx \
    -destination 'platform=macOS' \
    -derivedDataPath "$derivedDataPath"
   
# Run Site generation
$derivedDataPath/Build/Products/$configuration/$appName
```
Firstly, we do need to build and run in separate steps. In fact xcodebuild only allows us to build the package as the name implies. Later we need to run our build artifacts. In my case it is fairly simple.
1. Build main target of my Ignite project, for that I need to specify few things:
    - `configuration` - `debug` or `release`
    - `scheme` - this will be name of the target you wish to build
    - `sdk` - for me this is macosx 
        - list available sdks using `xcodebuild build -scheme <your-scheme> -showsdks`
        - go generic (`macosx`) or constrain to more specific sdk (`macosx15.4`)
    - `destination` - this will depend on the sdk chosen, tells where you will run your app
        - list available destinations using `xcodebuild build -scheme <your-scheme> -showdestinations`
        - go generic (`platform=macOS`) or constrain to specific destination (`platform=macOS,arch=arm64`)
    - `derivedDataPath` - key argument - it allows us to easily find and run build products. It can be full or relative path.
2. Next step is to actually run Product of the build. For me it is simple as I just run executable. In case of iOS you will also have to select specific destination, install app and run it.

Now this little script reminds me of my mistake, but alongside that ride comes some learnings.
For me main one would be: never ever trust files with `xc` file extension prefix.
Most probably in the future I will look into updating my color setup not to depend on xcodebuild, but for now at least I can conveniently work from VS Code.

