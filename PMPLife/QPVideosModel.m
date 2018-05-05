//
//  QPVideosModel.m
//  PMPLife
//
//  Created by ChenQianPing on 16/2/21.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import "QPVideosModel.h"

@implementation QPVideosModel

+(instancetype)videosModelWithDict:(NSDictionary *)dict
{
    QPVideosModel *model = [[QPVideosModel alloc] init];
    model.videoId = [dict[@"videoId"] intValue]; // 对象转换为int类型的
    model.videoURL = dict[@"videoURL"];
    model.name = dict[@"name"];
    model.length = dict[@"length"];
    model.imageURL = dict[@"imageURL"];
    model.teacher = dict[@"teacher"];
    model.desc = dict[@"desc"];
    
    // 不能使用KVC,KVC方法使用前提: 字典中的所有key都能在模型属性中找到
//    [model setValuesForKeysWithDictionary:dict];
    
    return model;
    
}

@end
