//
//  CodeCamp.h
//  alert
//
//  Created by codeCamp on 2/10/2014.
//  Copyright (c) 2014 codeCamp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreData/CoreData.h>
#import <CFNetwork/CFNetwork.h>
#import <Security/Security.h>
#import <CoreGraphics/CoreGraphics.h>
#import <SpriteKit/SpriteKit.h>

#import "CCAppDelegate.h"
#import "CCViewController.h"
#import "CCConstants.h"

@interface CodeCamp : NSObject

#pragma mark - NSUserDefaults
+ (void)setHighScore:(int)score;
+ (int)getHighScore;
+ (NSString *)getHighScoreString;
+ (void)setPlayerCharacter:(NSString *)character;
+ (NSString *)getPlayerCharacter;
+ (void)setInt:(int)val forProperty:(NSString*)property;
+ (void)setFloat:(float)val forProperty:(NSString*)property;
+ (void)setString:(NSString*)string forProperty:(NSString*)property;
+ (int)getIntForProperty:(NSString*)property;
+ (float)getFloatForProperty:(NSString*)property;
+ (NSString *)getStringForProperty:(NSString*)property;
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
+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString*)message;

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

