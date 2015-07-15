//
//  MRSystemController.swift
//  MacRemote
//
//  Created by Tom Hu on 6/16/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

import Cocoa
import MRFoundation

class MRSystemController: NSObject {

    class func dispatchEvent(event: MREvent) {
        var eventType: MREventType = event.eventType
        switch eventType {
        case MREventType.SoundUp:
            MRKeyboardController.soundUp()
            println("Sound Up")
        case MREventType.SoundDown:
            MRKeyboardController.soundDown()
            println("Sound Down")
        default:
            println("Default")
        }
    }
    
}
