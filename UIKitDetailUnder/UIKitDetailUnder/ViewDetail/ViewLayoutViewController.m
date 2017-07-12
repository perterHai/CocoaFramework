//
//  ViewLayoutViewController.m
//  UIKitDetailUnder
//
//  Created by 海龙 on 2017/7/12.
//  Copyright © 2017年 海龙. All rights reserved.
//

#import "ViewLayoutViewController.h"
#import "LayoutView.h"

@interface ViewLayoutViewController ()

@end

@implementation ViewLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视图布局";
    self.view.backgroundColor = [UIColor whiteColor];
    LayoutView *baseView = [[LayoutView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    baseView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    [self.view addSubview:baseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
