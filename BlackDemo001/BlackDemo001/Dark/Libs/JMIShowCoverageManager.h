//
//  JMIShowCoverageManager.h
//  JRMagicInsuranceApp
//
//  Created by yan on 2020/5/19.
//  Copyright © 2020 yangln. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 用于适配暗黑模式，如果项目开启了暗黑模式，但是当前界面没有适配，添加/隐藏一层阴影
@interface JMIShowCoverageManager : NSObject

/// 在所有页面之上展示一层阴影
+ (void)showCoverage;

/// 隐藏最上层展示的阴影
+ (void)hiddenCoverage;

@end

NS_ASSUME_NONNULL_END
