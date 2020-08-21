//
//  ViewController.m
//  BlackDemo001
//
//  Created by yan on 2020/5/13.
//  Copyright © 2020 yan. All rights reserved.
//

#import "ViewController.h"
#import "ShowTestView.h"
@interface ViewController ()

@property (nonatomic, strong) UIScrollView *showScrollView;
@property (nonatomic, strong) ShowTestView *showTestView1;
@property (nonatomic, strong) ShowTestView *showTestView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    self.userInterfaceStyle = JMIUserInterfaceStyleUnspecified;
    
}

- (void)createUI {
    [self.view addSubview:self.showScrollView];
    [self.showScrollView addSubview:self.showTestView1];
    [self.showScrollView addSubview:self.showTestView2];
    
    self.showScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.showScrollView.frame), CGRectGetHeight(self.showTestView1.frame));
}

#pragma mark- lazy load
- (UIScrollView *)showScrollView {
    if (!_showScrollView) {
        _showScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    }
    return _showScrollView;
}

- (ShowTestView *)showTestView1 {
    if (!_showTestView1) {
        _showTestView1 = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ShowTestView class]) owner:nil options:nil] lastObject];
        CGRect frame = _showTestView1.frame;
        frame.size.width = CGRectGetWidth(self.showScrollView.frame)/2.0;
        _showTestView1.frame = frame;
    }
    return _showTestView1;
}

- (ShowTestView *)showTestView2 {
    if (!_showTestView2) {
        _showTestView2 = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ShowTestView class]) owner:nil options:nil] lastObject];
        CGRect frame = _showTestView2.frame;
        frame.size.width = CGRectGetWidth(self.showScrollView.frame)/2.0;
        frame.origin.x = CGRectGetWidth(self.showScrollView.frame)/2.0;
        _showTestView2.frame = frame;
    }
    return _showTestView2;
}



@end
