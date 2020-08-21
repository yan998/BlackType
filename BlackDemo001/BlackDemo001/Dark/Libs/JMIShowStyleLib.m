//
//  JMIShowStyleLib.m
//  JRMagicInsuranceApp
//
//  Created by yan on 2020/5/18.
//  Copyright © 2020 yangln. All rights reserved.
//

#import "JMIShowStyleLib.h"
#import "UIColor+JMIDark.h"

@interface JMIShowStyleLib()
@end

@implementation JMIShowStyleLib

+ (JMIShowStyleLib *)share {
    static JMIShowStyleLib *lib = nil;
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
        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"JMIStyleColorLib" ofType:@"plist"];
        self.configFilePath = plistPath;
    }
    return self;
}

@end
