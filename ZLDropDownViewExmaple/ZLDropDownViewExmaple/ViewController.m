//
//  ViewController.m
//  ZLDropDownViewExmaple
//
//  Created by MacBook on 2019/5/7.
//  Copyright © 2019 MacBook. All rights reserved.
//

#import "ViewController.h"
#import "ZLDropDownView.h"


@interface ViewController ()

@property(nonatomic, strong)UIButton *cyanView;
@property(nonatomic, strong)UIButton *blueView;
@property(nonatomic, strong)UIButton *greenView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 350.f)];
    bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bgView];
    
    UIButton *greenView = [[UIButton alloc] initWithFrame:CGRectMake(0, 40, bgView.frame.size.width, 200)];
    greenView.backgroundColor = [UIColor greenColor];
    [bgView addSubview:greenView];
    self.greenView = greenView;
    
    UIButton *blueView = [[UIButton alloc] initWithFrame:CGRectMake(0, 25, bgView.frame.size.width, 100)];
    blueView.backgroundColor = [UIColor blueColor];
    [greenView addSubview:blueView];
    self.blueView = blueView;
    
    UIButton *cyanView = [[UIButton alloc] initWithFrame: CGRectMake(0, 40.f, self.view.bounds.size.width, 44.f)];
    cyanView.backgroundColor = [UIColor cyanColor];
    self.cyanView = cyanView;
    [blueView addSubview:cyanView];
    
    
    [greenView addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [blueView addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cyanView addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}



- (void)btnClicked:(UIButton *)btn {
    UIView *sView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.bounds.size.width, 200.f)];
    sView.backgroundColor = [UIColor magentaColor];
    [ZLDropDownView showWithView:sView belowView:btn];
}
@end
