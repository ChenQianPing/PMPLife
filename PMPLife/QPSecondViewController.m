//
//  QPSecondViewController.m
//  PMPLife
//
//  Created by ChenQianPing on 16/2/21.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import "QPSecondViewController.h"
#import "UIImageView+WebCache.h"
#import "SVProgressHUD.h"
#import "QPVideosModel.h"
#import "QPCell.h"
#import <MediaPlayer/MediaPlayer.h>
#import "QPMoviePlayerViewController.h"
#import "UrlDefine.h"

@interface QPSecondViewController ()
// 所有视频的集合
@property (nonatomic,strong) NSArray *videos;

@end

@implementation QPSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"敏捷项目管理框架培训";
    
    // 去掉下划线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 正在努力加载中
    [SVProgressHUD showWithStatus:@"正在加载视频信息..."];
    
    // 创建路径
    NSString  *urlStr = JSON_URL;
    NSURL *url = [NSURL URLWithString:urlStr];
    // 创建请求
    NSMutableURLRequest  *request = [NSMutableURLRequest requestWithURL:url]; // 默认为get请求
    // 设置最大的网络等待时间
    request.timeoutInterval = 5.0;
    // 获取主队列
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    // 发起请求
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // 隐藏HUD

        if (data) { // 如果请求成功,拿到服务器返回的数据
            [SVProgressHUD dismiss];
            // 解析拿到的数据(JSON方式)
//            NSLog(@"解析拿到的数据(JSON方式");
//            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            
            NSArray *array =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            
//            NSLog(@"dict  %@",dict);
//            NSArray *array = dict[@"videos"];

            NSLog(@"array  %@",array);

            NSMutableArray *videos = [NSMutableArray array];
            for (NSDictionary *dict in array) {
                QPVideosModel *model = [QPVideosModel videosModelWithDict:dict];
                [videos addObject:model];
            }

            self.videos = videos;
            // 刷新表格
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });

        }else // 如果请求失败，没有拿到数据
        {
            [SVProgressHUD showErrorWithStatus:@"网络繁忙"];
        }
    }];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QPCell *cell = [QPCell cellWithTableView:tableView];
    // 获取数据模型
    cell.model = self.videos[indexPath.row];
    return cell;
}

// 设置cell的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出数据模型
    QPVideosModel *model=self.videos[indexPath.row];
    // 创建视屏播放器
    // MPMoviePlayerController 可以随意控制播放器的尺寸
    // MPMoviePlayerViewController只能全屏播放
    NSString *url = [NSString stringWithFormat:BASE_URL_SCRUM_MP4@"%@", model.videoURL];
    NSURL *videoUrl = [NSURL URLWithString:url];
    NSLog(@"%@",videoUrl);
    MPMoviePlayerViewController *movieVc = [[MPMoviePlayerViewController alloc]initWithContentURL:videoUrl];
    
    
    [movieVc.moviePlayer prepareToPlay];
    movieVc.moviePlayer.shouldAutoplay = YES;
    
    // 弹出播放器
    [self presentMoviePlayerViewControllerAnimated:movieVc];
}



@end
