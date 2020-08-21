//
//  JMILayerShowStyleLib.m
//  BlackDemo001
//
//  Created by yan on 2020/5/25.
//  Copyright © 2020 yan. All rights reserved.
//

#import "JMILayerShowStyleLib.h"

@implementation JMILayerShowStyleLib

+ (JMILayerShowStyleLib *)share {
    static JMILayerShowStyleLib *lib = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lib = [[self alloc] init];
    });
    return lib;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // 设置配置文件路径
        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"JMILayerStyleColorLib" ofType:@"plist"];
        self.configFilePath = plistPath;
    }
    return self;
}

@end
