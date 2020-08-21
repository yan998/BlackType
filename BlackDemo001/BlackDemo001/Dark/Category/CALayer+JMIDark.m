//
//  CALayer+JMIDark.m
//  BlackDemo001
//
//  Created by yan on 2020/5/21.
//  Copyright © 2020 yan. All rights reserved.
//

#import "CALayer+JMIDark.h"
#import "JMIShowStyleBaseLib.h"
@interface CALayer()

@end
@implementation CALayer (JMIDark)

/// 设置Layer 暗黑模式和普通模式下的背景颜色
/// @param model 配置Model
- (void)setBackgroundColorWithStyleModel:(JMIShowStyleModel *)model {
    [self setBackgroundColorWithLightColor:model.lightColor darkColor:model.darkColor];
}

/// 设置Layer 暗黑模式和普通模式下的边框颜色
/// @param model 配置Model
- (void)setBorderColorWithStyleModel:(JMIShowStyleModel *)model {
    [self setBorderColorWithLightColor:model.lightColor darkColor:model.darkColor];
}

/// 设置Layer 暗黑模式和普通模式下的背景颜色
/// @param lightBackGroundColor Light模式下的背景颜色
/// @param darkBackGroundColor Dark 模式下的背景颜色
- (void)setBackgroundColorWithLightColor:(UIColor *)lightBackGroundColor darkColor:(UIColor *)darkBackGroundColor {
    if (@available(iOS 13.0, *)) {
        
        UIColor *layerBackColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            UIColor *backColor = nil;
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                if ([darkBackGroundColor isKindOfClass:[UIColor class]]) {
                    backColor = darkBackGroundColor;
                }
            } else {
                if ([lightBackGroundColor isKindOfClass:[UIColor class]]) {
                    backColor = lightBackGroundColor;
                }
            }
            return backColor;
        }];
        
        self.backgroundColor = layerBackColor.CGColor;
    } else {
        // 系统小于13的，没有暗黑模式
        if ([lightBackGroundColor isKindOfClass:[UIColor class]]) {
            self.backgroundColor = lightBackGroundColor.CGColor;
        }
    }
}

/// 设置Layer 暗黑模式和普通模式下的边框颜色
/// @param lightBorderColor Light模式下的边框颜色
/// @param darkBorderColor Dark 模式下的边框颜色
- (void)setBorderColorWithLightColor:(UIColor *)lightBorderColor darkColor:(UIColor *)darkBorderColor {
    if (@available(iOS 13.0, *)) {
        UIColor *layerBoderColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            UIColor *borderColor = nil;
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                if ([darkBorderColor isKindOfClass:[UIColor class]]) {
                    borderColor = darkBorderColor;
                }
            } else {
                if ([lightBorderColor isKindOfClass:[UIColor class]]) {
                    borderColor = lightBorderColor;
                }
            }
            return borderColor;
        }];
        
        self.borderColor = layerBoderColor.CGColor;
        
    } else {
        // 系统小于13的，没有暗黑模式
        if ([lightBorderColor isKindOfClass:[UIColor class]]) {
            self.borderColor = lightBorderColor.CGColor;
        }
    }
}

@end
