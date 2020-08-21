//
//  JMIDarkSwitchManager.m
//  BlackDemo001
//
//  Created by yan on 2020/6/4.
//  Copyright © 2020 yan. All rights reserved.
//

#import "JMIDarkSwitchManager.h"

@implementation JMIDarkSwitchManager

+ (void)setWindowDarkModeSwitch {
    if (@available(iOS 13.0, *)) {
        // 设置暗黑模式开关，默认是跟随系统变化
        NSString *systemSwitchValue = [[NSUserDefaults standardUserDefaults] objectForKey:@"systemSwitchValue"];
        // 如果从来没有设置过开关，默认为开
        if (!systemSwitchValue.length) {
            // 默认跟随系统变化
            [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"systemSwitchValue"];
        } else if(![systemSwitchValue boolValue]) {
            // 没有跟随系统变化
            // 获取暗黑模式开关标识
            NSString *darkSwitch = [[NSUserDefaults standardUserDefaults] objectForKey:@"darkSwitchValue"];
            UIWindow *window = [UIApplication sharedApplication].delegate.window;
            if ([darkSwitch boolValue]) {
                window.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
            } else {
                window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
            }
        }
    }
}

@end
