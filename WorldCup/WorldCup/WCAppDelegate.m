//
//  WCAppDelegate.m
//  WorldCup
//
//  Created by eason on 5/29/14.
//  Copyright (c) 2014 eason. All rights reserved.
//

#import "WCAppDelegate.h"
#import "WCViewController.h"
#import "MMProgressHUD.h"
#import "RPUmengConfig.h"
@implementation WCAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    UINavigationController *nav = [[UINavigationController alloc] init];
    nav.navigationBarHidden = YES;
    WCViewController *viewController = [[WCViewController alloc] init];
    if ([language isEqualToString:@"zh-Hant"] || [language isEqualToString:@"zh-Hans"])
    {
        viewController.url = [RPUmengConfig onlineStringForKey:@"beginUrl"];
    }else
    {
        viewController.url = [RPUmengConfig onlineStringForKey:@"beginUrl_en"];
    }
    
    [nav pushViewController:viewController animated:YES];
    self.window.rootViewController = nav;
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

+ (void)initialize
{
    [MobClick startWithAppkey:@"5386c9e356240b1d520086c3" reportPolicy:SEND_INTERVAL channelId:@"AppStore_iOS"];
    [MobClick setAppVersion:@"1.0"];
    [MobClick updateOnlineConfig];
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleExpand];
  
}

@end
