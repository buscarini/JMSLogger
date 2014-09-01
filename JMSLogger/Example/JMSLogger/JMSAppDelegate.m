//
//  JMSAppDelegate.m
//  JMSLogger
//
//  Created by CocoaPods on 08/29/2014.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

#import "JMSAppDelegate.h"

#import <CocoaLumberjack/CocoaLumberjack.h>
#import <JMSLogger/JMSLogger.h>

static const int ddLogLevel = LOG_LEVEL_ERROR;


@implementation JMSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	id logger = [JMSLogger new];

	[DDLog addLogger:logger withLogLevel:LOG_LEVEL_ALL];
	[DDLog addLogger:[DDASLLogger new]];
	[DDLog addLogger:[DDTTYLogger new]];
	
	NSString *errorMessage1 = @"Error 1";
	DDLogError(errorMessage1);
	
	NSString *errorMessage2 = @"Error 2";
	DDLogError(errorMessage2);
	
	DDLogDebug(@"A debug message");
	
	DDLogInfo(@"This would be an info message");
	
	DDLogWarn(@"Be carefull - warning message");
	
//	NSArray *messages = [logger logMessagesWithLevel:LOG_LEVEL_ALL];
	
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
