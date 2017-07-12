//
//  GesView.m
//  UIKitDetailUnder
//
//  Created by 海龙 on 2017/7/12.
//  Copyright © 2017年 海龙. All rights reserved.
//

#import "GesView.h"

@interface GesView()
@property (nonnull, nonatomic, strong) UIView *baseView;
@property (nullable, nonatomic, strong) UITapGestureRecognizer *gestrueRec;
@property (nullable, nonatomic, strong) UILongPressGestureRecognizer *longGes;
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
    self.baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.frame.size.width, 100)];
    self.baseView.backgroundColor = [UIColor redColor];
    [self addSubview:self.baseView];
    //增加点击手势
    self.gestrueRec = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeSubviewColor:)];
    [self.baseView addGestureRecognizer:self.gestrueRec];
    //增加长按手势
    self.longGes = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(showMessage:)];
    [self.baseView addGestureRecognizer:self.longGes];
    //增加子视图
    self.changeView = [[UIView alloc]initWithFrame:CGRectMake(50, 30, 50, 50)];
    self.changeView.backgroundColor = [UIColor greenColor];
    [self.baseView addSubview:self.changeView];
    //子视图添加点击手势
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
    self.baseView.backgroundColor = [UIColor colorWithRed:redColor/255.0 green:greenColor/255.0 blue:blueColor/255.0 alpha:1];
}

-(void)showMessage:(UILongPressGestureRecognizer *)longGes
{
    if (longGes.state == UIGestureRecognizerStateBegan) {
        NSString *messageStr = [NSString stringWithFormat:@"有%lu个事件,并删除点击事件",self.baseView.gestureRecognizers.count];
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"手势事件" message:messageStr delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
        [alertView show];
    }
    [self.baseView removeGestureRecognizer:self.gestrueRec];
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect coveRect = [self.changeView convertRect:self.changeView.bounds toView:nil];
    CGRect bigChangeFrame = CGRectMake(CGRectGetMinX(coveRect)-10, CGRectGetMinY(coveRect)-10, CGRectGetWidth(coveRect)+20, CGRectGetHeight(coveRect)+20);
    if (CGRectContainsPoint(bigChangeFrame, point)) {
        return self.changeView;
    }
    return [super hitTest:point withEvent:event];
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL result = [super pointInside:point withEvent:event];
    return result;
}

@end
