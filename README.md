### Debuggles-SAEP

# Debug Safari App Extensions in Xcode

1. Grab this project

2. Add your existing Safari app extension *folder* to this project in Xcode: reference only, don't `copy files as needed`, do `add to targets` *Debuggles*.
 
3. Specify your Safari app extension *class* in AppDelegate.swift.

4. Also speciy your Safari app extension *Nib* name, omitting `.xib`.

5. If necessary, use the `DEBUGGLES` preprocessor flag in your extension
 
 ```swift
 #if DEBUGGLES
 print("this will be ignored in Safari but not in Debuggles")
 #endif

#if !DEBUGGLES
 print("this will be ignored in Debuggles but not in Safari")
 #endif
``` 

Safari app extensions are available in macOS 10.12 and later, and in OS X 10.11. 5 with Safari 10 installed.

Debuggles is available under the *Apache License*, excluding anything in the `AddSafariAppExtensionHere` folder.
