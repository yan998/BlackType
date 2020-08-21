//
//  ShowView.h
//  BlackDemo001
//
//  Created by yan on 2020/5/13.
//  Copyright © 2020 yan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickChangeBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface ShowView : UIView

/// 点击回调
@property (nonatomic, copy) ClickChangeBlock clickChangeBlock;


@end

NS_ASSUME_NONNULL_END
