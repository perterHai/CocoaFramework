//
//  GesView.m
//  UIKitDetailUnder
//
//  Created by 海龙 on 2017/7/12.
//  Copyright © 2017年 海龙. All rights reserved.
//

#import "GesView.h"

@interface GesView()
@property (nonnull, nonatomic, strong) UIView *gesView;
@property (nullable, nonatomic, strong) UITapGestureRecognizer *gestrueRec;
@property (nonnull, nonatomic, strong) UIView *changeView;
@property (nullable, nonatomic, strong) UITapGestureRecognizer *changeGes;
@end

@implementation GesView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubviews];
    }
    return self;
}

-(void)setUpSubviews
{
    self.gesView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.frame.size.width, 100)];
    self.gesView.backgroundColor = [UIColor redColor];
    [self addSubview:self.gesView];
    
    self.gestrueRec = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeSubviewColor:)];
    [self.gesView addGestureRecognizer:self.gestrueRec];
    self.changeView = [[UIView alloc]initWithFrame:CGRectMake(50, 30, 50, 50)];
    self.changeView.backgroundColor = [UIColor greenColor];
    [self.gesView addSubview:self.changeView];
    
    self.changeGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeSuperviewColor:)];
    [self.changeView addGestureRecognizer:self.changeGes];
}

-(void)changeSubviewColor:(UIGestureRecognizer *)ges
{
    NSInteger redColor = arc4random()%255;
    NSInteger greenColor = arc4random()%255;
    NSInteger blueColor = arc4random()%255;
    self.changeView.backgroundColor = [UIColor colorWithRed:redColor/255.0 green:greenColor/255.0 blue:blueColor/255.0 alpha:1];
}

-(void)changeSuperviewColor:(UIGestureRecognizer *)ges
{
    NSInteger redColor = arc4random()%255;
    NSInteger greenColor = arc4random()%255;
    NSInteger blueColor = arc4random()%255;
    self.gesView.backgroundColor = [UIColor colorWithRed:redColor/255.0 green:greenColor/255.0 blue:blueColor/255.0 alpha:1];
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return [super hitTest:point withEvent:event];
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL result = [super pointInside:point withEvent:event];
    return result;
}

@end
