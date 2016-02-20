//
//  AppDelegate+XABeautyFirst.m
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//

#import "AppDelegate+XABeautyFirst.h"
#import "XABeautyBaseListController.h"

@implementation AppDelegate (XABeautyFirst)


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    XABeautyBaseListController *xafirstList = [[XABeautyBaseListController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:xafirstList];
    self.window.rootViewController = firstNav    ;
    [self.window makeKeyAndVisible];
    
    
    
    // Override point for customization after application launch.
    return YES;
}


@end
