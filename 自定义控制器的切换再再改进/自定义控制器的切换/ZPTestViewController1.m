//
//  ZPTestViewController1.m
//  自定义控制器的切换
//
//  Created by 赵鹏 on 2019/3/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ZPTestViewController1.h"
#import "ZPOneTableViewController.h"
#import "ZPTwoViewController.h"
#import "ZPThreeViewController.h"

@interface ZPTestViewController1 ()

@property (nonatomic, strong) ZPOneTableViewController *oneVC;  //强引用视图控制器对象属性就可以避免局部变量出了所在方法的范围后就会被系统销毁的问题。
@property (nonatomic, strong) ZPTwoViewController *twoVC;
@property (nonatomic, strong) ZPThreeViewController *threeVC;
@property (nonatomic, weak) UIViewController *showingVC;  //当前显示的视图控制器，能用weak修饰的就要用weak来修饰。

@end

@implementation ZPTestViewController1

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark ————— 点击One按钮 —————
- (IBAction)clickOneButton:(id)sender
{
    if (self.oneVC == nil)
    {
        self.oneVC = [[ZPOneTableViewController alloc] init];
        self.oneVC.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    }
    
    /**
     移除不需要显示的视图控制器的view：
     通过点击三个按钮，先后会把三个视图控制器的View都加在self.view上，以后每次在按某个按钮的时候就会把其中的一个view放到最上面，另外的两个view则隐藏在下面，这样的话每次显示的时候系统还要绘制下面两层的view，就会比较占用系统的资源，所以在点击某个按钮之后让不需要显示的view暂时移除（只是移除，不是销毁，只是把对应的视图控制器对象放到了内存中），只显示需要显示的view。
     */
    [self.showingVC.view removeFromSuperview];
    
    [self.view addSubview:self.oneVC.view];
    
    self.showingVC = self.oneVC;
}

#pragma mark ————— 点击Two按钮 —————
- (IBAction)clickTwoButton:(id)sender
{
    if (self.twoVC == nil)
    {
        self.twoVC = [[ZPTwoViewController alloc] init];
        self.twoVC.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    }
    
    [self.showingVC.view removeFromSuperview];
    
    [self.view addSubview:self.twoVC.view];
    
    self.showingVC = self.twoVC;
}

#pragma mark ————— 点击Three按钮 —————
- (IBAction)clickThreeButton:(id)sender
{
    if (self.threeVC == nil)
    {
        self.threeVC = [[ZPThreeViewController alloc] init];
        self.threeVC.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    }
    
    [self.showingVC.view removeFromSuperview];
    
    [self.view addSubview:self.threeVC.view];
    
    self.showingVC = self.threeVC;
}

@end
