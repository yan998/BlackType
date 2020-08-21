//
//  JMIUserInterfaceStyle.h
//  JRMagicInsuranceApp
//
//  Created by yan on 2020/5/20.
//  Copyright © 2020 yangln. All rights reserved.
//

#ifndef JMIUserInterfaceStyle_h
#define JMIUserInterfaceStyle_h
#import "JMIShowStyleBaseLib.h"
#import "JMIShowStyleLib.h"
#import "JMILayerShowStyleLib.h"
#import "JMIUIKitUtility.h"
#import "JMIDarkSwitchManager.h"

#import "UIViewController+JMIDark.h"
#import "UIImageView+JMIDark.h"
#import "UIColor+Additions.h"
#import "CALayer+JMIDark.h"
#import "UIColor+JMIDark.h"


// 普通label的颜色
#define JMIShowStyleTextColor [JMIShowStyleLib colorWithType:@"textColor"]
// 背景颜色
#define JMIShowStyleBackColor [JMIShowStyleLib colorWithType:@"backColor"]
// segment字体颜色
#define JMIShowStyleSegmentTextColor [JMIShowStyleLib colorWithType:@"segmentTextColor"]
// cell标题字体颜色
#define JMIShowStyleCellTextColor [JMIShowStyleLib colorWithType:@"cellTextColor"]
// cell副标题字体颜色
#define JMIShowStyleCellSubTextColor [JMIShowStyleLib colorWithType:@"cellSubTextColor"]
// tabbar字体颜色
#define JMIShowStyleTabBarTextColor [JMIShowStyleLib colorWithType:@"tabBarTextColor"]
// cell分割线的颜色
#define JMIShowStyleSeparatorColor [JMIShowStyleLib colorWithType:@"separatorColor"]
// 灰色的颜色
#define JMIShowStyleGrayBackColor [JMIShowStyleLib colorWithType:@"grayBackColor"]
// tableview SectionHeader 标题颜色
#define JMIShowStyleTableViewSectionHeaderColor [JMIShowStyleLib colorWithType:@"tableViewSectionHeaderColor"]
// 表格中的信息颜色
#define JMIShowStyleFeeTextColor [JMIShowStyleLib colorWithType:@"feeTextColor"]
// 输入框的tintColor
#define JMIShowStyleTextFieldTintColor [JMIShowStyleLib colorWithType:@"textFieldTintColor"]


// layer的背景颜色
#define JMILayerBackColor [JMILayerShowStyleLib colorWithType:@"layerBackColor"]
// layer的边框颜色
#define JMILayerLayerBorderColor [JMILayerShowStyleLib colorWithType:@"layerBorderColor"]

// JMILayerShowStyleLib 工具方法
// 获取 JMILayerShowStyleLib 某个type下面的LightColor
#define LayerShowStyleLibLightColor(type) [JMILayerShowStyleLib getLightModeColorWithType:type]
// 获取 JMILayerShowStyleLib 某个type下面的DarkColor
#define LayerShowStyleLibDarkColor(type) [JMILayerShowStyleLib getDarkModeColorWithType:type]

#endif /* JMIUserInterfaceStyle_h */
