//
//  AppDelegate.m
//  PMPLife
//
//  Created by ChenQianPing on 16/2/21.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import "AppDelegate.h"
#import "QPFirstViewController.h"
#import "QPSecondViewController.h"
#import "QPThirdViewController.h"
#import "Const.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 主窗口设置
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 创建并初始化TabBarController
    self.tabBarController = [[UITabBarController alloc] init];
    self.window.rootViewController = self.tabBarController;
    
    
    // 创建三个控制器
    // QPFirst继承自UIViewController
    QPFirstViewController *QPFirst = [[QPFirstViewController alloc] init];
    // QPSecond继承自UITableViewController
    QPSecondViewController *QPSecond = [[QPSecondViewController alloc] init];
    // QPThird继承自UITableViewController
    QPThirdViewController *QPThird = [[QPThirdViewController alloc] init];
    
    // 为视图控制器添加导航栏控制器
    UINavigationController *navQPFirst= [[UINavigationController alloc]initWithRootViewController:QPFirst];
    UINavigationController *navQPSecond= [[UINavigationController alloc]initWithRootViewController:QPSecond];
    UINavigationController *navQPThird = [[UINavigationController alloc]initWithRootViewController:QPThird];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navQPFirst,navQPSecond,navQPThird,nil];
    
    // 设置标题
    navQPFirst.tabBarItem.title = @"首页";
    navQPSecond.tabBarItem.title = @"视频";
    navQPThird.tabBarItem.title = @"书籍";
    
    // 设置图标
    navQPFirst.tabBarItem.image = [UIImage imageNamed:@"iconfont-icon"];
    navQPSecond.tabBarItem.image = [UIImage imageNamed:@"iconfont-shipin"];
    navQPThird.tabBarItem.image = [UIImage imageNamed:@"iconfont-shuji"];
    
    navQPFirst.tabBarItem.selectedImage = [UIImage imageNamed:@"iconfont-icon"];
    navQPSecond.tabBarItem.selectedImage = [UIImage imageNamed:@"iconfont-shipin"];
    navQPThird.tabBarItem.selectedImage = [UIImage imageNamed:@"iconfont-shuji"];

    
    // 一些通用颜色设置
    [[UITabBar appearance] setTintColor:BASE_COLOR_MAIN];
    
    // 为UINavigationBar设置背景图片
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg.png"] forBarMetrics:UIBarMetricsDefault];
    
//    [[UINavigationBar appearance] setBarTintColor:BASE_COLOR_TOPBAR];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
