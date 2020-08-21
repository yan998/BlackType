//
//  CALayer+JMIDark.h
//  BlackDemo001
//
//  Created by yan on 2020/5/21.
//  Copyright © 2020 yan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

/// 适配暗黑模式 CALayer 的分类
@interface CALayer (JMIDark)

/// 设置Layer 暗黑模式和普通模式下的背景颜色
/// @param model 配置Model
- (void)setBackgroundColorWithStyleModel:(JMIShowStyleModel *)model;

/// 设置Layer 暗黑模式和普通模式下的边框颜色
/// @param model 配置Model
- (void)setBorderColorWithStyleModel:(JMIShowStyleModel *)model;

/// 设置Layer 暗黑模式和普通模式下的背景颜色
/// @param lightBackGroundColor Light模式下的背景颜色
/// @param darkBackGroundColor Dark 模式下的背景颜色
- (void)setBackgroundColorWithLightColor:(UIColor *)lightBackGroundColor darkColor:(UIColor *)darkBackGroundColor;

/// 设置Layer 暗黑模式和普通模式下的边框颜色
/// @param lightBorderColor Light模式下的边框颜色
/// @param darkBorderColor Dark 模式下的边框颜色
- (void)setBorderColorWithLightColor:(UIColor *)lightBorderColor darkColor:(UIColor *)darkBorderColor;

@end

NS_ASSUME_NONNULL_END
