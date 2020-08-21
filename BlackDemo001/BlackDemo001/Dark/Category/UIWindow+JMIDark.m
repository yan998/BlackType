//
//  UIWindow+JMIDark.m
//  BlackDemo001
//
//  Created by yan on 2020/6/3.
//  Copyright © 2020 yan. All rights reserved.
//

#import "UIWindow+JMIDark.h"

@implementation UIWindow (JMIDark)
+ (void)load {
    [self manageNotification];
}

+ (void)manageNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showWindow:) name:UIWindowDidBecomeVisibleNotification object:nil];
}

+ (void)showWindow:(NSNotification *)notification {
    UIWindow *window = notification.object;
    if ([window isKindOfClass:[UIWindow class]]) {
        window.userInteractionEnabled = JMIUserInterfaceStyleLight;
    }
}

@end
