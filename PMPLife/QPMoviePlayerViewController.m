//
//  QPMoviePlayerViewController.m
//  PMPLife
//
//  Created by ChenQianPing on 16/2/22.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import "QPMoviePlayerViewController.h"

@implementation QPMoviePlayerViewController

- (void)viewDidLoad
{
    // 移除程序进入后台的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    
}

#pragma mark - 实现屏幕方向的控制
// 播放界面只支持横屏
- (NSUInteger)supportedInterfaceOrientations
{
    // UIInterfaceOrientationMaskPortrait:竖屏（正常）
    // UIInterfaceOrientationMaskPortraitUpsideDown:竖屏（上下颠倒）
    // UIInterfaceOrientationMaskLandscapeLeft:横屏向左
    // UIInterfaceOrientationMaskLandscapeRight:横屏向右
    // UIInterfaceOrientationMaskLandscape:横屏（左右都支持）
    // UIInterfaceOrientationMaskAll:所有都支持
    return UIInterfaceOrientationMaskLandscape;
}

@end
