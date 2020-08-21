//
//  MySettingNavViewController.m
//  BlackDemo001
//
//  Created by yan on 2020/6/4.
//  Copyright © 2020 yan. All rights reserved.
//

#import "MySettingNavViewController.h"
#import "JMIDarkSwitchSettingController.h"

@interface MySettingNavViewController ()

@end

@implementation MySettingNavViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userInterfaceStyle = JMIUserInterfaceStyleUnspecified;
    self.viewControllers = @[[[JMIDarkSwitchSettingController alloc] init]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
