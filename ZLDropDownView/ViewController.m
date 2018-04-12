//
//  ViewController.m
//  ZLDropDownView
//
//  Created by iMobie on 18/1/29.
//  Copyright © 2018年 TsinHzl. All rights reserved.
//

#import "ViewController.h"
#import "ZLDropDownView.h"


@interface ViewController ()

@property(nonatomic, strong)UIView *bView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 350.f)];
    bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bgView];
    
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(0, 40.f, self.view.bounds.size.width, 66.f)];
    view.backgroundColor = [UIColor cyanColor];
    self.bView = view;
    [bgView addSubview:view];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIView *sView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.bounds.size.width, 200.f)];
    sView.backgroundColor = [UIColor magentaColor];
    [ZLDropDownView showWithView:sView belowView:self.bView width:0 height:200.f];
}
@end
