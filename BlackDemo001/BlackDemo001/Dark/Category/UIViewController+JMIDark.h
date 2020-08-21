//
//  UIViewController+JMIDark.h
//  JRMagicInsuranceApp
//
//  Created by yan on 2020/5/18.
//  Copyright © 2020 yangln. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMIShowStyleBaseLib.h"
NS_ASSUME_NONNULL_BEGIN

/// 适配暗黑模式 UIViewController 的分类
@interface UIViewController (JMIDark)

/// UIUserInterfaceStyle 对应的转化枚举
@property (nonatomic, assign) JMIUserInterfaceStyle userInterfaceStyle;

@end

NS_ASSUME_NONNULL_END
