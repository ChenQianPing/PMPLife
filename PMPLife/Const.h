//
//  Const.h
//  PMPLife
//
//  Created by ChenQianPing on 16/2/21.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//  Const.h文件,用于保存一些常用的宏命令

#define CURRENT_APPID @""
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define IS_IOS8_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

// View 坐标(x,y)和宽高(width,height)
#define X(v)                    (v).frame.origin.x
#define Y(v)                    (v).frame.origin.y
#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

//定义部分常用颜色
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//默认的文字大小
#define BASE_FONT_SIZE 15
#define BASE_TABLEVIEWCELL_HEIGHT 46
//#define BASE_COLOR_MAIN COLOR(105,175,0,1)
#define BASE_COLOR_MAIN COLOR(1,86,95,1)
#define BASE_COLOR_TOPBAR COLOR(57,172,105,1)

#define BASE_STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height