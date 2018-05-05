//
//  QPCell.m
//  PMPLife
//
//  Created by ChenQianPing on 16/2/22.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import "QPCell.h"
#import "QPVideosModel.h"
#import "UIImageView+WebCache.h"
#import "UIView+Extension.h"
#import "UrlDefine.h"
#import "WKWebImage.h"

@interface QPCell()

@property(nonatomic,weak)UIView * divider;

@end

@implementation QPCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"ID";
    QPCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
         cell = [[QPCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setModel:(QPVideosModel *)model
{
     _model = model;
    self.textLabel.text = model.name;
    NSString *length = [NSString stringWithFormat:@"时长:%@",model.length];
    self.detailTextLabel.text=length;
    
//    NSString *imageUrl = [NSString stringWithFormat:BASE_URL_SCRUM_PNG@"%@", model.imageURL];
    NSString *imageUrl = [NSString stringWithFormat:@"%@", model.imageURL];
    NSLog(@"imageUrl---%@",imageUrl);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:imageUrl ofType:nil];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    
    [self.imageView setImage:image];

    // 这里使用了第三方框架
//    [self.imageView  setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    // 给一张默认图片,先使用默认图片,当图片加载完成后再替换
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder"] options:SDWebImageRetryFailed];
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder"] options:SDWebImageLowPriority | SDWebImageRetryFailed];
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    
//    NSLog(@"%@",imageUrl);
//    imageUrl = @"http://va5b5e5f.gotcy1.com/upload/Scrum/ScrumPng/Scrum_01.png";
    
//    // 同步加载
//     [self.imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]]];
    
//    [self.imageView wk_setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    // 异步加载,初始界面不显示图片,上下滑动tableView,图片会显示出来?
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil options:SDWebImageRetryFailed];
    
    // 异步加载图片不显示问题
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil options:SDWebImageLowPriority | SDWebImageRetryFailed];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 加一条线
        UIView *divider = [[UIView alloc]init];
        [divider setBackgroundColor:[UIColor brownColor]];
        divider.alpha = 0.5;
        [self.contentView addSubview:divider];
        self.divider = divider;
    }
    return self;
}

-(void)layoutSubviews
{
    // 注意:一定要先调用父类的layoutSubviews方法
    [super layoutSubviews];
    // 调整frame
    // 图片的frame
    CGFloat imageX = 10;
    CGFloat imageY = 10;
//    CGFloat imageH = self.frame.size.height- 2*imageY;
    CGFloat imageH = self.height- 2*imageY;
    CGFloat imageW = imageH *200/112;
//    NSLog(@"imageH---%f",imageH);
//    NSLog(@"imageW---%f",imageW);
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    // 标题的frame
//    CGRect textF = self.textLabel.frame;
//    textF.origin.x = imageW+2*imageX;
//    self.textLabel.frame = textF;
    
    self.textLabel.x = imageW + 2*imageX;
    
    // 小标题的frame
//    CGRect detailTextF = self.detailTextLabel.frame;
//    detailTextF.origin.x = textF.origin.x;
//    self.detailTextLabel.frame = detailTextF;
    self.detailTextLabel.x = self.textLabel.x;
    
    // 设置下划线的frame
    CGFloat dividerH = 1.0;
    CGFloat dividerW = self.frame.size.width;
    CGFloat dividerY = self.frame.size.height-1;
    self.divider.frame = CGRectMake(0, dividerY, dividerW, dividerH);
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
