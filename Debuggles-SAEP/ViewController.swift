//
//  ViewController.swift
//  Debuggles-SAEP
//
//  Created by AK on 8/8/20.
//

import Cocoa

class ViewController: NSViewController {

    var vc:NSViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let dx = DebugglesX()
        vc = dx.popoverViewController()
        
        #if !DEBUGGLES
        print("Debuggles not found")
        #else
        print("Welcome to Debuggles for debugging Safari App Extension Popups")
        #endif
        
        var nibObjects: NSArray?
        let nibName = NSNib.Name(stringLiteral: DebugglesX.nibName)
        
        if !Bundle.main.loadNibNamed(nibName, owner: vc, topLevelObjects: &nibObjects) || nibObjects == nil {
            print("Nib Not Found (\(nibName))")
            return
        }
        
        let viewObjects = nibObjects!.filter { $0 is NSView }
        
        if viewObjects.count == 0 {
            print("Nib is Empty (\(nibName))")
            return
        }
        
        guard let view = viewObjects[0] as? NSView else {
            print("Object in Nib is Not NSView (\(nibName))")
            return
        }
        
        self.view.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        vc?.viewDidLoad()
        
        // could call dx.toolbarItemClicked(in:ds) but it seems not that trivial
    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
        vc?.viewDidLayout()
    }
    override func viewDidAppear() {
        super.viewDidAppear()
        vc?.viewDidAppear()
    }
    override func viewDidDisappear() {
        super.viewDidDisappear()
        vc?.viewDidDisappear()
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        vc?.viewWillAppear()
    }
    override func viewWillLayout() {
        super.viewWillLayout()
        vc?.viewWillLayout()
    }
    override func viewWillDisappear() {
        super.viewWillDisappear()
        vc?.viewWillDisappear()
    }
    override func viewWillTransition(to newSize: NSSize) {
        super.viewWillTransition(to: newSize)
        vc?.viewWillTransition(to: newSize)
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
        vc?.updateViewConstraints()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            super.representedObject = representedObject
            vc?.representedObject = representedObject
        }
    }
    
    


}

