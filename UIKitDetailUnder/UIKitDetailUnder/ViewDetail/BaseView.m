//
//  BaseView.m
//  UIKitDetailUnder
//
//  Created by 海龙 on 2017/7/11.
//  Copyright © 2017年 海龙. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

-(instancetype)initWithFrame:(CGRect)frame backColor:(UIColor *)backColor
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = backColor;
    }
    return self;
}

@end
