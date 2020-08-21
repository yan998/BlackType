//
//  UIViewController+JMIDark.m
//  JRMagicInsuranceApp
//
//  Created by yan on 2020/5/18.
//  Copyright © 2020 yangln. All rights reserved.
//

#import "UIViewController+JMIDark.h"
#import "JMIShowCoverageManager.h"
#import <objc/message.h>
#import <objc/runtime.h>

@implementation UIViewController (JMIDark)

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(viewDidLoad)), class_getInstanceMethod(self, @selector(jmi_viewDidLoad)));
    if (@available(iOS 13.0, *)) {
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(viewWillAppear:)), class_getInstanceMethod(self, @selector(jmi_viewWillAppear:)));
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(viewDidAppear:)), class_getInstanceMethod(self, @selector(jmi_viewDidAppear:)));
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(traitCollectionDidChange:)), class_getInstanceMethod(self, @selector(jmi_traitCollectionDidChange:)));
    }
}

- (void)jmi_viewDidLoad {
    if (@available(iOS 13.0, *)) {
        // 除了特殊的VC之外，默认将所有的VC的 userInterfaceStyle 变为Light
        if(![self isSystemController]){
            NSLog(@"----%@",[self class]);
            self.userInterfaceStyle = JMIUserInterfaceStyleLight;
        }
    }
    [self jmi_viewDidLoad];
}

// 当前的VC是否是需要过滤的VC
- (BOOL)isSystemController {
    NSArray *array = @[@"UI",@"_",@"WB",@"WLogin",@"PUPhotoPickerHost",@"CAM"];
    NSString *name = [NSString stringWithFormat:@"%@",[self class]];
    BOOL isSystem = NO;
    for (NSInteger i = 0; i < array.count; i++) {
        NSString *subStr = array[i];
        if ([name rangeOfString:subStr].location == 0 && [name rangeOfString:subStr].length > 0) {
            isSystem = YES;
            break;
        }
    }
    return isSystem;
}

- (void)jmi_viewWillAppear:(BOOL)animated {
    if (@available(iOS 13.0, *)) {
        UIUserInterfaceStyle windowUserInterfaceStyle = [UIApplication sharedApplication].delegate.window.traitCollection.userInterfaceStyle;
        if (windowUserInterfaceStyle == UIUserInterfaceStyleDark &&  self.userInterfaceStyle == JMIUserInterfaceStyleLight) {
            [JMIShowCoverageManager showCoverage];
        }
    }
    [self jmi_viewWillAppear:animated];
}

- (void)jmi_viewDidAppear:(BOOL)animated {
    if (@available(iOS 13.0, *)) {
        if (self.userInterfaceStyle != JMIUserInterfaceStyleLight) {
            [JMIShowCoverageManager hiddenCoverage];
        }
    }
    [self jmi_viewDidAppear:animated];
}

- (void)jmi_traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [self jmi_traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        
        UIUserInterfaceStyle windowUserInterfaceStyle = [UIApplication sharedApplication].delegate.window.traitCollection.userInterfaceStyle;
         
        if (windowUserInterfaceStyle == UIUserInterfaceStyleDark && self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
            [JMIShowCoverageManager showCoverage];
        } else {
            [JMIShowCoverageManager hiddenCoverage];
        }
    }
}

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
