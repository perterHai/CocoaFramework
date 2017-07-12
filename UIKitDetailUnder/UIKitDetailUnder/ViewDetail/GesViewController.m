//
//  GesViewController.m
//  UIKitDetailUnder
//
//  Created by 海龙 on 2017/7/12.
//  Copyright © 2017年 海龙. All rights reserved.
//

#import "GesViewController.h"
#import "GesView.h"
@interface GesViewController ()

@end

@implementation GesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    GesView *gesView = [[GesView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame))];
    [self.view addSubview:gesView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
