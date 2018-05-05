//
//  QPVideosModel.h
//  PMPLife
//
//  Created by ChenQianPing on 16/2/21.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QPVideosModel : NSObject

// 视频简介
@property(nonatomic,copy)NSString  *desc;
// 视频缩略图
@property(nonatomic,copy)NSString  *imageURL;
// 视频长度
@property(nonatomic,copy)NSString *length;
// 视频名称
@property(nonatomic,copy)NSString *name;
// 视频作者
@property(nonatomic,copy)NSString *teacher;
// 视频ID
@property(nonatomic,assign)int videoId;
// 视屏路径
@property(nonatomic,copy)NSString *videoURL;

// 提供一个对外的接口
+(instancetype)videosModelWithDict:(NSDictionary *)dict;

@end
