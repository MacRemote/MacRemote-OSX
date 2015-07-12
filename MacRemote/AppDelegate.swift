//
//  AppDelegate.swift
//  MacRemote
//
//  Created by Tom Hu on 5/1/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

import Cocoa
import AppKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private var statusItem: NSStatusItem!
    private var remoteControlServer: MRRemoteControlServer!

    // MARK: - Application Life Circle
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        println("Running...")
        
        self.configureStatusItem()
        
//        self.remoteControlServer = MRRemoteControlServer.sharedServer
        self.remoteControlServer = MRRemoteControlServer()
        self.remoteControlServer.startBroadCasting()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        println("Terminating...")
    }

    // MARK: - UI Methods
    
    private func configureStatusItem() {
        self.statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1) // 本来应该用 NSVariableStatusItemLength，但是会引起linker error，只好换成-1，不清楚具体为什么
        self.statusItem.image = NSImage(named: "bat23")
        self.statusItem.highlightMode = true
        self.statusItem.menu = MRMenu(title: "Test")
    }

}

