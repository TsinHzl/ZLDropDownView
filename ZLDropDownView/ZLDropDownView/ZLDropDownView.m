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
#define ZLFitRealValue(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)


static CGFloat const ZLDropdownViewDuration = 0.45f;
static CGFloat const ZLDropdownViewShowViewDefaultHeight = 200.f;
static CGFloat const ZLDropdownViewShowViewMaxHeight = 450.f;

static UIWindow *_window = nil;


@implementation ZLDropDownView

#pragma mark - 初始化设置
+ (void)setup {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:ZLScreenBounds];
    }
    _window.windowLevel = UIWindowLevelNormal;
    _window.backgroundColor = [UIColor clearColor];
    _window.hidden = NO;
}

#pragma mark - 显示、隐藏view

/**
 显示view
 */
+ (void)showWithView:(UIView *)sView belowView:(UIView *)bView {
    [self setup];
    CGRect cFrame = [bView.superview convertRect:bView.frame toView:nil];
    __weak typeof(self) weakSelf = self;
    
    ZLDropDownViewController *dropdownVc = [[ZLDropDownViewController alloc] init];
    dropdownVc.view.backgroundColor = [UIColor clearColor];
    _window.rootViewController = dropdownVc;
    
    CGFloat sViewY = CGRectGetMaxY(cFrame);
    CGFloat sViewH = sView.zl_height > 0 ? sView.zl_height : ZLDropdownViewShowViewDefaultHeight;
    CGFloat sViewW = sView.zl_width > 0 ? sView.zl_width : ZLScreenWidth;
    if (sViewH > ZLDropdownViewShowViewMaxHeight) {
        sViewH = ZLFitRealValue(ZLDropdownViewShowViewMaxHeight);
    }else {
        sViewH = ZLFitRealValue(sViewH);
    }
    sView.zl_y = sViewY;
    sView.zl_height = 0;
    sView.zl_width = sViewW;
    
    [dropdownVc.view addSubview:sView];
    
    [self animtionWithView:sView viewHeight:sViewH comletion:^{
        dropdownVc.viewClicked = ^{
            [weakSelf hideWithView:sView];
        };
    }];
}

/**
 隐藏view
 */
+ (void)hideWithView:(UIView *)sView {
    CGFloat sViewH = 0;
    
    [self animtionWithView:sView viewHeight:sViewH comletion:^{
        if (_window) {
            _window.hidden = YES;
            _window.rootViewController = nil;
            _window = nil;
        }
    }];
}
#pragma mark - UIView的动画方法
+ (void)animtionWithView:(UIView *)sView viewHeight:(CGFloat)sViewH comletion:(void(^)(void))comletion {
    
    [UIView animateWithDuration:ZLDropdownViewDuration delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        sView.zl_height = sViewH;
    } completion:^(BOOL finished) {
        if (comletion) {
            comletion();
        }
    }];
    
}

@end
