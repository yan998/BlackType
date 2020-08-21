//
//  UIColor+JMIDark.h
//  JRMagicInsuranceApp
//
//  Created by yan on 2020/5/18.
//  Copyright © 2020 yangln. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 适配暗黑模式 UIColor 的分类
@interface UIColor (JMIDark)

/// 根据不同的UIUserInterfaceStyle生成颜色
/// @param lightColor lightColor
/// @param darkColor darkColor
+ (UIColor *)colorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;

@end

NS_ASSUME_NONNULL_END
