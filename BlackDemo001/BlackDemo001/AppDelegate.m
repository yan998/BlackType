//
//  AppDelegate.m
//  BlackDemo001
//
//  Created by yan on 2020/5/13.
//  Copyright © 2020 yan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 设置当前DarkMode开关
    [JMIDarkSwitchManager setWindowDarkModeSwitch];
    
    return YES;
}


@end
