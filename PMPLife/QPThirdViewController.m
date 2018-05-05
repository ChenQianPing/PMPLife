//
//  QPThirdViewController.m
//  PMPLife
//
//  Created by ChenQianPing on 16/3/25.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import "QPThirdViewController.h"
#import "QPPdfOneViewController.h"
#import "ZPDFReaderController.h"
#import "QPPdfOneViewController.h"

@interface QPThirdViewController ()
- (IBAction)btnPdfOne:(id)sender;
- (IBAction)btnPdfTwo:(id)sender;

@end

@implementation QPThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"书籍";
    
    UIImage * backgroundImage = [UIImage imageNamed:@"BookShelfCell@2x.png"];
    UIColor * backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    self.view.backgroundColor = backgroundColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnPdfOne:(id)sender {
    ZPDFReaderController *targetViewCtrl = [[ZPDFReaderController alloc] init];
    // 从第一个页面跳到第二个页面时隐藏tabBar的设置方法
    targetViewCtrl.hidesBottomBarWhenPushed = YES;
    targetViewCtrl.titleText = @"OOAD与UML那点儿事";
    targetViewCtrl.fileName =  @"OOAD与UML那点儿事v20160404.pdf";
    [self.navigationController pushViewController:targetViewCtrl animated:YES];
    

}

- (IBAction)btnPdfTwo:(id)sender {
//    UIViewController *viewController;
//    viewController = [[QPPdfOneViewController alloc] init];
//    if (viewController)
//        viewController.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:viewController animated:YES];
    
    ZPDFReaderController *targetViewCtrl = [[ZPDFReaderController alloc] init];
    // 从第一个页面跳到第二个页面时隐藏tabBar的设置方法
    targetViewCtrl.hidesBottomBarWhenPushed = YES;
    targetViewCtrl.titleText = @"BI那点儿事—数据的艺术";
    targetViewCtrl.fileName =  @"【原创·教程】《BI那点儿事—数据的艺术》.pdf";
    [self.navigationController pushViewController:targetViewCtrl animated:YES];
}
@end
