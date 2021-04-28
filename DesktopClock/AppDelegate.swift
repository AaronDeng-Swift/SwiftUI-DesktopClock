//
//  AppDelegate.swift
//  DesktopClock
//
//  Created by Aaron on 2021/4/27.
//  Copyright © 2021 AaronDeng. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        
//        let contentView = ContentView()
        let contentView = Home()

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        
        window.isReleasedWhenClosed = false
        
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    // MARK: - Below is add
        
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if !flag {
            for window: AnyObject in sender.windows {
                if window.frameAutosaveName == "Main Window" {
                    window.makeKeyAndOrderFront(self)
                }
            }
            return true
        }
        return true
    }

}

let maximumWindowWidth: CGFloat = 1972
let maximumWindowHeight: CGFloat = 1120
