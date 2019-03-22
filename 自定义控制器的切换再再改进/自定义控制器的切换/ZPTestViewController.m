//
//  ZPTestViewController.m
//  自定义控制器的切换
//
//  Created by 赵鹏 on 2019/3/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ZPTestViewController.h"
#import "ZPOneTableViewController.h"
#import "ZPTwoViewController.h"
#import "ZPThreeViewController.h"

@interface ZPTestViewController ()

@end

@implementation ZPTestViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark ————— 点击One按钮 —————
/**
 这种做法的弊端在于：
 1、每次按按钮，就会创建一个新的视图控制器对象，而之前的视图控制器对象又不会被销毁，这样的话点击按钮的次数越多则创建出来的视图控制器对象越多，会占用手机很多的内存空间，显得很臃肿；
 2、下面创建的视图控制器对象是一个局部变量，它没有被任何指针指着，所以它只要出了这个方法就会被系统销毁，但这个视图控制器的view被加在了self.view上，它是self.view中的subviews数组里面的其中一个元素，它会被一个强指针指着，所以即便出了这个方法这个视图控制器的view也不会被系统销毁。上述的这种视图控制器已经被销毁了但它的view还存在的状况是非常不好的，会造成各种意想不到的情况。
 */
- (IBAction)clickOneButton:(id)sender
{
    ZPOneTableViewController *oneVC = [[ZPOneTableViewController alloc] init];
    oneVC.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:oneVC.view];
}

#pragma mark ————— 点击Two按钮 —————
- (IBAction)clickTwoButton:(id)sender
{
    ZPTwoViewController *twoVC = [[ZPTwoViewController alloc] init];
    twoVC.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:twoVC.view];
}

#pragma mark ————— 点击Three按钮 —————
- (IBAction)clickThreeButton:(id)sender
{
    ZPThreeViewController *threeVC = [[ZPThreeViewController alloc] init];
    threeVC.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:threeVC.view];
}

@end
