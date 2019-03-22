//
//  ZPThreeViewController.m
//  自定义控制器的切换
//
//  Created by apple on 2016/12/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPThreeViewController.h"

@interface ZPThreeViewController ()

@end

@implementation ZPThreeViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark ————— 屏幕旋转调用的方法 —————
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"%@的屏幕旋转了", self);
}

-(void)dealloc
{
    NSLog(@"%@被销毁了", self);
}

@end
