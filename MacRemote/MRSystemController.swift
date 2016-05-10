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
        let eventType: MREventType = event.eventType
        switch eventType {
        // Sound
        case MREventType.SoundUp:
            MRKeyboardController.soundUp()
        case MREventType.SoundDown:
            MRKeyboardController.soundDown()
        case MREventType.SoundMute:
            MRKeyboardController.soundMute()
            
        // Brightness
        case MREventType.BrightnessUp:
            MRKeyboardController.brightnessUp()
        case MREventType.BrightnessDown:
            MRKeyboardController.brightnessDown()
        
        // Illumination
        case MREventType.IlluminationUp:
            MRKeyboardController.illuminationUp()
        case MREventType.IlluminationDown:
            MRKeyboardController.illuminationDown()
        case MREventType.IlluminationToggle:
            MRKeyboardController.illuminationToggle()
        default:
            print("Default")
        }
    }
    
}
