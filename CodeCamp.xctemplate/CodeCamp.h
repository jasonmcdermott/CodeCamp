//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreData/CoreData.h>
#import <CFNetwork/CFNetwork.h>
#import <Security/Security.h>
#import <CoreGraphics/CoreGraphics.h>
#import <SpriteKit/SpriteKit.h>

#import "AppDelegate.h"
#import "ViewController.h"
#import "Constants.h"

@interface CodeCamp : NSObject

#pragma mark - NSUserDefaults
+ (void)saveHighScore:(int)score;
+ (int)getHighScore;
+ (NSString *)getHighScoreString;

+ (void)incrementLaunchCount;

+ (void)addToRunningScore:(int)score;
+ (int)getRunningScore;
+ (NSString *)getRunningScoreString;

#pragma mark - Math
+ (int)getRandomInt:(int)upperLimit;
+ (float)getRandomFloat:(int)upperLimit;

#pragma mark - Interface
+ (void)setLabel:(UILabel*)label textValue:(NSString *)text;
+ (CGRect)randomFrameForButton:(UIButton*)button inView:(UIView *)view;
+ (void)setTitle:(NSString *)string forButton:(UIButton *)button;
+ (void)hideButton:(UIButton *)button;
+ (void)showButton:(UIButton *)button;
+ (void)setViewColor:(UIColor *)color;

#pragma mark - Device
+ (void)allowSleep;
+ (void)preventSleep;
+ (void)vibrate;
+ (void)setBadgeNumber:(int)num;
+ (BOOL)checkIfOnIpad;

/* don't forget to send 'references' not 'pointers.
    e.g. [CodeCamp createSoundFromFileNamed:@"filename" withSoundID:&(sound)];
*/
+ (void)createSoundFromFileNamed:(NSString*)filename withSoundID:(SystemSoundID*)ID;

+ (void)playSound:(SystemSoundID*)ID;


@end

