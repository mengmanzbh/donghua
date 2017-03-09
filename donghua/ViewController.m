//
//  ViewController.m
//  donghua
//
//  Created by 谢霆锋 on 2017/3/9.
//  Copyright © 2017年 zbh. All rights reserved.
//

#import "ViewController.h"
#import "UpanddownAnimation.h"
#import "UIView+Coordinate.h"

@interface ViewController ()
{
    NSTimer *animateTimer;
}
@property (strong, nonatomic) UpanddownAnimation *upanddownAnimation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (animateTimer) {
        [animateTimer invalidate];
        animateTimer = nil;
    }
    animateTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeToAnimate) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:animateTimer forMode:NSRunLoopCommonModes];
    
    self.upanddownAnimation =[[UpanddownAnimation alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 20)];
    [self.view addSubview:self.upanddownAnimation];
    
    //网络请求改变30就可以了
    self.upanddownAnimation.upLine.width = self.upanddownAnimation.bgline.width*30*0.01;
}
- (void)timeToAnimate{
    self.upanddownAnimation.upAnimateView.x = -self.upanddownAnimation.downAnimateView.width;
    self.upanddownAnimation.downAnimateView.x = self.upanddownAnimation.bgline.width;
    [UIView animateWithDuration:1.9 animations:^{
        self.upanddownAnimation.upAnimateView.x =  self.upanddownAnimation.upLine.width - self.upanddownAnimation.upAnimateView.width;
        self.upanddownAnimation.downAnimateView.x =  self.upanddownAnimation.upLine.width;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
