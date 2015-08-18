//
//  MRPreferencesWindowController.swift
//  MacRemote
//
//  Created by Tom Hu on 5/8/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

import Cocoa

class MRPreferencesWindowController: NSWindowController {

    // MARK: Life Circle
    
    override func windowDidLoad() {
        super.windowDidLoad()
        NSLog("Preferences window did load");
        
        self.configurePreferenceWindow()
    }
    
    // MARK: - UI Methods
    
    private func configurePreferenceWindow() {
        if let _window = self.window {
            _window.opaque = false
            _window.alphaValue = 0.9
            _window.titlebarAppearsTransparent = true
        }
    }
    
}
