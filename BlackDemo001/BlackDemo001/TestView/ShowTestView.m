//
//  ShowTestView.m
//  BlackDemo001
//
//  Created by yan on 2020/5/25.
//  Copyright © 2020 yan. All rights reserved.
//

#import "ShowTestView.h"
@interface ShowTestView()
/// 修改当前展示状态
/// 不确定的状态，跟随系统状态变化
@property (weak, nonatomic) IBOutlet UIButton *unspecifiedBtn;
/// light 模式
@property (weak, nonatomic) IBOutlet UIButton *lightBtn;
/// dark 模式
@property (weak, nonatomic) IBOutlet UIButton *darkBtn;
/// 背景view
@property (weak, nonatomic) IBOutlet UIView *backView;
/// 显示内容的Label
@property (weak, nonatomic) IBOutlet UILabel *showTextLabel;
/// 输入框
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
/// 加载本地图片
@property (weak, nonatomic) IBOutlet UIImageView *localImageView;
@property (weak, nonatomic) IBOutlet UIImageView *localImageView1;
/// 加载网络图片
@property (weak, nonatomic) IBOutlet UIImageView *netImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *netImageView2;
/// 边框颜色
@property (weak, nonatomic) IBOutlet UIView *borderView;
@property (weak, nonatomic) IBOutlet UILabel *showLayerTextLabel;
/// layer背景颜色
@property (strong, nonatomic) CALayer *showLayer;

@end

@implementation ShowTestView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self createUI];
    [self setUI];
}

- (void)createUI {
    [self layoutIfNeeded];
    [self.layer addSublayer:self.showLayer];
    self.showLayer.frame = CGRectMake(20, CGRectGetMaxY(self.showLayerTextLabel.frame)+20, 100, 80);
}

- (void)setUI {
    // 设置内容背景颜色
    self.backView.backgroundColor = JMIShowStyleBackColor;
    
    // 设置label显示的颜色
    self.showTextLabel.textColor = JMIShowStyleTextColor;
    
    // 设置输入框文字颜色
    self.textField1.textColor = JMIShowStyleTextColor;
    self.textField1.tintColor = JMIShowStyleTextFieldTintColor;
    
    self.textField2.textColor = JMIShowStyleTextColor;
    self.textField2.tintColor = JMIShowStyleTextFieldTintColor;
    
    
    // 设置本地图片
    self.localImageView.image = [UIImage imageNamed:@"LightAndDarkHeaderImage"];
    UIImage *lightImage = [UIImage imageNamed:@"Rainbow_1"];
    UIImage *darkImage = [UIImage imageNamed:@"Sunset_3"];
    [self.localImageView1 setImageWithLightImage:lightImage darkImage:darkImage];
    
    // 设置网络图片
    NSURL *lightImageUrl = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590472896956&di=74ad720be53af171c0289ce65abbc2f7&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fq_70%2Cc_zoom%2Cw_640%2Fupload%2F20170522%2Fdf59dfe5a47848f08b9e8d045e29d79f_th.jpg"];
    NSURL *darkImageUrl = [NSURL URLWithString:@"http://hbimg.b0.upaiyun.com/8b6e163d2151e6925b28093d763ddd4f9ce11efa508bb-8XV2nw_fw658"];
    [self.netImageView1 setImageWithLightImageUrl:lightImageUrl darkImageUrl:darkImageUrl placeholderImage:[UIImage imageNamed:@"default_rect"]];
    
    [self.netImageView2 setImageWithLightImageUrl:[NSURL URLWithString:@""] lightPlaceholderImage:[UIImage imageNamed:@"default_rect"] darkImageUrl:[NSURL URLWithString:@""] darkPlaceholderImage:[UIImage imageNamed:@"home_config"]];
    
    // 设置view的边框颜色
    // 设置背景颜色
    if (@available(iOS 11.0, *)) {
        self.borderView.backgroundColor = [UIColor colorNamed:@"LightAndDarkHeaderColor"];
    } else {
        self.borderView.backgroundColor = [UIColor greenColor];
    }
    self.borderView.layer.borderWidth = 4;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            // 设置layer的背景颜色
            [self.showLayer setBackgroundColorWithStyleModel:[JMILayerShowStyleLib getShowStyleModelWithType:@"layerBackColor"]];
            
            // 设置layer的边框颜色
            [self.borderView.layer setBorderColorWithStyleModel:[JMILayerShowStyleLib getShowStyleModelWithType:@"layerBorderColor"]];
        }
    }
}

#pragma mark- 修改当前显示的状态
- (IBAction)clickChangeShowMode:(UIButton *)sender {
    if (@available(iOS 13.0, *)) {
        if (sender.tag == 100) {
            // unspecified
            self.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
        } else if (sender.tag == 101) {
            // light
            self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        } else {
            // dark
            self.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
        }
        for (NSInteger i = 0; i < 103; i++) {
            UIButton *btn = [self viewWithTag:i+1];
            btn.backgroundColor = [UIColor grayColor];
        }
        sender.backgroundColor = [UIColor orangeColor];
    }
}


#pragma mark- lazy load
- (CALayer *)showLayer {
    if (!_showLayer) {
        _showLayer = [CALayer layer];
        // 初始化layer的背景颜色
        _showLayer.backgroundColor = [JMILayerShowStyleLib getShowStyleModelWithType:@"layerBackColor"].lightColor.CGColor;
    }
    return _showLayer;
}
@end
