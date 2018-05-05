//
//  UIView+Extension.h
//  PMPLife
//
//  Created by ChenQianPing on 16/2/22.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import <UIKit/UIKit.h>
// 添加一个UIView的分类,直接修改UI控件的x值等
@interface UIView (Extension)

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@end
