//
//  LZTabBarController.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZTabBarController.h"
#import "LZBasicNavigationController.h"
#import "LZAssetsTableViewController.h"
#import "LZHomeViewController.h"
#import "LZDiscoverTableViewController.h"
#import "LZServiceTableViewController.h"

@interface LZTabBarController ()

@end

@implementation LZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self setupChildControllers];
}

/**
 *  添加子控制器
 */

- (void)setupChildControllers
{
    LZHomeViewController *homeVC = [[LZHomeViewController alloc] init];
//    homeVC.view.backgroundColor = LZRandomColor;
    [self addChildVC:homeVC image:[UIImage imageNamed:@"TabBar_HomeBar"] selImage:[UIImage imageNamed:@"TabBar_HomeBar_Sel"] title:@"支付宝"];
    LZServiceTableViewController *serviceVC = [[LZServiceTableViewController alloc] init];
//    serviceVC.view.backgroundColor = LZRandomColor;
    [self addChildVC:serviceVC image:[UIImage imageNamed:@"TabBar_PublicService"] selImage:[UIImage imageNamed:@"TabBar_PublicService_Sel"] title:@"服务窗"];
    LZDiscoverTableViewController *discoverVC = [[LZDiscoverTableViewController alloc] init];
//    discoverVC.view.backgroundColor = LZRandomColor;
    [self addChildVC:discoverVC image:[UIImage imageNamed:@"TabBar_Discovery"] selImage:[UIImage imageNamed:@"TabBar_Discovery_Sel"] title:@"发现"];
    LZAssetsTableViewController *assetVC = [[LZAssetsTableViewController alloc] init];
//    assetVC.view.backgroundColor = LZRandomColor;
    [self addChildVC:assetVC image:[UIImage imageNamed:@"TabBar_Assets"] selImage:[UIImage imageNamed:@"TabBar_Assets_Sel"] title:@"财富"];
}

- (void)addChildVC:(UIViewController *)childVC image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title
{
    childVC.title = title;
    childVC.tabBarItem.image = image;
    childVC.tabBarItem.selectedImage = selImage;
    LZBasicNavigationController *nav = [[LZBasicNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}




@end
