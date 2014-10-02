//
//  CodeCamp.m
//  alert
//
//  Created by codeCamp on 2/10/2014.
//  Copyright (c) 2014 codeCamp. All rights reserved.
//

#import "CodeCamp.h"

@implementation CodeCamp

#pragma mark - NSUserDefaults

+ (void)setHighScore:(int)score
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:score] forKey:@"highScore"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"Saved high score: %d",score);
}

+ (int)getHighScore
{
    int highScore = [[[NSUserDefaults standardUserDefaults] objectForKey:@"highScore"] intValue];
    NSLog(@"The high score is %d",highScore);
    return highScore;
}

+ (NSString *)getHighScoreString
{
    int highScore = [[[NSUserDefaults standardUserDefaults] objectForKey:@"highScore"] intValue];
    NSString *score = [NSString stringWithFormat:@"High Score: %d",highScore];
    return score;
}

+ (void)setPlayerCharacter:(NSString *)character
{
    [[NSUserDefaults standardUserDefaults] setObject:character forKey:@"character"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getPlayerCharacter
{
    NSString *character = [[NSUserDefaults standardUserDefaults] objectForKey:@"character"];
    NSLog(@"Selected character is: %@",character);
    return character;
}

+ (void)setInt:(int)val forProperty:(NSString*)property
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:val] forKey:property];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"Set %@ to %d",property,val);
}

+ (void)setFloat:(float)val forProperty:(NSString*)property
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:val] forKey:property];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"Set %@ to %f",property,val);
}

+ (void)setString:(NSString*)val forProperty:(NSString*)property
{
    [[NSUserDefaults standardUserDefaults] setObject:val forKey:property];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"Set %@ to %@",property,val);
}

+ (int)getIntForProperty:(NSString *)property
{
    int val = [[[NSUserDefaults standardUserDefaults] objectForKey:property] intValue];
    return val;
}

+ (float)getFloatForProperty:(NSString *)property
{
    float val = [[[NSUserDefaults standardUserDefaults] objectForKey:property] floatValue];
    return val;
}

+ (NSString *)getStringForProperty:(NSString *)property
{
    NSString *val = [[NSUserDefaults standardUserDefaults] objectForKey:property];
    return val;
}

+ (void)incrementLaunchCount
{
    NSUserDefaults *countDefaults;
    long launchCount;
    
    countDefaults = [NSUserDefaults standardUserDefaults];
    launchCount = [countDefaults integerForKey:@"launchCount" ] + 1;
    [countDefaults setInteger:launchCount forKey:@"launchCount"];
    [countDefaults synchronize];
}

+ (void)addToRunningScore:(int)score
{
    int currentScore = (int)[[[NSUserDefaults standardUserDefaults] objectForKey:@"runningScore"] integerValue];
    score += currentScore;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:score] forKey:@"runningScore"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (int)getRunningScore
{
    int highScore = [[[NSUserDefaults standardUserDefaults] objectForKey:@"runningScore"] intValue];
    NSLog(@"The high score is %d",highScore);
    return highScore;
}

+ (NSString *)getRunningScoreString
{
    int runningScore = [[[NSUserDefaults standardUserDefaults] objectForKey:@"runningScore"] intValue];
    NSString *score = [NSString stringWithFormat:@"Score: %d",runningScore];
    return score;
}

#pragma mark - Interface

+ (CGRect)randomFrameForButton:(UIButton*)button inView:(UIView *)view
{
    int randomHeightInt = roundf(view.frame.size.height - button.frame.size.height)-50;
    int randomWidthInt = roundf(view.frame.size.width - button.frame.size.width) - 20;
    int randomHeight = arc4random() %randomHeightInt + 50;
    int randomWidth = arc4random() % randomWidthInt + 20;
    
    CGRect frame = CGRectMake(randomWidth,
                              randomHeight,
                              button.frame.size.width,
                              button.frame.size.height );
    return frame;
}

+ (void)setTitle:(NSString *)string forButton:(UIButton *)button
{
    [button setTitle:string forState:UIControlStateNormal];
}


+ (void)setLabel:(UILabel*)label textValue:(NSString *)text
{
    label.text = [NSString stringWithFormat:@"%@",text];
}

+ (void)hideButton:(UIButton *)button
{
    button.hidden = YES;
}

+ (void)showButton:(UIButton *)button
{
    button.hidden = NO;
}

+ (void)setViewColor:(UIColor *)color
{
    CCAppDelegate *appDelegate = (CCAppDelegate *)[[UIApplication sharedApplication] delegate];
    CCViewController *mainController = (CCViewController *) appDelegate.window.rootViewController;
    mainController.view.backgroundColor = color;
}

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - Math

+ (int)getRandomInt:(int)upperLimit
{
    int colourNumber = abs((int)arc4random() % upperLimit);
    return colourNumber;
}

+ (float)getRandomFloat:(int)upperLimit
{
    float colourNumber = abs(arc4random() % upperLimit);
    return colourNumber;
}

#pragma mark - Device

+ (void)preventSleep
{
    [UIApplication sharedApplication].idleTimerDisabled = YES;
}

+ (void)allowSleep
{
    [UIApplication sharedApplication].idleTimerDisabled = NO;
}

+ (void)vibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+ (void)setBadgeNumber:(int)num
{
    [UIApplication sharedApplication].applicationIconBadgeNumber = num;
}

+ (void)createSoundFromFileNamed:(NSString*)filename withSoundID:(SystemSoundID*)ID
{
    NSString *popPath = [[NSBundle mainBundle]
                         pathForResource:filename ofType:@"mp3"];
    NSURL *popPathURL = [NSURL fileURLWithPath:popPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)popPathURL,
                                     ID);
}

+ (void)playSound:(SystemSoundID*)ID
{
    AudioServicesPlaySystemSound(*ID);
}

+ (BOOL)checkIfOnIpad
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return TRUE;
    } else {
        return FALSE;
    }
}







@end