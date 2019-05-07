//
//  ZLDropDownViewController.m
//  ZLDropDownView
//
//  Created by iMobie on 18/1/31.
//  Copyright © 2018年 TsinHzl. All rights reserved.
//

#import "ZLDropDownViewController.h"

@implementation ZLDropDownViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.viewClicked) {
        self.viewClicked();
    }
}

@end
