//
//  MRMenu.swift
//  MacRemote
//
//  Created by Tom Hu on 5/1/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

import Cocoa
import AppKit

class MRMenu: NSMenu {
    
    private var preferencesWindowController: MRPreferencesWindowController?;
    
    override init(title aTitle: String) {
        super.init(title: aTitle)
        
        configureMenuItems()
        
        self.preferencesWindowController = MRPreferencesWindowController(windowNibName: "MRPreferencesWindowController");
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Methods

    private func configureMenuItems() {
        // Create menu items
        let preferencesMenuItem: NSMenuItem = NSMenuItem(title: "Open Mac Remote Preferences...", action: #selector(MRMenu.didClickPreferencesMenuItem(_:)), keyEquivalent: "")
        preferencesMenuItem.target = self
        let quitMenuItem: NSMenuItem = NSMenuItem(title: "Quit", action: #selector(MRMenu.didClickQuitMenuItem(_:)), keyEquivalent: "")
        quitMenuItem.target = self
        
        // Add to menu
        self.addItem(preferencesMenuItem)
        self.addItem(NSMenuItem.separatorItem())
        self.addItem(quitMenuItem)
    }
    
    // MARK: - Actions

    func didClickQuitMenuItem(sender: AnyObject?) {
        NSLog("Did click quit menu item")
        NSApplication.sharedApplication().terminate(nil)
    }
    
    func didClickPreferencesMenuItem(sender: AnyObject?) {
        NSLog("Did click preferences menu item")
        NSApp.activateIgnoringOtherApps(true);
        self.preferencesWindowController?.showWindow(self);
    }
    
}
