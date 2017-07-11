//
//  ViewDetailBase.m
//  UIKitDetailUnder
//
//  Created by 海龙 on 2017/7/10.
//  Copyright © 2017年 海龙. All rights reserved.
//

#import "ViewDetailBase.h"
#import "BaseView.h"
@interface ViewDetailBase ()

@end

@implementation ViewDetailBase

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpSubViews];
}

-(void)setUpSubViews
{
    //创建一个view的子类
    BaseView *customBaseView = [[BaseView alloc]initWithFrame:CGRectMake(100, 300, 200, 200) backColor:[UIColor orangeColor]];
    customBaseView.clipsToBounds = YES;
    [self.view addSubview:customBaseView];
    //设置view显示的属性
    UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(100, 64, 200, 200)];
    baseView.backgroundColor = [UIColor greenColor];
    baseView.alpha = 0.5;
    //设置子view不自动适配父view尺寸
    baseView.autoresizesSubviews = NO;
    [self.view addSubview:baseView];
    
    //设置子view跟随父view的高度变化而变化
    UIView *subBaseView = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
    subBaseView.backgroundColor = [UIColor redColor];
    subBaseView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [baseView addSubview:subBaseView];
    
    //设置子view的maskview
    UIView *subView2 = [[UIView alloc]initWithFrame:CGRectMake(145, 145, 50, 50)];
    subView2.backgroundColor = [UIColor grayColor];
    
    UIView *maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    maskView.backgroundColor = [UIColor blueColor];
    subView2.maskView = maskView;
    [baseView addSubview:subView2];
    
    baseView.frame = CGRectMake(100, 64, 100, 200);
    
    UIView *customSubBaseView = [[UIView alloc]init];
    customSubBaseView.backgroundColor = [UIColor darkGrayColor];
    customSubBaseView.frame = CGRectMake(-5, -5, 50, 50);
    [customBaseView addSubview:customSubBaseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
