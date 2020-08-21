//
//  JMIShowStyleModel.h
//  BlackDemo001
//
//  Created by yan on 2020/5/26.
//  Copyright © 2020 yan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/// 颜色相关的Model
@interface JMIShowStyleModel : NSObject
/// name
@property (nonatomic, copy) NSString *name;
/// lightColor
@property (nonatomic, strong) UIColor *lightColor;
/// darkColor
@property (nonatomic, strong) UIColor *darkColor;
@end

NS_ASSUME_NONNULL_END
