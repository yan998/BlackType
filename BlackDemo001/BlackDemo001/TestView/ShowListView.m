//
//  ShowListView.m
//  BlackDemo001
//
//  Created by yan on 2020/5/25.
//  Copyright © 2020 yan. All rights reserved.
//

#import "ShowListView.h"
#import "Masonry.h"
#import "CALayer+JMIDark.h"

@interface ShowListView()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *showLabel;
@property (nonatomic, strong) UITextField *inputTextField;
@property (nonatomic, strong) UIImageView *showImageView;
@property (nonatomic, strong) CALayer *showLayer;
@property (nonatomic, strong) UIView *tempView;

@end

@implementation ShowListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        [self addConstraintForView];
        [self createData];
    }
    return self;
}

- (void)createUI {
    [self addSubview:self.backView];
    [self.backView addSubview:self.showLabel];
    [self.backView addSubview:self.inputTextField];
    [self.backView addSubview:self.showImageView];
    [self.backView.layer addSublayer:self.showLayer];
    [self.backView addSubview:self.tempView];
    
}

- (void)fitDarkMode {
    // 背景颜色
    self.backView.backgroundColor = JMIShowStyleBackColor;
    
    // 字体颜色
    self.showLabel.textColor = JMIShowStyleTextColor;
    
    // 输入框颜色适配
    self.inputTextField.textColor = JMIShowStyleTextColor;
    self.inputTextField.tintColor = [UIColor redColor];
    
    // 图片
    
}

- (void)addConstraintForView {
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    [self.showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.centerX.equalTo(self.backView);
    }];
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.showLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(30);
        make.right.equalTo(self.backView.mas_right).offset(-30);
    }];
    [self.showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.top.equalTo(self.inputTextField.mas_bottom).offset(20);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(150);
    }];
    
    [self.tempView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.left.mas_equalTo(50);
        make.top.equalTo(self.backView.mas_bottom).offset(30);
    }];
    
    [self layoutIfNeeded];
    CGFloat width = 50;
    self.showLayer.frame = CGRectMake(100, CGRectGetHeight(self.backView.frame), width, width);
    
}

- (void)createData {
    
}

#pragma mark- lazy load
- (UIView *)backView {
    if (_backView == nil) {
        _backView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _backView;
}

- (UILabel *)showLabel {
    if (_showLabel == nil) {
        _showLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    return _showLabel;
}

- (UITextField *)inputTextField {
    if (_inputTextField == nil) {
        _inputTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _inputTextField.borderStyle = UITextBorderStyleBezel;
    }
    return _inputTextField;
}

- (UIImageView *)showImageView {
    if (_showImageView == nil) {
        _showImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _showImageView;
}

- (CALayer *)showLayer {
    if (_showLayer == nil) {
        _showLayer = [CALayer layer];
    }
    return _showLayer;
}

- (UIView *)tempView {
    if (_tempView == nil) {
        _tempView = [[UIView alloc] init];
    }
    return _tempView;
}

@end
