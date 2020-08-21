//
//  SeetingViewController.m
//  BlackDemo001
//
//  Created by yan on 2020/5/25.
//  Copyright © 2020 yan. All rights reserved.
//

#import "SeetingViewController.h"
#import "SDWebImageManager.h"

@interface SeetingViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UISwitch *systemSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *darkSwitch;
@property (strong, nonatomic) UIImageView *showImageView;

@end

@implementation SeetingViewController

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
        if (sender.on) {
            [UIApplication sharedApplication].delegate.window.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
        } else {
            [UIApplication sharedApplication].delegate.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        }
    }
    [self refreshSwitchCacheIsChangeDarkSwitch:NO];
    [self refreshDarkSwitch];
}

- (IBAction)darkSwitchValueChange:(UISwitch *)sender {
    if (@available(iOS 13.0, *)) {
        if (sender.on) {
            [UIApplication sharedApplication].delegate.window.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
        } else {
            [UIApplication sharedApplication].delegate.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
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
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// 点击右上角的按钮
- (IBAction)clickRightBar:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"测试Alert" message:@"123" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:sureAction];
    [self presentViewController:alert animated:YES completion:nil];
}

// 打开相册按钮
- (IBAction)clickPhotoAlbumBtn:(UIButton *)sender {
    // 首先检查设备是否能用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        [self loadImagePickerWithSource:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}

// 打开相机
- (IBAction)clickCameraBtn:(id)sender {
    // 首先检查设备是否能用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        [self loadImagePickerWithSource:UIImagePickerControllerSourceTypeCamera];
    }
}

// 打开相机或者相册
- (void)loadImagePickerWithSource:(UIImagePickerControllerSourceType)type {
    // UIImagePickerController是系统封装好的类，里面是关于相机，相册等的资源类
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    // 加载不同的资源
    picker.sourceType = type;
    // 是否允许imagePicker对资源进行优化
    // picker.allowsEditing = NO;
    picker.allowsEditing = YES;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
    
}

#pragma mark- lazy load
- (UIImageView *)showImageView {
    if (_showImageView == nil) {
        _showImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 200, 100)];
    }
    return _showImageView;
}

@end
