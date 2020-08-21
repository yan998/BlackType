//
//  JMIUIKitUtility.h
//  JRMagicInsuranceApp
//
//  Created by yangln on 2019/6/28.
//  Copyright © 2019 yangln. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/message.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMIUIKitUtility : NSObject

/**
 将十六进制的rgb颜色值转换为UIColor对象
 @param rgbValue 0x的十六进制
 @param alpha 透明度
 @return UIColor对象
 */
extern UIColor *jmi_colorFromRGBAndAlpha(NSInteger rgbValue, float alpha);

/**
 颜色转变
 @param from 起始颜色
 @param to 结束颜色
 @param progress 转换比例
 @return 颜色转变后的颜色值
 */
extern UIColor *jmi_colorTransform(UIColor *from, UIColor *to, CGFloat progress);

/**
 方法交换
 @param cls 类
 @param originSel 原始方法
 @param swizzleSel 交换后的方法
 */
extern void jmi_swizzleClassInstanceMethod(Class cls, SEL originSel, SEL swizzleSel);

@end

NS_ASSUME_NONNULL_END
