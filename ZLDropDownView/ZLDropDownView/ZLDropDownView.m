//
//  ZLDropDownView.m
//  ZLDropDownView
//
//  Created by iMobie on 18/1/30.
//  Copyright © 2018年 TsinHzl. All rights reserved.
//

#import "ZLDropDownView.h"
#import "ZLDropDownViewController.h"

#define ZLScreenBounds [UIScreen mainScreen].bounds
#define ZLScreenSize [UIScreen mainScreen].bounds.size
#define ZLScreenWidth [UIScreen mainScreen].bounds.size.width
#define ZLScreenHeight [UIScreen mainScreen].bounds.size.height

/**  屏幕适配，这里是以iphone6的宽度作为标准的，当然也可以使用其他机型的宽度或者是高度 ***/
#define ZLFitRealValue(value) ((value)/750.0f*[UIScreen mainScreen].bounds.size.width)

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

+ (void)showWithView:(UIView *)wView belowView:(UIView *)bView {
    CGRect cFrame = [bView convertRect:bView.frame toView:_window];
}
@end
