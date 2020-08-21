//
//  JMIUIKitUtility.m
//  JRMagicInsuranceApp
//
//  Created by yangln on 2019/6/28.
//  Copyright © 2019 yangln. All rights reserved.
//

#import "JMIUIKitUtility.h"

@implementation JMIUIKitUtility

UIColor *jmi_colorFromRGBAndAlpha(NSInteger rgbValue, float alpha) {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alpha];
}

UIColor *jmi_colorTransform(UIColor *from, UIColor *to, CGFloat progress) {
    CGFloat fromR = 0, fromG = 0, fromB = 0, fromA = 0;
    [from getRed:&fromR green:&fromG blue:&fromB alpha:&fromA];
    
    CGFloat toR = 0, toG = 0, toB = 0, toA = 0;
    [to getRed:&toR green:&toG  blue:&toB alpha:&toA];
    
    CGFloat red = fromR + (toR - fromR) * progress;
    CGFloat green = fromG + (toG - fromG) * progress;
    CGFloat blue = fromB + (toB - fromB) * progress;
    CGFloat alpha = fromA + (toA - fromA) * progress;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

void jmi_swizzleClassInstanceMethod(Class cls, SEL originSel, SEL swizzleSel) {
    Method originMethod = class_getInstanceMethod(cls, originSel);
    Method swizzleMethod = class_getInstanceMethod(cls, swizzleSel);
    BOOL didAdd = class_addMethod(cls, originSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAdd) {
        class_replaceMethod(cls, swizzleSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }
    else {
        method_exchangeImplementations(originMethod, swizzleMethod);
    }
}

@end
