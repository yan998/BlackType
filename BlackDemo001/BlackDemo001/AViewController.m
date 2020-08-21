//
//  AViewController.m
//  BlackDemo001
//
//  Created by yan on 2020/5/28.
//  Copyright © 2020 yan. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"

@interface AViewController ()

@property (nonatomic, strong) BViewController *bVC;
@property (weak, nonatomic) IBOutlet UILabel *showTitleLabel;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userInterfaceStyle = JMIUserInterfaceStyleUnspecified;
    [self createUI];
}

- (void)createUI {
    [self addChildViewController:self.bVC];
    [self.view addSubview:self.bVC.view];
    
    [self.bVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_offset(-30);
        make.bottom.mas_equalTo(-130);
        make.top.equalTo(self.showTitleLabel.mas_bottom).offset(30);
    }];
    
}

#pragma mark- lazy load
- (BViewController *)bVC {
    if (_bVC == nil) {
        _bVC = [[NSBundle mainBundle] loadNibNamed:@"BViewController" owner:self options:nil][0];
        _bVC.view.layer.borderColor = [UIColor systemRedColor].CGColor;
        _bVC.view.layer.borderWidth = 2;
    }
    return _bVC;
}

@end
