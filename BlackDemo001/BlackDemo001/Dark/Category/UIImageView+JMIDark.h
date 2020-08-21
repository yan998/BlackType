//
//  UIImageView+JMIDark.h
//  BlackDemo001
//
//  Created by yan on 2020/5/25.
//  Copyright © 2020 yan. All rights reserved.
//
#import <UIKit/UIKit.h>

/// 适配暗黑模式 UIImageView 的分类
@interface UIImageView (JMIDark)

/// 设置暗黑和普通模式下的图片
/// @param lightImage lightImage
/// @param darkImage darkImage
- (void)setImageWithLightImage:(UIImage *)lightImage darkImage:(UIImage *)darkImage;

/// 设置暗黑和普通模式下的图片 [处理网络图片]
/// @param lightImageUrl 默认url
/// @param darkImageUrl 暗黑图片url
/// @param placeholderImage 通用占位图
- (void)setImageWithLightImageUrl:(NSURL *)lightImageUrl darkImageUrl:(NSURL *)darkImageUrl placeholderImage:(UIImage *)placeholderImage;

/// 设置暗黑和普通模式下的图片 [处理网络图片，可以设置暗黑模式的默认图]
/// @param lightImageUrl 默认url
/// @param lightPlaceholderImage 默认的placeHolder
/// @param darkImageUrl 暗黑图片url
/// @param darkPlaceholderImage 暗黑模式的PlaceHolder
- (void)setImageWithLightImageUrl:(NSURL *)lightImageUrl lightPlaceholderImage:(UIImage *)lightPlaceholderImage darkImageUrl:(NSURL *)darkImageUrl darkPlaceholderImage:(UIImage *)darkPlaceholderImage;

@end

