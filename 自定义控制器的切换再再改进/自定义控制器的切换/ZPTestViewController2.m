//
//  ZPTestViewController2.m
//  自定义控制器的切换
//
//  Created by 赵鹏 on 2019/3/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ZPTestViewController2.h"
#import "ZPOneTableViewController.h"
#import "ZPTwoViewController.h"
#import "ZPThreeViewController.h"

@interface ZPTestViewController2 ()

@property (nonatomic, weak) UIViewController *showingVC;  //当前显示的视图控制器
@property (nonatomic, strong) NSArray *allVCs;  //所有视图控制器的集合

@end

@implementation ZPTestViewController2

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ZPOneTableViewController *oneVC = [[ZPOneTableViewController alloc] init];
    ZPTwoViewController *twoVC = [[ZPTwoViewController alloc] init];
    ZPThreeViewController *threeVC = [[ZPThreeViewController alloc] init];
    
    self.allVCs = [NSArray arrayWithObjects:oneVC, twoVC, threeVC, nil];
}

#pragma mark ————— 点击One按钮 —————
- (IBAction)clickOneButton:(id)sender
{
    //把当前显示的视图控制器的view从它的父视图上移除
    [self.showingVC.view removeFromSuperview];
    
    /**
     获取点击到的视图控制器的view：
     从数组中取出来的对象都是id类型的，所以不能直接使用点语法。
     */
    UIView *newView = [[self.allVCs objectAtIndex:0] view];
    
    //设置新获取到的view的尺寸
    newView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    
    //把新获得到的view加在self.view上面
    [self.view addSubview:newView];
    
    //让点击到的视图控制器成为当前显示的视图控制器
    self.showingVC = [self.allVCs objectAtIndex:0];
}

#pragma mark ————— 点击Two按钮 —————
- (IBAction)clickTwoButton:(id)sender
{
    [self.showingVC.view removeFromSuperview];
    
    UIView *newView = [[self.allVCs objectAtIndex:1] view];
    newView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:newView];
    
    self.showingVC = [self.allVCs objectAtIndex:1];
}

#pragma mark ————— 点击Three按钮 —————
- (IBAction)clickThreeButton:(id)sender
{
    [self.showingVC.view removeFromSuperview];
    
    UIView *newView = [[self.allVCs objectAtIndex:2] view];
    newView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:newView];
    
    self.showingVC = [self.allVCs objectAtIndex:2];
}
@end
