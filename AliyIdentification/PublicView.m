//
//  PublicView.m
//  车纷享
//
//  Created by apple on 15/11/13.
//  Copyright © 2015年 sunya. All rights reserved.
//

#import "PublicView.h"
#define PI 3.1415926
@implementation PublicView
+(UIButton *)buttonWithTitle:(NSString *)title  andtitlecolor:(UIColor *)titlecolor andframe:(CGRect)frame andImage:(NSString *)image andColor:(UIColor *)color
{
    UIButton *btn=[[UIButton alloc]initWithFrame:frame];
    btn.backgroundColor=color;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titlecolor forState:UIControlStateNormal];
    return btn;
    
}

+(UIImageView *)imageViewWithimage:(NSString *)image andFrame:(CGRect)frame
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.image=[UIImage imageNamed:image];
    return imageView;
}
+(UIImageView *)imageViewWithurlimage:(NSString *)image andFrame:(CGRect)frame
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
    if ([image hasPrefix:@"focus"]) {
        imageView.image=[UIImage imageNamed:image];
    }else
    {
      
    }
    
    return imageView;
}
+(UILabel *)labelWithText:(NSString *)text andFrame:(CGRect)frame andTextColor:(UIColor *)textColor andFont:(UIFont *)font andduiqi:(int)duiqi
{
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.text=text;
    label.textColor=textColor;
    label.textAlignment=duiqi;
    label.adjustsFontSizeToFitWidth=YES;
    label.font=font;
    return label;
}
+(UITextField *)textFild:(NSString *)text andplacehold:(NSString *)hold andtextcolor:(UIColor *)color andfont:(UIFont *)font andframe:(CGRect)frame
{
    UITextField *textfild=[[UITextField alloc]initWithFrame:frame];
    if (text!=nil) {
        textfild.text=text;
    }
    textfild.font=font;
    textfild.textColor=color;
    textfild.placeholder=hold;
   
    return textfild;
}
+(void)alertyWithtitle:(NSString *)title andmessage:(NSString *)message
{
     [[[UIAlertView alloc]initWithTitle:title message:message  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
}
+(UIView *)viewWithframe:(CGRect)frame andbackColor:(UIColor *)color andlinefloat:(float)width andlineColor:(UIColor *)lineColor
{
    UIView *view=[[UIView alloc]initWithFrame:frame];
    view.backgroundColor=color;
    view.layer.borderWidth=width;
    view.layer.borderColor=lineColor.CGColor;
    return view;
}
#pragma mark - calculate distance  根据2个经纬度计算距离


+(double)LantitudeLongitudeDist:(double)lon1 other_Lat:(double)lat1 self_Lon:(double)lon2 self_Lat:(double)lat2{
    double er = 6378137; // 6378700.0f;
    //ave. radius = 6371.315 (someone said more accurate is 6366.707)
    //equatorial radius = 6378.388
    //nautical mile = 1.15078
    double radlat1 = PI*lat1/180.0f;
    double radlat2 = PI*lat2/180.0f;
    //now long.
    double radlong1 = PI*lon1/180.0f;
    double radlong2 = PI*lon2/180.0f;
    if( radlat1 < 0 ) radlat1 = PI/2 + fabs(radlat1);// south
    if( radlat1 > 0 ) radlat1 = PI/2 - fabs(radlat1);// north
    if( radlong1 < 0 ) radlong1 = PI*2 - fabs(radlong1);//west
    if( radlat2 < 0 ) radlat2 = PI/2 + fabs(radlat2);// south
    if( radlat2 > 0 ) radlat2 = PI/2 - fabs(radlat2);// north
    if( radlong2 < 0 ) radlong2 = PI*2 - fabs(radlong2);// west
    //spherical coordinates x=r*cos(ag)sin(at), y=r*sin(ag)*sin(at), z=r*cos(at)
    //zero ag is up so reverse lat
    double x1 = er * cos(radlong1) * sin(radlat1);
    double y1 = er * sin(radlong1) * sin(radlat1);
    double z1 = er * cos(radlat1);
    double x2 = er * cos(radlong2) * sin(radlat2);
    double y2 = er * sin(radlong2) * sin(radlat2);
    double z2 = er * cos(radlat2);
    double d = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)+(z1-z2)*(z1-z2));
    //side, side, side, law of cosines and arccos
    double theta = acos((er*er+er*er-d*d)/(2*er*er));
    double dist  = theta*er;
    return dist;
}
+(UIView *)lineViewwithframe:(CGRect)frame
{
    UIView *lineview=[[UIView alloc]initWithFrame:frame];
    lineview.backgroundColor=[UIColor colorWithWhite:0.902 alpha:1.000];
    return lineview;
}
+(UIView *)xuanzheviewwithimage:(NSString *)image andtitle:(NSString *)title andframe:(CGRect)frame andfont:(float)font andtextcolor:(UIColor*)color
{
    UIView *bgView=[[UIView alloc]initWithFrame:frame];
    UIImageView *imageview=[PublicView imageViewWithimage:image andFrame:CGRectMake(0, 3, CGRectGetHeight(frame)-6, CGRectGetHeight(frame)-6)];
    [bgView addSubview:imageview];
    UILabel *label=[PublicView labelWithText:title andFrame:CGRectMake(CGRectGetMaxX(imageview.frame)+5, 0, CGRectGetWidth(frame)-CGRectGetMaxX(imageview.frame)-10, CGRectGetHeight(frame)) andTextColor:color andFont:[UIFont systemFontOfSize:font-2] andduiqi:0];
    label.adjustsFontSizeToFitWidth=YES;
    [bgView addSubview:label];
    return bgView;
}
+(BOOL)stringWithnull:(NSString *)string
{
    if ([string isEqualToString:@""]||[string isEqualToString:@"null"]||string==nil||[string isEqualToString:@"<null>"]||[string isEqualToString:@"(null)"]) {
        return NO;
    }
    return YES;
}
//画虚线
+(UIView *)linViewwithframe:(CGRect )frame
{
    UIView *lineView=[[UIView alloc]initWithFrame:frame];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:[UIColor lightGrayColor].CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:3], [NSNumber numberWithInt:1], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
    return lineView;
}
+(NSDate *)timewithdate:(NSDate *)nowdate
{
    //获取初始化的时间
//    NSDate * nowdate = [NSDate new];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|(NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute| NSCalendarUnitSecond) fromDate:nowdate];
    NSLog(@"%@",nowdate);
    int year=(int)[components year];
    int month = (int)[components month];
    int day = (int)[components day];
    int hour = (int)[components hour];
    int min = (int)[components minute];
    int miao=(int)[components second];
    NSLog(@"%d",min);//当分钟不满20分段时将赋值20
    if(min<=20 && min>0)
    {
        min=20;
    }else if (min<=40&&min>20)
    {
        min=40;
    }else if(min<60&&min>40)
    {
        min=0;
        if(hour<23)
        {
            hour++;
        }else
        {
            hour=0;
            day++;
            
        }
    }
    miao=0;
    NSDateFormatter*df = [[NSDateFormatter alloc]init];//格式化
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [df setLocale:[NSLocale currentLocale]];
//    NSString *dateTime = [NSString stringWithFormat:@"%d月%d日 %02d:%02d", month, day, hour, min];
    NSString *s1=[NSString stringWithFormat:@"%d-%d-%d %02d:%02d:%02d",year,month, day, hour, min,miao];
    NSLog(@"%@",s1);
//    _startdate=[df dateFromString:s1];
//    _firstdate=_startdate;
    return [df dateFromString:s1];
}
+(NSString *)timewithcha:(NSString *)time andleixing:(NSString *)str
{
    NSDateFormatter *dateform=[[NSDateFormatter alloc] init];
    if ([str isEqualToString:@""]) {
        str=@"yyyy-MM-dd HH:mm:ss";
    }
    [dateform setDateFormat:str];
    NSString *string11=[NSString stringWithFormat:@"%@",time];
    
    NSTimeInterval cha=[string11 doubleValue];
    NSDate * date1 = [NSDate dateWithTimeIntervalSince1970:cha/1000];//
    
    //将指定时间转换为时间戳
    //NSTimeInterval cha3=date1.timeIntervalSince1970;
    return [dateform stringFromDate:date1];
}
+(UIButton *)buttonlineWithTitle:(NSString *)title  andtitlecolor:(UIColor *)titlecolor andframe:(CGRect)frame andImage:(NSString *)image andColor:(UIColor *)color
{
    UIButton *btn=[[UIButton alloc]initWithFrame:frame];
    btn.backgroundColor=color;
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange strRange = {0,[str length]};
    // [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    NSDictionary *dict=@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    [str addAttributes:dict range:strRange];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setAttributedTitle:str forState:UIControlStateNormal];
    [btn setTitleColor:titlecolor forState:UIControlStateNormal];
    return btn;
    
}
+(NSDate *)datewithcha:(NSString *)time
{
    NSString *string11=[NSString stringWithFormat:@"%@",time];
    NSTimeInterval cha=[string11 doubleValue];
    NSDate * date1 = [NSDate dateWithTimeIntervalSince1970:cha/1000];//
    
    //将指定时间转换为时间戳
    //NSTimeInterval cha3=date1.timeIntervalSince1970;
    return date1;
}
+(NSString *)timewithdate:(NSDate *)time andleixing:(NSString *)str
{
    NSDateFormatter*df = [[NSDateFormatter alloc]init];//格式化
   //@"yyyy-MM-dd HH:mm:ss"
    if ([str isEqualToString:@""]) {
        str=@"yyyy-MM-dd HH:mm:ss";
    }
    [df setDateFormat:str];
    [df setLocale:[NSLocale currentLocale]];
    //    NSString *dateTime = [NSString stringWithFormat:@"%d月%d日 %02d:%02d", month, day, hour, min];
    NSString *s1=[df stringFromDate:time];
    NSLog(@"%@",s1);
    return s1;
}
+ (NSDate *)getMinimuDateWithDate:(NSDate *)date andjiange:(double)jiange{
    
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitMinute|NSSecondCalendarUnit fromDate:date];
    NSInteger minutes = [dateComponents minute];
    NSInteger miao = [dateComponents second];
    NSInteger shijiianjiange = jiange;
    NSInteger minutesRounded = ( (NSInteger)(minutes / shijiianjiange) ) * shijiianjiange;
    NSDate *roundedDate = [[NSDate alloc] initWithTimeInterval:60.0 * (minutesRounded - minutes) sinceDate:date];
    if ([roundedDate timeIntervalSince1970] < [date timeIntervalSince1970]){
        roundedDate = [[NSDate alloc] initWithTimeInterval:(60 * shijiianjiange - miao) sinceDate:roundedDate];
    }
    return roundedDate;
}
+(NSString *)userCarWeekday:(NSDate *)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitWeekday) fromDate:date];
    int weekday = (int)[components weekday];//a就是星期几，1代表星期日，2代表星期一，后面依次
    NSString *dayOfWeek = dayOfWeek = [PublicView converChinseWeekDay: weekday];
    return dayOfWeek;
}
+ (NSString *)converChinseWeekDay:(NSInteger)weekDay{
    
    // NSLog(@"%@===%@",_startTime,_finishTime);
    
    NSArray *chinseWeekDays = [NSArray arrayWithObjects:@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六",@"周日", nil];
    
    return [chinseWeekDays objectAtIndex:(weekDay -1)];
}
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(NSString *)replaceOccurrencesOfStringWithString:(NSString *)string{
    NSMutableString *mutabStr = [NSMutableString stringWithString:string];
    [mutabStr replaceOccurrencesOfString:@"\t" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutabStr length])];
        [mutabStr replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutabStr length])];
        [mutabStr replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutabStr length])];
        [mutabStr replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutabStr length])];
        [mutabStr replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutabStr length])];
        [mutabStr replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutabStr length])];
        [mutabStr replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutabStr length])];
    
    return mutabStr;
}

/**
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
+ (NSAttributedString *)stringWithtitle:(NSString *) contentStr andimagestr:(NSString *) imagestr andframe:(CGRect )myiconframe{
    // 创建一个富文本
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:contentStr];
    // 修改富文本中的不同文字的样式
    
    
    /**
     添加图片到指定的位置
     */
//    NSTextAttachment *attchImage = [[NSTextAttachment alloc] init];
//    // 表情图片
//    attchImage.image = [UIImage imageNamed:@"jiedu"];
//    // 设置图片大小
//    attchImage.bounds = CGRectMake(0, 0, 40, 15);
//    NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attchImage];
//    [attriStr insertAttributedString:stringImage atIndex:2];
    
    
//    NSDictionary * attriBute = @{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:30]};
//    [attriStr addAttributes:attriBute range:NSMakeRange(5, 9)];
//    
    // 添加表情到最后一位
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:imagestr];
    // 设置图片大小
    attch.bounds = myiconframe;
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    [attriStr appendAttributedString:string];
    
    return attriStr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
