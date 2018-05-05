//
//  QPCell.h
//  PMPLife
//
//  Created by ChenQianPing on 16/2/22.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QPVideosModel;
@interface QPCell : UITableViewCell
@property(nonatomic,strong)QPVideosModel  *model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
