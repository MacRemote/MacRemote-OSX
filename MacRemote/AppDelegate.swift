//
//  AppDelegate.swift
//  MacRemote
//
//  Created by Tom Hu on 5/1/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

import Cocoa
import AppKit
import MRFoundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, MRRemoteControlServerDelegate {

    private var statusItem: NSStatusItem!

    // MARK: - Application Life Circle
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        println("Running...")
        
        self.configureStatusItem()
        
        MRRemoteControlServer.sharedServer.delegate = self
        MRRemoteControlServer.sharedServer.startBroadCasting()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        println("Terminating...")
    }

    // MARK: - UI Methods
    
    private func configureStatusItem() {
        self.statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1) // 本来应该用 NSVariableStatusItemLength，但是会引起linker error，只好换成-1，不清楚具体为什么
        self.statusItem.menu = MRMenu(title: "Test")
        
        self.statusItem.button?.image = NSImage(named: "bat23")
    }
    
    // MARK: - MRRemoteControlServerDelegate
    
    func remoteControlServerDidReceiveEvent(event: MREvent) {
        MRSystemController.dispatchEvent(event)
    }

}

