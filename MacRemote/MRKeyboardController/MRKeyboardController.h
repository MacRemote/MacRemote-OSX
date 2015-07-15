//
//  MRKeyboardController.h
//  MacRemote
//
//  Created by Tom Hu on 7/15/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRKeyboardController : NSObject

+ (void)soundUp;
+ (void)soundDown;
+ (void)soundMute;
+ (void)brightnessUp;
+ (void)brightnessDown;
+ (void)illuminationUp;
+ (void)illuminationDown;
+ (void)illuminationToggle;

@end
