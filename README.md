### Debuggles-SAEP

# Debug Safari App Extensions in Xcode

1. Grab this project

2. Add your existing Safari App Extension *folder* to this project in Xcode: reference only, don't `copy files as needed`, do `add to targets` *Debuggles*.
 
3. Specify your Safari App Extension *class* in AppDelegate.swift.

4. Also speciy your Safari App Extension *Nib* name, omitting `.xib`.

5. If necessary, use the `DEBUGGLES` preprocessor flag in your extension
 
 ```swift
 #if DEBUGGLES
 print("this will be ignored in Safari but not in Debuggles")
 #endif

#if !DEBUGGLES
 print("this will be ignored in Debuggles but not in Safari")
 #endif
``` 
