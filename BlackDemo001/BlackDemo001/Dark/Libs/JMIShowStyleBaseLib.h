//
//  JMIShowStyleBaseLib.h
//  JRMagicInsuranceApp
//
//  Created by yan on 2020/5/20.
//  Copyright © 2020 yangln. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMIShowStyleModel.h"
/// UIUserInterfaceStyle 对应的转化枚举
typedef NS_ENUM(NSInteger, JMIUserInterfaceStyle) {
    JMIUserInterfaceStyleUnspecified,   // unspecified模式
    JMIUserInterfaceStyleLight,         // light模式
    JMIUserInterfaceStyleDark           // dark模式
};

NS_ASSUME_NONNULL_BEGIN

/// 适配暗黑模式的工具父类
@interface JMIShowStyleBaseLib : NSObject

/// 颜色配置文件路径
@property (nonatomic, strong) NSString *configFilePath;

/// 通过类型获取color
/// @param typeStr 对应相关配置plist中的颜色配置
+ (UIColor *)colorWithType:(NSString *)typeStr;

/// 获取配置文件中的颜色对象
/// @param typeStr typeStr
+ (JMIShowStyleModel *)getShowStyleModelWithType:(NSString *)typeStr;

@end

NS_ASSUME_NONNULL_END
