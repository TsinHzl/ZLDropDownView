//
//  ZLDropDownView.m
//  ZLDropDownView
//
//  Created by iMobie on 18/1/30.
//  Copyright © 2018年 TsinHzl. All rights reserved.
//

#import "ZLDropDownView.h"
#import "ZLDropDownViewController.h"
#import "UIView+ZLExtension.h"


#define ZLScreenBounds [UIScreen mainScreen].bounds
#define ZLScreenSize [UIScreen mainScreen].bounds.size
#define ZLScreenWidth [UIScreen mainScreen].bounds.size.width
#define ZLScreenHeight [UIScreen mainScreen].bounds.size.height

/**  屏幕适配，这里是以iphone6的宽度作为标准的，当然也可以使用其他机型的宽度或者是高度 ***/
#define ZLFitRealValue(value) ((value)/750.0f*[UIScreen mainScreen].bounds.size.width)

static CGFloat const ZLDropdownViewDuration = 0.45f;

static UIWindow *_window = nil;


@implementation ZLDropDownView

+ (void)setup {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:ZLScreenBounds];
    }
    _window.windowLevel = UIWindowLevelNormal;
    _window.backgroundColor = [UIColor clearColor];
    _window.hidden = NO;
}

+ (void)showWithView:(UIView *)sView belowView:(UIView *)bView width:(CGFloat)vWidth height:(CGFloat)vHeight {
    [self setup];
    CGRect cFrame = [_window convertRect:bView.frame toView:_window];
    __weak typeof(self) weakSelf = self;
    
    ZLDropDownViewController *dropdownVc = [[ZLDropDownViewController alloc] init];
    dropdownVc.view.backgroundColor = [UIColor clearColor];
    _window.rootViewController = dropdownVc;
    
    CGFloat sViewY = CGRectGetMaxY(cFrame);
    CGFloat sViewH = sView.zl_height;
    sView.zl_y = sViewY;
    sView.zl_height = 0.01f;
    [dropdownVc.view addSubview:sView];
    
    [self animtionWithView:sView viewHeight:sViewH comletion:^{
        dropdownVc.viewClicked = ^{
            [weakSelf hideWithView:sView];
        };
    }];
}

+ (void)animtionWithView:(UIView *)sView viewHeight:(CGFloat)sViewH comletion:(void(^)(void))comletion {
    
    [UIView animateWithDuration:ZLDropdownViewDuration delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        sView.zl_height = sViewH;
    } completion:^(BOOL finished) {
        if (comletion) {
            comletion();
        }
    }];
    
}

+ (void)hideWithView:(UIView *)sView {
    CGFloat sViewH = 0.01f;
   
    [self animtionWithView:sView viewHeight:sViewH comletion:^{
        if (_window) {
            _window.hidden = YES;
            _window.rootViewController = nil;
            _window = nil;
        }
    }];
}
@end
