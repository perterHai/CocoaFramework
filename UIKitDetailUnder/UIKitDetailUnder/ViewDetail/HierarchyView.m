//
//  HierarchyView.m
//  UIKitDetailUnder
//
//  Created by 海龙 on 2017/7/12.
//  Copyright © 2017年 海龙. All rights reserved.
//

#import "HierarchyView.h"

@implementation HierarchyView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubviews];
    }
    return self;
}

-(void)setUpSubviews
{
    UIView *redSubView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.frame.size.width, CGRectGetMaxY(self.frame)/3)];
    redSubView.backgroundColor = [UIColor redColor];
    //[baseView addSubview:redSubView];
    [self insertSubview:redSubView atIndex:0];
    //    [redSubView removeFromSuperview];
    
    UIView *yellowSubView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(redSubView.frame)-64, CGRectGetMaxX(self.frame), CGRectGetHeight(redSubView.frame))];
    yellowSubView.backgroundColor = [UIColor yellowColor];
    // [baseView addSubview:yellowSubView];
    //[baseView insertSubview:yellowSubView atIndex:0];
    [self insertSubview:yellowSubView aboveSubview:redSubView];
    
    UIView *greenSubView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(yellowSubView.frame)-64, CGRectGetMaxX(self.frame), CGRectGetHeight(yellowSubView.frame))];
    greenSubView.backgroundColor = [UIColor greenColor];
    //[baseView addSubview:greenSubView];
    [self insertSubview:greenSubView belowSubview:redSubView];
    
    if ([self isDescendantOfView:greenSubView]) {
        NSLog(@"baseView是greenSubview的子视图 YES");
    }
    else
    {
        NSLog(@"baseView不是greenSubview的子视图NO");
    }
    
    if ([greenSubView isDescendantOfView:self]) {
        NSLog(@"greenSubView是baseView的子视图YES");
    }
    else
    {
        NSLog(@"greenSubView不是baseView的子视图YNO");
    }
    
    NSLog(@"baseView的subview：%@",self.subviews);
    NSLog(@"baseView的superview:%@",self.superview);
    NSLog(@"baseView的window:%@",self.window);
    
    [self setUpRedSubviews:redSubView];
}


-(void)setUpRedSubviews:(UIView *)redSubview
{
    UIView *subview1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    subview1.center = CGPointMake(redSubview.center.x, redSubview.center.y-64-50);
    subview1.backgroundColor = [UIColor colorWithRed:30/255.0 green:40/255.0 blue:50/255.0 alpha:1];
    [redSubview addSubview:subview1];
    
    UIView *subview2 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(subview1.frame)-20, CGRectGetMaxY(subview1.frame)-30, 50, 50)];
    subview2.backgroundColor = [UIColor colorWithRed:200/255.0 green:50/255.0 blue:60/255.0 alpha:1];
    [redSubview addSubview:subview2];
    
    UIView *subview3 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(subview1.frame)-30, CGRectGetMaxY(subview1.frame)-20, 50, 50)];
    subview3.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:60/255.0 alpha:1];
    [redSubview addSubview:subview3];
    //把subview1放在最上层
    [redSubview bringSubviewToFront:subview1];
    //subview3放在最下层
    [redSubview sendSubviewToBack:subview3];
    //交换最底层视图和最上层视图
    [redSubview exchangeSubviewAtIndex:0 withSubviewAtIndex:redSubview.subviews.count-1];
}

@end
