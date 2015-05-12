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
class AppDelegate: NSObject, NSApplicationDelegate, NSNetServiceDelegate {

    private var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        NSLog("Running...")
        
        // Insert code here to initialize your application
        self.statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1) // 本来应该用 NSVariableStatusItemLength，但是会引起linker error，只好换成-1，不清楚具体为什么
        self.statusItem.image = NSImage(named: "bat23")
        self.statusItem.highlightMode = true
        self.statusItem.menu = MRMenu(title: "Test")
        
        // Configure Bonjour
        self.configureBoujour();
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        NSLog("Terminating...")
    }
    
    // MARK: Bonjour
    private func configureBoujour() {
        var bonjourService: NSNetService = NSNetService(domain: "local.", type: "_http._tcp.", name: "MacRemoteWebService", port: 0);
        bonjourService.delegate = self;
        bonjourService.publishWithOptions(NSNetServiceOptions.ListenForConnections);
    }
    
    // MARK: NSNetServiceDelegate
    func netServiceWillPublish(sender: NSNetService) {
        NSLog("Net Service Will Publish!");
    }
    
    func netServiceDidPublish(sender: NSNetService) {
        NSLog("Net Service Did Publish!");
        NSLog("Port: %d", sender.port);
    }
    
    func netService(sender: NSNetService, didNotPublish errorDict: [NSObject : AnyObject]) {
        NSLog("Net Service Did Not Publish!");
        NSLog("Error: %@", errorDict);
    }
    
    func netServiceWillResolve(sender: NSNetService) {
        NSLog("Net Service Will Resolve!");
    }

    func netServiceDidResolveAddress(sender: NSNetService) {
        NSLog("Net Service Did Resolve Address!");
    }
    
    func netService(sender: NSNetService, didNotResolve errorDict: [NSObject : AnyObject]) {
        NSLog("Net Service Did Not Resolve!");
        NSLog("Error: %@", errorDict);
    }
    
    func netServiceDidStop(sender: NSNetService) {
        NSLog("Net Service Did Stop!");
    }
    
    func netService(sender: NSNetService, didUpdateTXTRecordData data: NSData) {
        NSLog("Net Service Did Update TXT Record Data!");
        NSLog("Data: %@", data);
    }
    
    func netService(sender: NSNetService, didAcceptConnectionWithInputStream inputStream: NSInputStream, outputStream: NSOutputStream) {
        NSLog("Net Service Did Accept Connection With Input Stream!");
        NSLog("Input Stream: ", inputStream);
        NSLog("Output Stream: ", outputStream);
    }

}

