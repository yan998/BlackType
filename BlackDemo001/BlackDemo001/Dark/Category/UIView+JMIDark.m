//
//  UIView+JMIDark.m
//  BlackDemo001
//
//  Created by yan on 2020/5/27.
//  Copyright © 2020 yan. All rights reserved.
//

#import "UIView+JMIDark.h"
#import <objc/runtime.h>

@implementation UIView (JMIDark)

#pragma mark- set
- (JMIUserInterfaceStyle)userInterfaceStyle {
    NSNumber *number = objc_getAssociatedObject(self, @selector(userInterfaceStyle));
    JMIUserInterfaceStyle style = [number integerValue];
    if (@available(iOS 13.0, *)) {
        style = (JMIUserInterfaceStyle)self.traitCollection.userInterfaceStyle;
    }
    return style;
}

- (void)setUserInterfaceStyle:(JMIUserInterfaceStyle)userInterfaceStyle {
    if (@available(iOS 13.0, *)) {
        self.overrideUserInterfaceStyle = (UIUserInterfaceStyle)userInterfaceStyle;
    }
    objc_setAssociatedObject(self, @selector(userInterfaceStyle), @(userInterfaceStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
