//
//  JMIShowStyleBaseLib.m
//  JRMagicInsuranceApp
//
//  Created by yan on 2020/5/20.
//  Copyright © 2020 yangln. All rights reserved.
//

#import "JMIShowStyleBaseLib.h"
#import "UIColor+JMIDark.h"

@interface JMIShowStyleBaseLib()
/// 颜色配置Model
@property (nonatomic, strong) NSMutableDictionary *configModelDic;

@end

@implementation JMIShowStyleBaseLib

+ (JMIShowStyleBaseLib *)share {
    static JMIShowStyleBaseLib *lib = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lib = [[self alloc] init];
        [lib manageNotification];
    });
    return lib;
}

- (void)manageNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showWindow:) name:UIWindowDidBecomeVisibleNotification object:nil];
}

- (void)showWindow:(NSNotification *)notification {
    
}

/// 通过类型获取color
/// @param typeStr 对应相关配置plist中的颜色配置
+ (UIColor *)colorWithType:(NSString *)typeStr {
    if (![typeStr isKindOfClass:[NSString class]]) return nil;
    
    JMIShowStyleModel *model = [[self share].configModelDic objectForKey:typeStr];
    UIColor *color = nil;
    // 获取lightColor
    UIColor *lightColor = model.lightColor;
    if (@available(iOS 13.0, *)) {
        // 获取darkColor
        UIColor *darkColor = model.darkColor;
        // 获取最终颜色
        color = [UIColor colorWithLightColor:lightColor darkColor:darkColor];
    } else {
        color = lightColor;
    }
    return color;
}

#pragma mark- set
- (void)setConfigFilePath:(NSString *)configFilePath {
    if ([configFilePath isKindOfClass:[NSString class]] || configFilePath == nil) {
        _configFilePath = [configFilePath copy];
        NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:_configFilePath];
        
        [self.configModelDic removeAllObjects];
        
        // 设置configModelDic
        [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSDictionary *subDic = (NSDictionary *)obj;
            // 获取darkColor
            CGFloat darkAlpha = [subDic[@"darkAlpha"] floatValue];
            // 如果没有设置透明度,默认透明度为1，设置透明度为0没有意义
            if (darkAlpha == 0) {
                darkAlpha = 1;
            }
            UIColor *darkColor = [UIColor colorWithString:subDic[@"dark"] alpha:darkAlpha];
            
            // 获取lightColor
            CGFloat lightAlpha = [subDic[@"lightAlpha"] floatValue];
            // 如果没有设置透明度,默认透明度为1，设置透明度为0没有意义
            if (lightAlpha == 0) {
                lightAlpha = 1;
            }
            UIColor *lightColor = [UIColor colorWithString:subDic[@"light"] alpha:lightAlpha];
            
            JMIShowStyleModel *model = [[JMIShowStyleModel alloc] init];
            model.darkColor = darkColor;
            model.lightColor = lightColor;
            model.name = key;
            [self.configModelDic setValue:model forKey:key];
        }];
    }
}

/// 获取配置文件中的颜色对象
/// @param typeStr typeStr
+ (JMIShowStyleModel *)getShowStyleModelWithType:(NSString *)typeStr {
    JMIShowStyleModel *model = [[self share].configModelDic objectForKey:typeStr];
    return model;
}

#pragma mark- lazy load
- (NSMutableDictionary *)configModelDic {
    if (_configModelDic == nil) {
        _configModelDic = [[NSMutableDictionary alloc] init];
    }
    return _configModelDic;
}


@end
