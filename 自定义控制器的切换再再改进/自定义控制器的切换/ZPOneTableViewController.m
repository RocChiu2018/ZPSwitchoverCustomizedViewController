//
//  ZPOneTableViewController.m
//  自定义控制器的切换
//
//  Created by apple on 2016/12/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPOneTableViewController.h"

@interface ZPOneTableViewController ()

@end

@implementation ZPOneTableViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //获取本子视图控制器的父视图控制器
    UIViewController *parentVC =self.parentViewController;
    NSLog(@"parentVC = %@", parentVC);
    
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"one"];
}

/**
 要在它的父视图控制器中主动调用"didMoveToParentViewController:"方法，系统才会在本类中调用这个方法了；
 可以利用这个方法监听本子视图控制器被添加到哪个父视图控制器中了，在这种情况下方法中传过来的parent参数就是那个父视图控制器。除此之外，也可以利用这个方法监听本子视图控制器被从它的父视图控制器中移除，在这种情况下方法中传过来的parent参数是nil。
 */
-(void)didMoveToParentViewController:(UIViewController *)parent
{
    [super didMoveToParentViewController:parent];
    
    NSLog(@"didMoveToParentViewController - %@", parent);
}

#pragma mark ————— UITableViewDataSource —————
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"one"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"one - %zd", indexPath.row];
    
    return cell;
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
