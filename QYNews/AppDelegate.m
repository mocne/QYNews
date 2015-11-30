//
//  AppDelegate.m
//  QYNews
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "AppDelegate.h"
#import "QYNewsViewController.h"
#import "QYReaderViewController.h"
#import "QYDiscoverViewController.h"
#import "QYMeViewController.h"
#import "QYVideoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window = window;
    _window.backgroundColor = [UIColor whiteColor];
    _window.hidden = 0;
    
    
    QYNewsViewController *newsVC = [[QYNewsViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:newsVC];
    
    QYReaderViewController *readerVC = [[QYReaderViewController alloc] init];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:readerVC];
    
    QYVideoViewController *videoVC = [[QYVideoViewController alloc] init];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:videoVC];
    
    QYDiscoverViewController *discoverVC = [[QYDiscoverViewController alloc] init];
    UINavigationController *fourthNav = [[UINavigationController alloc] initWithRootViewController:discoverVC];
    
    QYMeViewController *profileVC = [[QYMeViewController alloc] init];
    UINavigationController *fifthNav = [[UINavigationController alloc] initWithRootViewController:profileVC];
    
    NSArray *viewControllers = @[firstNav,secondNav,thirdNav,fourthNav,fifthNav];
    
    UITabBarController *mainViewController = [[UITabBarController alloc] init];
    mainViewController.viewControllers = viewControllers;
    
    mainViewController.tabBar.tintColor = [UIColor colorWithRed:94/255.0 green:211/255.0 blue:44/255.0 alpha:1.0];
    _window.rootViewController = mainViewController;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
