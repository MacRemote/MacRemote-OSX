//
//  MRMenu.swift
//  MacRemote
//
//  Created by Tom Hu on 5/1/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

import Cocoa

class MRMenu: NSMenu {
    override init(title aTitle: String) {
        super.init(title: aTitle)
        
        configureMenuItems()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Methods
    private func configureMenuItems() {
        // Create menu items
        var preferencesMenuItem: NSMenuItem = NSMenuItem(title: "Open Mac Remote Preferences...", action: Selector("didClickPreferencesMenuItem:"), keyEquivalent: "")
        preferencesMenuItem.target = self
        var quitMenuItem: NSMenuItem = NSMenuItem(title: "Quit", action: Selector("didClickQuitMenuItem:"), keyEquivalent: "")
        quitMenuItem.target = self
        
        // Add to menu
        self.addItem(preferencesMenuItem)
        self.addItem(NSMenuItem.separatorItem())
        self.addItem(quitMenuItem)
    }
    
    //MARK: - Actions
    func didClickQuitMenuItem(sender: AnyObject?) {
        NSLog("Did click quit menu item")
        NSApplication.sharedApplication().terminate(nil)
    }
    
    func didClickPreferencesMenuItem(sender: AnyObject?) {
        NSLog("Did click preferences menu item")
    }
}
