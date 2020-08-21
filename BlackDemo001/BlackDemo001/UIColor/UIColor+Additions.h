//
//  UIColor+Additions.h
//  JRMagicInsuranceApp
//
//  Created by yangln on 2020/3/13.
//  Copyright © 2020 yangln. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Additions)

/// 设置颜色
/// @param string 颜色字符串（0x或#开头）
+ (UIColor *)colorWithString:(NSString *)string;

/// 设置颜色
/// @param string 颜色字符串（0x或#开头）
/// @param alpha 透明度
+ (UIColor *)colorWithString:(NSString *)string alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
