//
//  MRKeyboardUtil.h
//  MacRemote
//
//  Created by Tom Hu on 7/15/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

#ifndef MacRemote_MRKeyboardUtil_h
#define MacRemote_MRKeyboardUtil_h

@import Foundation;

typedef NS_ENUM(NSUInteger, MRKey) {
    MRKeySoundUp = NX_KEYTYPE_SOUND_UP,
    MRKeySoundDown = NX_KEYTYPE_SOUND_DOWN,
    MRKeySoundMute = NX_KEYTYPE_MUTE,
    MRKeyBrightnessUp = NX_KEYTYPE_BRIGHTNESS_UP,
    MRKeyBrightnessDown = NX_KEYTYPE_BRIGHTNESS_DOWN,
    MRKeyIlluminationUp = NX_KEYTYPE_ILLUMINATION_UP,
    MRKeyIlluminationDown = NX_KEYTYPE_ILLUMINATION_DOWN,
    MRKeyIlluminationToggle = NX_KEYTYPE_ILLUMINATION_TOGGLE,
};

void hitKey(MRKey keyType);

#endif
