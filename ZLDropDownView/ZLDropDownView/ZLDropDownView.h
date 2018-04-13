//
//  ZLDropDownView.h
//  ZLDropDownView
//
//  Created by iMobie on 18/1/30.
//  Copyright © 2018年 TsinHzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLDropDownView : NSObject

/**
 show要显示的view

 @param sView 要显示的view
 @param bView 要显示在哪个view下面，最好事先设置好要显示view的宽高，如果没设置的话，默认设置宽度为屏幕宽，高度为200.f
 */
+ (void)showWithView:(UIView *)sView belowView:(UIView *)bView;

@end
