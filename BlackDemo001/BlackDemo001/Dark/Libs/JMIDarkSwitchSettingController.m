//
//  JMIDarkSwitchSettingController.m
//  BlackDemo001
//
//  Created by yan on 2020/6/4.
//  Copyright © 2020 yan. All rights reserved.
//

#import "JMIDarkSwitchSettingController.h"

@interface JMIDarkSwitchSettingController ()

@property (weak, nonatomic) IBOutlet UISwitch *systemSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *darkSwitch;

@end

@implementation JMIDarkSwitchSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userInterfaceStyle = JMIUserInterfaceStyleUnspecified;
    [self createData];
}

- (void)createData {
    
    NSString *systemSwitchValue =  [[NSUserDefaults standardUserDefaults] objectForKey:@"systemSwitchValue"];
    self.systemSwitch.on = [systemSwitchValue boolValue];
    [self refreshDarkSwitch];
}

// 界面发生变化
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    // trait发生了改变
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            if (self.systemSwitch.on) {
                // 执行操作
                [self refreshDarkSwitch];
            }
        }
    }
}

#pragma mark- 事件响应

- (IBAction)systemSwitchValueChange:(UISwitch *)sender {
    if (@available(iOS 13.0, *)) {
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        if (sender.on) {
            window.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
        } else {
            window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        }
    }
    [self refreshSwitchCacheIsChangeDarkSwitch:NO];
    [self refreshDarkSwitch];
}

- (IBAction)darkSwitchValueChange:(UISwitch *)sender {
    if (@available(iOS 13.0, *)) {
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        if (sender.on) {
            window.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
        } else {
            window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
            self.systemSwitch.on = NO;
        }
    }
    [self refreshSwitchCacheIsChangeDarkSwitch:YES];
}

- (void)refreshDarkSwitch {
    if (@available(iOS 13.0, *)) {
         UITraitCollection *traitCollection = [[UIApplication sharedApplication].keyWindow traitCollection];
        self.darkSwitch.on = traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark;
    }
}

- (void)refreshSwitchCacheIsChangeDarkSwitch:(BOOL)isChangeDarkSwitch {
    
    NSString *systemSwitchOn = @"0";
    if (self.systemSwitch.on) {
        systemSwitchOn = @"1";
    }
    NSString *darkSwitchValue = @"0";
    if (self.darkSwitch.on && isChangeDarkSwitch) {
        darkSwitchValue = @"1";
    }
    [[NSUserDefaults standardUserDefaults] setValue:systemSwitchOn forKey:@"systemSwitchValue"];
    [[NSUserDefaults standardUserDefaults] setValue:darkSwitchValue forKey:@"darkSwitchValue"];
}

@end
