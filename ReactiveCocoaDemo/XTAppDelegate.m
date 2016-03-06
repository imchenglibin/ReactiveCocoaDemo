//
//  AppDelegate.m
//  ReactiveCocoaDemo
//
//  Created by imchenglibin on 16/3/4.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import "XTAppDelegate.h"
#import "XTLogInViewController.h"

@interface XTAppDelegate ()

@end

@implementation XTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *rootController = [[XTLogInViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootController];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
