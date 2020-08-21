//
//  JMIShowCoverageManager.m
//  JRMagicInsuranceApp
//
//  Created by yan on 2020/5/19.
//  Copyright © 2020 yangln. All rights reserved.
//

#import "JMIShowCoverageManager.h"
@interface JMIShowCoverageManager()

@end

@implementation JMIShowCoverageManager

/// 在所有页面之上展示一层阴影
+ (void)showCoverage {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIView *coverageView = [window viewWithTag:-999];
    if (!coverageView) {
        coverageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JMIMainW, JMIMainH)];
        coverageView.backgroundColor = JMIColorAlpha(0x000000, 0.5);
        coverageView.tag = -999;
        // 保证显示在最上面
        coverageView.layer.zPosition = 9999;
        coverageView.userInteractionEnabled = NO;
        [window addSubview:coverageView];
    } else {
        coverageView.hidden = NO;
    }
}

/// 隐藏最上层展示的阴影
+ (void)hiddenCoverage {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIView *coverageView = [window viewWithTag:-999];
    coverageView.hidden = YES;
}

@end
