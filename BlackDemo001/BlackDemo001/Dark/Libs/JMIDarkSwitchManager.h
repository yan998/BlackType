//
//  JMIDarkSwitchManager.h
//  BlackDemo001
//
//  Created by yan on 2020/6/4.
//  Copyright © 2020 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 暗黑模式相关开关
@interface JMIDarkSwitchManager : NSObject

/// 根据当前设置开关设置最下层window的暗黑模式
+ (void)setWindowDarkModeSwitch;


@end

NS_ASSUME_NONNULL_END
