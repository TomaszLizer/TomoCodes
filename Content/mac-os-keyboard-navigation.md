---
type: blog
title: Tab, Space, Done
subtitle: Stay in the flow with macOS Keyboard navigation
id: mac_os_keyboard_navigation
tags: tip, productivity, macos
image: /media/mac-os-keyboard-navigation/header.webp
imageDescription: "Cozy 16-bit pixel-art banner showing three oversized keyboard keys: tab, shift, space"
date: 2025-05-13
lastModified: 2025-05-13
---

How often have you stumbled on some dialog in your flow that completely destroys it? Maybe there is no preselected option, or the one that is highlighted is not the one you want to go with? Recently as I try to stay on keyboard as long as possible I started hitting the wall in some places. Context change from keyboard to mouse is slow and inefficient and it started bothering me.
My typical breakpoint of such type is file deletion in Xcode. Depending on the file type you will be deleting you can face one of those dialogs:

- Group item dialog: **remove reference**, delete or cancel.
  - Remove reference is preselected option you can confirm with enter.
- Folder item dialog: delete file or cancel.
  - No preselected option, cannot fully delete with keyboard.

<center>
    <video class="theme-aware-video" autoplay loop muted playsinline defaultmuted width="90%">
    <source src="/media/mac-os-keyboard-navigation/kn_disabled-light.mp4" type="video/mp4" media="(prefers-color-scheme:light)">
    <source src="/media/mac-os-keyboard-navigation/kn_disabled-dark.mp4" type="video/mp4" media="(prefers-color-scheme:dark)">
    <h4>Your browser does not support video tag</h4>
    </video>
</center>

In case you pressed delete accidentally nothing happened - you just press `esc` and go on with your life. If you do intend to delete this file however - you may be lucky or not, depending on the intention and case you happened to fall into. That is only in case you want to remove reference to some file in group. For me this happens rarely.

Fortunately there is easy fix for that: **Keyboard Navigation**. It allows to easily move focus between controls and confirm selection only using keyboard.

You can enable this option in `System Preferences` **->** `Keyboard` **->** `Keyboard navigation`.

<center>
    <picture>
        <source
            srcset="/media/mac-os-keyboard-navigation/keyboard-navigation-settings-dark.webp"
            media="(prefers-color-scheme: dark)"
        />
        <img
            src="/media/mac-os-keyboard-navigation/keyboard-navigation-settings-light.webp"
            alt="System settings - Keyboard navigation"
            width="90%"
        />
    </picture>
</center>

In order to use this feature you need to remember only three things: tab, space, done ;)
Tap `tab` and you will jump to the next control, press `tab + shift` and you will go to the previous control instead. Then if you made your choice - click on `space` and highlighter control will be pressed same as if you have used cursor. Neat!

<center>
    <video class="theme-aware-video" autoplay loop muted playsinline defaultmuted width="90%">
    <source src="/media/mac-os-keyboard-navigation/kn_enabled-light.mp4" type="video/mp4" media="(prefers-color-scheme:light)">
    <source src="/media/mac-os-keyboard-navigation/kn_enabled-dark.mp4" type="video/mp4" media="(prefers-color-scheme:dark)">
    <h4>Your browser does not support video tag</h4>
    </video>
</center>

This simple change unlocks possibility to stay in the flow without leaving your keyboard! 😻
Hope this little tip helps you become a bit more productive.
