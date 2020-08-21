//
//  UIView+JMIDark.h
//  BlackDemo001
//
//  Created by yan on 2020/5/27.
//  Copyright © 2020 yan. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 适配暗黑模式 UIView 的分类
@interface UIView (JMIDark)

/// UIUserInterfaceStyle 对应的转化枚举
@property (nonatomic, assign) JMIUserInterfaceStyle userInterfaceStyle;

@end

NS_ASSUME_NONNULL_END
