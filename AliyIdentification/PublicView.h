//
//  PublicView.h
//  车纷享
//
//  Created by apple on 15/11/13.
//  Copyright © 2015年 sunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height
#define kTimeIntverval 10
@interface PublicView : UIView
//按钮的封装
+(UIButton *)buttonWithTitle:(NSString *)title  andtitlecolor:(UIColor *)titlecolor andframe:(CGRect)frame andImage:(NSString *)image andColor:(UIColor *)color;

+(UIButton *)buttonlineWithTitle:(NSString *)title  andtitlecolor:(UIColor *)titlecolor andframe:(CGRect)frame andImage:(NSString *)image andColor:(UIColor *)color;
//图片的封装
+(UIImageView *)imageViewWithimage:(NSString *)image andFrame:(CGRect)frame;
//标签的封装
+(UILabel *)labelWithText:(NSString *)text andFrame:(CGRect)frame andTextColor:(UIColor *)textColor andFont:(UIFont *)font andduiqi:(int)duiqi;
//输入框的封装
+(UITextField *)textFild:(NSString *)text andplacehold:(NSString *)hold andtextcolor:(UIColor *)color andfont:(UIFont *)font andframe:(CGRect)frame;
//提示框的封装
+(void)alertyWithtitle:(NSString *)title andmessage:(NSString *)message;
//图片的url的封装
+(UIImageView *)imageViewWithurlimage:(NSString *)image andFrame:(CGRect)frame;
//封装bgview的带线条
+(UIView *)viewWithframe:(CGRect)frame andbackColor:(UIColor *)color andlinefloat:(float)width andlineColor:(UIColor *)lineColor;
//获取距离
+(double)LantitudeLongitudeDist:(double)lon1 other_Lat:(double)lat1 self_Lon:(double)lon2 self_Lat:(double)lat2;
//创建线条
+(UIView *)linViewwithframe:(CGRect )frame;
+(UIView *)lineViewwithframe:(CGRect)frame;//线条
//创建虚线

//选择按钮的封装(带>)
+(UIView *)xuanzheviewwithimage:(NSString *)image andtitle:(NSString *)title andframe:(CGRect)frame andfont:(float)font andtextcolor:(UIColor*)color;
//判断是否空
+(BOOL)stringWithnull:(NSString *)string;
+(NSDate *)timewithdate:(NSDate *)nowdate;//20.40.60
+(NSString *)timewithcha:(NSString *)time andleixing:(NSString *)str;//根据时间戳获取日期str显示
+(NSString *)timewithdate:(NSDate *)time andleixing:(NSString *)str;//根据时间获取日期str显示
+ (NSDate *)getMinimuDateWithDate:(NSDate *)date andjiange:(double)jiange;
+(NSString *)userCarWeekday:(NSDate *)date;//获取星期
+(NSDate *)datewithcha:(NSString *)time;//根据时间戳获取时间
+ (UIImage *)imageWithColor:(UIColor *)color;
+(NSString *)replaceOccurrencesOfStringWithString:(NSString *)string;
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
+ (NSAttributedString *)stringWithtitle:(NSString *) contentStr andimagestr:(NSString *) imagestr andframe:(CGRect )myiconframe;
@end
