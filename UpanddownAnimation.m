//
//  UpanddownAnimation.m
//  donghua
//
//  Created by 谢霆锋 on 2017/3/9.
//  Copyright © 2017年 zbh. All rights reserved.
//
#import "UIView+Coordinate.h"
#import "UpanddownAnimation.h"
#define MY_RED_COLOR            UIColorFromRGB(0xff5376) //红色（上涨）
#define MY_GREEN_COLOR          UIColorFromRGB(0x00ce64) //绿色（下跌）
#define mainHeight      [[UIScreen mainScreen] bounds].size.height
#define mainWidth       [[UIScreen mainScreen] bounds].size.width
/**定义颜色的宏*/
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface UpanddownAnimation()
{
    UILabel *_upLab;//今日用户买涨
    UILabel *_lowLab;//今日用户买跌
    
}
@end
@implementation UpanddownAnimation

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        [self setUI];
    }
    return self;
}
- (void)setUI{
    float tempX = 13;
    _upLab = [[UILabel alloc]initWithFrame:CGRectMake(tempX,6, (mainWidth-2*tempX)/3, 15)];
    _upLab.text = @"买涨 50%";
    _upLab.textColor = MY_RED_COLOR;
    _upLab.textAlignment = NSTextAlignmentLeft;
    _upLab.font = [UIFont systemFontOfSize:11];
    [self addSubview:_upLab];
    
    UILabel *daylabel = [[UILabel alloc]initWithFrame:CGRectMake(tempX+(mainWidth-2*tempX)/3,_upLab.y, (mainWidth-2*tempX)/3, 15)];
    daylabel.text = @"今日用户操作";
    daylabel.textColor = UIColorFromRGB(0x878787);
    daylabel.textAlignment = NSTextAlignmentCenter;
    daylabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:daylabel];

    _lowLab = [[UILabel alloc]initWithFrame:CGRectMake(tempX+(mainWidth-2*tempX)*2/3,_upLab.y, (mainWidth-2*tempX)/3, 15)];
    _lowLab.text = @"买跌 50%";
    _lowLab.textColor = MY_GREEN_COLOR;
    _lowLab.textAlignment = NSTextAlignmentRight;
    _lowLab.font = [UIFont systemFontOfSize:11];
    [self addSubview:_lowLab];

    self.bgline = [[UILabel alloc]initWithFrame:CGRectMake(tempX,0, mainWidth-2*tempX, 3)];
    self.bgline.backgroundColor = MY_GREEN_COLOR;
    //    self.bgline.layer.cornerRadius = 2;
    self.bgline.clipsToBounds = YES;
    [self addSubview:self.bgline];

    _upLine = [[UILabel alloc]initWithFrame:CGRectMake(0,0, (mainWidth-2*tempX)/2, 3)];
    _upLine.backgroundColor = MY_RED_COLOR;
    //    _upLine.layer.cornerRadius = 2;
    _upLine.clipsToBounds = YES;
    [self.bgline addSubview:_upLine];

    UIColor *_inputColor0 = UIColorFromRGB(0xf58251);
    UIColor *_inputColor1 = UIColorFromRGB(0xff5376);

    //渐变层
    _upAnimateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, CGRectGetHeight(self.bgline.bounds))];
    _inputColor0 = [UIColor colorWithWhite:1 alpha:0];
    _inputColor1 = [UIColor colorWithWhite:1 alpha:0.5];
    CAGradientLayer *upAnimateLayer = [CAGradientLayer new];
    upAnimateLayer.colors = @[(__bridge id)_inputColor0.CGColor, (__bridge id)_inputColor1.CGColor];
    upAnimateLayer.startPoint = CGPointMake(0, 0);
    upAnimateLayer.endPoint = CGPointMake(1, 0);
    upAnimateLayer.frame = _upAnimateView.bounds;
    [_upAnimateView.layer addSublayer:upAnimateLayer];
    [self.bgline addSubview:_upAnimateView];

    _downAnimateView = [[UIView alloc] initWithFrame:CGRectMake(self.bgline.width-_upAnimateView.width, 0, 60, self.bgline.height)];
    CAGradientLayer *downAnimateLayer = [CAGradientLayer new];
    downAnimateLayer.colors = @[(__bridge id)_inputColor0.CGColor, (__bridge id)_inputColor1.CGColor];
    downAnimateLayer.startPoint = CGPointMake(1, 0);
    downAnimateLayer.endPoint = CGPointMake(0, 0);
    downAnimateLayer.frame = _downAnimateView.bounds;
    [_downAnimateView.layer addSublayer:downAnimateLayer];
    [self.bgline addSubview:_downAnimateView];
}
@end
