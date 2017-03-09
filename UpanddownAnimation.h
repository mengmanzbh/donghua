//
//  UpanddownAnimation.h
//  donghua
//
//  Created by 谢霆锋 on 2017/3/9.
//  Copyright © 2017年 zbh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpanddownAnimation : UIView
@property (strong, nonatomic) UIView *upAnimateView;
@property (strong, nonatomic) UIView *downAnimateView;
@property (strong, nonatomic) UILabel *upLine;//买涨的显示红线
@property (strong, nonatomic) UILabel *bgline;//总线

@end
