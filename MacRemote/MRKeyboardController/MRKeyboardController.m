//
//  MRKeyboardController.m
//  MacRemote
//
//  Created by Tom Hu on 7/15/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

#import "MRKeyboardController.h"
#import "MRKeyboardUtil.h"

@implementation MRKeyboardController

+ (void)soundUp {
    hitKey(MRKeySoundUp);
}

+ (void)soundDown {
    hitKey(MRKeySoundDown);
}

+ (void)soundMute {
    hitKey(MRKeySoundMute);
}

+ (void)brightnessUp {
    hitKey(MRKeyBrightnessUp);
}

+ (void)brightnessDown {
    hitKey(MRKeyBrightnessDown);
}

+ (void)illuminationUp {
    hitKey(MRKeyIlluminationUp);
}

+ (void)illuminationDown {
    hitKey(MRKeyIlluminationDown);
}

+ (void)illuminationToggle {
    hitKey(MRKeyIlluminationToggle);
}

@end
