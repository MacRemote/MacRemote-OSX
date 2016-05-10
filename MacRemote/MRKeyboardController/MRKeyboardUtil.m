//
//  MRKeyboardUtil.m
//  MacRemote
//
//  Created by Tom Hu on 7/15/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

#import "MRKeyboardUtil.h"

@import Cocoa;
@import Carbon;

#define kKeyDOWN 0xa
#define kKeyUP 0xb

typedef NS_ENUM(uint32, MROSEventType) {
    MROSEventTypeKeyUp = kCGEventKeyUp,
    MROSEventTypeKeyDown = kCGEventKeyDown,
};

void hitSpecialKey(MRKey key);
void doHitSpecialKey(MRKey key, MROSEventType eventType);

#pragma mark - Implementation

void hitSpecialKey(MRKey key) {
    doHitSpecialKey(key, MROSEventTypeKeyDown);
    doHitSpecialKey(key, MROSEventTypeKeyUp);
}

void doHitSpecialKey(MRKey key, MROSEventType eventType) {
    NSEvent *event = [NSEvent otherEventWithType:NSSystemDefined location:CGPointMake(0, 0) modifierFlags:eventType << 2 timestamp:0 windowNumber:0 context:NULL subtype:8 data1:(key << 16 | eventType << 8) data2:-1];
    
    CGEventRef cgEvent = [event CGEvent];
    
    CGEventPost(kCGSessionEventTap, cgEvent);

#if !__has_feature(objc_arc)
    CFRelease(cgEvent);
#endif
}

void hitKey(MRKey key) {
    switch (key) {
        case MRKeySoundUp:
        case MRKeySoundDown:
        case MRKeySoundMute:
        case MRKeyBrightnessUp:
        case MRKeyBrightnessDown:
        case MRKeyIlluminationUp:
        case MRKeyIlluminationDown:
        case MRKeyIlluminationToggle:
            hitSpecialKey(key);
            break;
            
        default:
            break;
    }
}
