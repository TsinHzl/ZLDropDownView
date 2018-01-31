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

static UIWindow *_window = nil;

@implementation ZLDropDownView

+ (void)setup {
    _window = [[UIWindow alloc] initWithFrame:ZLScreenBounds];
    _window.windowLevel = UIWindowLevelNormal;
    _window.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25];
    _window.hidden = NO;
}


@end
