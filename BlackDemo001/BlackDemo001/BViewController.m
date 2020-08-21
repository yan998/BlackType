//
//  BViewController.m
//  BlackDemo001
//
//  Created by yan on 2020/5/28.
//  Copyright © 2020 yan. All rights reserved.
//

#import "BViewController.h"
#import "CViewController.h"

@interface BViewController ()
/// CVC
@property (nonatomic, strong) CViewController *cVC;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userInterfaceStyle = JMIUserInterfaceStyleDark;
    [self createUI];
}

- (void)createUI {
    [self addChildViewController:self.cVC];
    [self.view addSubview:self.cVC.view];
    
    [self.cVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_offset(-30);
        make.bottom.mas_equalTo(-130);
        make.top.mas_equalTo(100);
    }];
    
    self.cVC.view.frame = self.view.bounds;
}

#pragma mark- lazy load
- (CViewController *)cVC {
    if (_cVC == nil) {
        _cVC = [[NSBundle mainBundle] loadNibNamed:@"CViewController" owner:self options:nil][0];
        _cVC.view.layer.borderColor = [UIColor systemBlueColor].CGColor;
        _cVC.view.layer.borderWidth = 2;
    }
    return _cVC;
}


@end
