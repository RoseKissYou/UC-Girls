//
//  AppDelegate+XABeautyFirst.m
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//

#import "AppDelegate+XABeautyFirst.h"
#import "XABeautyBaseListController.h"
//指纹解锁
#import "TouchWindow.h"
@interface AppDelegate ()

@property (nonatomic, strong) TouchWindow *touchWindow;

@end

@implementation AppDelegate (XABeautyFirst)


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //指纹解锁
    self.touchWindow = [[TouchWindow alloc] initWithFrame:self.window.frame];
    [self.touchWindow show];
    XABeautyBaseListController *xafirstList = [[XABeautyBaseListController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:xafirstList];
    self.window.rootViewController = firstNav ;
    [self.window makeKeyAndVisible];
    
    
    
    // Override point for customization after application launch.
    return YES;
}
- (void)enterForeground
{
    NSLog(@"YES");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self.touchWindow show];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

@end
