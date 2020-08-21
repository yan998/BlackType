//
//  UIImageView+JMIDark.m
//  BlackDemo001
//
//  Created by yan on 2020/5/25.
//  Copyright © 2020 yan. All rights reserved.
//

#import "UIImageView+JMIDark.h"
#import <SDWebImage/SDWebImage.h>
@interface UIImageView()
/// lightImage
@property (nonatomic, strong) UIImage *lightImage;
/// lightImageUrl
@property (nonatomic, strong) NSURL *lightImageUrl;
/// placeholderImage
@property (nonatomic, strong) UIImage *lightPlaceholderImage;
/// darkImage
@property (nonatomic, strong) UIImage *darkImage;
/// darkImageUrl
@property (nonatomic, strong) NSURL *darkImageUrl;
/// darkPlaceholderImage
@property (nonatomic, strong) UIImage *darkPlaceholderImage;
@end

@implementation UIImageView (JMIDark)

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(traitCollectionDidChange:)), class_getInstanceMethod(self, @selector(jmi_traitCollectionDidChange:)));
}

- (void)jmi_traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [self jmi_traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            [self refrshShow];
        }
    }
}

/// 设置暗黑和普通模式下的图片
/// @param lightImage lightImage
/// @param darkImage darkImage
- (void)setImageWithLightImage:(UIImage *)lightImage darkImage:(UIImage *)darkImage {
    if (@available(iOS 13.0, *)) {
        self.darkImage = darkImage;
    }
    self.lightImage = lightImage;
    [self refrshShow];
}

/// 设置暗黑和普通模式下的图片 [处理网络图片]
/// @param lightImageUrl 默认url
/// @param darkImageUrl 暗黑图片url
/// @param placeholderImage 通用占位图
- (void)setImageWithLightImageUrl:(NSURL *)lightImageUrl darkImageUrl:(NSURL *)darkImageUrl placeholderImage:(UIImage *)placeholderImage{
    [self setImageWithLightImageUrl:lightImageUrl lightPlaceholderImage:placeholderImage darkImageUrl:darkImageUrl darkPlaceholderImage:nil];
}

/// 设置暗黑和普通模式下的图片 [处理网络图片，可以设置暗黑模式的默认图]
/// @param lightImageUrl 默认url
/// @param lightPlaceholderImage 默认的placeHolder
/// @param darkImageUrl 暗黑图片url
/// @param darkPlaceholderImage 暗黑模式的PlaceHolder
- (void)setImageWithLightImageUrl:(NSURL *)lightImageUrl lightPlaceholderImage:(UIImage *)lightPlaceholderImage darkImageUrl:(NSURL *)darkImageUrl darkPlaceholderImage:(UIImage *)darkPlaceholderImage {
    if (@available(iOS 13.0, *)) {
        self.darkImageUrl = darkImageUrl;
        self.darkPlaceholderImage = darkPlaceholderImage;
    }
    self.lightImageUrl = lightImageUrl;
    self.lightPlaceholderImage = lightPlaceholderImage;
    [self refrshShow];
}

/// 刷新Image
- (void)refrshShow {
    BOOL setDarkImageSuccess = [self setDarkModeImage];
    if (!setDarkImageSuccess) {
        // 普通模式
        // 网络图片
        if ([self.lightImageUrl isKindOfClass:[NSURL class]]) {
            UIImage *placeHolderImage = nil;
            if ([self.lightPlaceholderImage isKindOfClass:[UIImage class]]) {
                placeHolderImage = self.lightPlaceholderImage;
            }
            // SD 加载图片
            [self sd_setImageWithURL:self.lightImageUrl placeholderImage:placeHolderImage];
            return;
        }
        
        // 本地图片
        if ([self.lightImage isKindOfClass:[UIImage class]]) {
            self.image = self.lightImage;
        }
    }
}

/// 设置暗黑模式下的图片
/// return 是否设置成功
- (BOOL)setDarkModeImage {
    if (@available(iOS 13.0, *)) {
        // 刷新初始颜色
        UITraitCollection *traitCollection = self.traitCollection;
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            // 设置dark模式下的image
            // 网络图片
            if ([self.darkImageUrl isKindOfClass:[NSURL class]]) {
                // placeHolderImage
                UIImage *placeHolderImage = nil;
                if ([self.darkPlaceholderImage isKindOfClass:[UIImage class]]) {
                    placeHolderImage = self.darkPlaceholderImage;
                } else if ([self.lightPlaceholderImage isKindOfClass:[UIImage class]]) {
                    placeHolderImage = self.lightPlaceholderImage;
                }
                // SD 加载图片
                [self sd_setImageWithURL:self.darkImageUrl placeholderImage:placeHolderImage];
                return YES;
            }
            
            // 本地图片
            if ([self.darkImage isKindOfClass:[UIImage class]]) {
                self.image = self.darkImage;
            }
            return YES;
        }
    }
    return NO;
}

#pragma mark- set
- (void)setLightImage:(UIImage *)lightImage {
    objc_setAssociatedObject(self, @selector(lightImage), lightImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)lightImage {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLightImageUrl:(NSURL *)lightImageUrl {
    objc_setAssociatedObject(self, @selector(lightImageUrl), lightImageUrl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSURL *)lightImageUrl {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLightPlaceholderImage:(UIImage *)lightPlaceholderImage {
    objc_setAssociatedObject(self, @selector(lightPlaceholderImage), lightPlaceholderImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)lightPlaceholderImage {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setDarkPlaceholderImage:(UIImage *)darkPlaceholderImage {
    objc_setAssociatedObject(self, @selector(darkPlaceholderImage), darkPlaceholderImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)darkPlaceholderImage {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setDarkImage:(UIImage *)darkImage {
    objc_setAssociatedObject(self, @selector(darkImage), darkImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)darkImage {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setDarkImageUrl:(NSURL *)darkImageUrl {
    objc_setAssociatedObject(self, @selector(darkImageUrl), darkImageUrl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSURL *)darkImageUrl {
    return objc_getAssociatedObject(self, _cmd);
}
@end
