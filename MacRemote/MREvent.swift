//
//  MREvent.swift
//  MacRemote
//
//  Created by Tom Hu on 6/16/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

import Cocoa

enum MREventType: Int {
    // Volume
    case VolumeUp
    case VolumeDown
    case VolumeMute
    
    // Mouse
    case LeftMouseDown
    case LeftMouseUp
    case RightMouseDown
    case RightMouseUp
    case MouseClick
    
    // Keyboard
    case KeyDown
    case KeyUp
    
    // Brightness
    case BrightnessLighten
    case BrightnessDarken
    
    // Zoom
    case ZoomIn
    case ZoomOut
}

class MREvent: NSObject, NSCoding, NSSecureCoding {
    
    var eventType: MREventType!
    var message: String!
    
    // MARK: - NSCoding
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
        
        self.eventType = MREventType(rawValue: aDecoder.decodeIntegerForKey("eventType"))
        self.message = aDecoder.decodeObjectForKey("message") as String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(self.eventType.rawValue, forKey: "eventType")
        aCoder.encodeObject(self.message, forKey: "message")
    }
    
    // MARK: - NSSecureCoding
    
    class func supportsSecureCoding() -> Bool {
        return true
    }
    
}
