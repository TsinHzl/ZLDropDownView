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
@property(nonatomic, strong)UIView *blueView;
@property(nonatomic, strong)UIView *greenView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 350.f)];
    bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bgView];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, bgView.frame.size.width, 20)];
    greenView.backgroundColor = [UIColor greenColor];
    [bgView addSubview:greenView];
    self.greenView = greenView;
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 25, bgView.frame.size.width, 25)];
    blueView.backgroundColor = [UIColor blueColor];
    [greenView addSubview:blueView];
    self.blueView = blueView;
    
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(0, 40.f, self.view.bounds.size.width, 66.f)];
    view.backgroundColor = [UIColor cyanColor];
    self.bView = view;
    [blueView addSubview:view];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIView *sView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.bounds.size.width, 200.f)];
    sView.backgroundColor = [UIColor magentaColor];
    [ZLDropDownView showWithView:sView belowView:self.blueView width:0 height:200.f];
}
@end
