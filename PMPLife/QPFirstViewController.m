//
//  QPFirstViewController.m
//  PMPLife
//
//  Created by ChenQianPing on 16/2/21.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import "QPFirstViewController.h"
#import "UrlDefine.h"

@interface QPFirstViewController () <UIWebViewDelegate>

@end

@implementation QPFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"首页";
    
//    [self getProjectNameAndVersion];
//    [self getUserInterfaceIdiom];

    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0f,0.0f,self.view.bounds.size.width,self.view.bounds.size.height)];
    [self.view addSubview:_webView];
    
    // 禁用autoresizing
    _webView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 创建并添加约束
    
    // webView左侧与父视图左侧对齐
    NSLayoutConstraint* leftConstraint = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f];
    
    // webView左侧与父视图右侧对齐
    NSLayoutConstraint* rightConstraint = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f];
    
    // webView顶部与父视图顶部对齐
    NSLayoutConstraint* topConstraint = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f];
    
    // _webView高度为父视图高度
    NSLayoutConstraint* heightConstraint = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f];
    
    // iOS 6.0或者7.0调用addConstraints
    [self.view addConstraints:@[leftConstraint, rightConstraint, topConstraint, heightConstraint]];
    // iOS 8.0以后设置active属性值
//    leftConstraint.active = YES;
//    rightConstraint.active = YES;
//    topConstraint.active = YES;
//    heightConstraint.active = YES;

    _webView.delegate = self;
    _webView.scalesPageToFit = YES;

    NSString *indexUrl = INDEX_URL;
    NSLog(@"indexUrl---%@",indexUrl);
    [self loadWebPageWithString:indexUrl];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadWebPageWithString:(NSString*)urlString
{
    NSURL *url =[NSURL URLWithString:urlString];
    NSLog(@"urlString---%@",urlString);
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

/**
 * 获取项目名和版本号
 */
- (void)getProjectNameAndVersion{
    // 获取项目名称
    NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleExecutableKey];
    // 获取项目版本号
    NSString * appVersion = [[[NSBundle mainBundle] infoDictionary]
                  objectForKey:(NSString *)kCFBundleVersionKey];
    appVersion = [@"iOS-" stringByAppendingString:appVersion];
    
    NSLog(@"-->%@", appName);    // PMPLife
    NSLog(@"-->%@", appVersion); // iOS-1

}

/**
 * 判断苹果的设备是iPhone还是iPad等其他设备
 */
- (void)getUserInterfaceIdiom{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSLog(@"This is an iPad device");    // iPad 设备
    } else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        NSLog(@"This is an iPhone device");  // iPhone 设备
    }
}


@end
