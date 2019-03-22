//
//  ViewController.m
//  自定义控制器的切换
//
//  Created by apple on 2016/12/5.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 1、如果一个视图控制器A的view加在了另一个视图控制器B的view的上面则这两个视图控制器也应该设置为父子关系，如果不设置的话可能会引起意想不到的问题。
 伪代码：
 [A.view addSubView:B.view];
 [A addChildViewController:B];
 
 2、如果一个视图控制器C的view间接地加在了另一个视图控制器A的view上面则这两个视图控制器也应该设置为父子关系，如果不设置的话可能会引起意想不到的问题。
 伪代码：
 [A.view addSubView:B.View];
 [B.View addSubView:C.View];
 [A addChildViewController:B];
 [A addChildViewController:C];
 */
#import "ViewController.h"
#import "ZPOneTableViewController.h"
#import "ZPTwoViewController.h"
#import "ZPThreeViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIViewController *showingVC;
@property (nonatomic, strong) NSArray *allVCs;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZPOneTableViewController *oneVC = [[ZPOneTableViewController alloc] init];
    ZPTwoViewController *twoVC = [[ZPTwoViewController alloc] init];
    ZPThreeViewController *threeVC = [[ZPThreeViewController alloc] init];
    
    /**
     通过下面的代码oneVC、twoVC和threeVC会成为本视图控制器的子视图控制器，他们之间的关系为父子关系，当有重大信息的时候可以通过父视图控制器把消息传递给它的子视图控制器；
     如果是系统自己把两个视图控制器设为父子关系（通过storyboard）的话，则当父视图控制器所代表的屏幕旋转的时候系统只会自动调用它自己类中的"willRotateToInterfaceOrientation: duration: "方法，当子视图控制器所代表的屏幕旋转的时候系统只会自动调用它自己类中的此方法；
     如果在代码中调用"addChildViewController:"方法手动把子视图控制器加入到父视图控制器中的话，则当父视图控制器所代表的屏幕旋转的时候系统只会自动调用它自己类中的"willRotateToInterfaceOrientation: duration: "方法，当子视图控制器所代表的屏幕旋转的时候系统会先调用它的父视图控制器类中此方法，然后才会调用子视图控制器类中的此方法。
     */
    [self addChildViewController:oneVC];
    [self addChildViewController:twoVC];
    [self addChildViewController:threeVC];
    
    /**
     如果撰写下行代码的话则应该在相应的子控制器类(ZPOneTableViewController)中撰写"didMoveToParentViewController:"方法，这样的话系统会调用这个子控制器类中的这个方法了；
     可以利用子视图控制器中的"didMoveToParentViewController:"方法来监听这个子视图控制器被添加到哪个父视图控制器中了，也可以用来监听这个子视图控制器被从它的父视图控制器中移除。
     */
//    [oneVC didMoveToParentViewController:self];
//    [oneVC removeFromParentViewController];
}

#pragma mark ————— 点击三个按钮调用的方法 —————
- (IBAction)buttonClick:(UIButton *)sender
{
    //把当前显示的视图控制器的view从它的父视图上移除
    [self.showingVC.view removeFromSuperview];
    
    //获取点击的是第几个按钮
    NSUInteger newIndex = [sender.superview.subviews indexOfObject:sender];
    
    //获取当前显示的视图控制器的索引
    NSUInteger currentIndex = [self.childViewControllers indexOfObject:self.showingVC];
    
    //获取即将要显示的视图控制器
    self.showingVC = [self.childViewControllers objectAtIndex:newIndex];
    
    //设置即将要显示的视图控制器的view的尺寸
    self.showingVC.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    
    //把即将要显示的view添加到self.view上面
    [self.view addSubview:self.showingVC.view];
    
    //设置转场动画
    CATransition *transition = [CATransition animation];
    transition.type = @"cube";
    transition.subtype = newIndex > currentIndex ? kCATransitionFromRight : kCATransitionFromLeft;  //如果点击的按钮的索引大于当前显示的视图控制器的索引就从右面转场过来，反之总左面转场过来
    transition.duration = 1.0;
    [self.view.layer addAnimation:transition forKey:nil];
}

#pragma mark ————— 屏幕旋转调用的方法 —————
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"%@的屏幕旋转了", self);
}

@end
