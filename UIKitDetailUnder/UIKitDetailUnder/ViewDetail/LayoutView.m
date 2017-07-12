//
//  LayoutView.m
//  UIKitDetailUnder
//
//  Created by 海龙 on 2017/7/12.
//  Copyright © 2017年 海龙. All rights reserved.
//

#import "LayoutView.h"

@implementation LayoutView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubviews];
        [self sizeToFit];
    }
    return self;
}

-(void)setUpSubviews
{
    UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    baseView.backgroundColor = [UIColor grayColor];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addSubview:baseView];
    });
    
    UIView *baseSubview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 110, 110)];
    baseSubview.backgroundColor = [UIColor darkGrayColor];
    //设置为no时，子视图的 autoresizingMask将不起作用
    baseSubview.autoresizesSubviews = NO;
    [baseView addSubview:baseSubview];
    
    UIView *maskAutoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    maskAutoView.backgroundColor = [UIColor redColor];
    maskAutoView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [baseSubview addSubview:maskAutoView];
    
    NSLog(@"%d",self.translatesAutoresizingMaskIntoConstraints);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.frame = CGRectMake(0, 64, self.frame.size.width, 300);
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setNeedsLayout];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self layoutIfNeeded];
    });
}

-(CGSize)sizeThatFits:(CGSize)size
{
    CGSize superSize = [super sizeThatFits:size];
    superSize = CGSizeMake(superSize.width, superSize.height-100);
    return superSize;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

@end
