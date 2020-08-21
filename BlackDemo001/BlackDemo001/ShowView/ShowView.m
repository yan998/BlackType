//
//  ShowView.m
//  BlackDemo001
//
//  Created by yan on 2020/5/13.
//  Copyright © 2020 yan. All rights reserved.
//

#import "ShowView.h"
@interface ShowView()

@end
@implementation ShowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    self.backgroundColor = [UIColor systemFillColor];
    
    UIButton *tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.frame = CGRectMake(100, 100, 300, 100);
    tempBtn.backgroundColor = [UIColor systemYellowColor];
    [tempBtn setTitle:@"点我锁定暗黑模式" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tempBtn];
    
}

/** 按钮的点击事件 */
- (void)clickBtn:(UIButton *)sender {
    // 设置为Dark Mode即可
//    [self setOverrideUserInterfaceStyle:UIUserInterfaceStyleDark];
    
    [self setOverrideUserInterfaceStyle:UIUserInterfaceStyleDark];
    
//    if (self.clickChangeBlock) {
//        self.clickChangeBlock();
//    }
}





@end
