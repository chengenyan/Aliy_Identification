//
//  AppConfigurationInitializer.m
//  onlinetemptest
//
//  Created by  fred on 2017/2/21.
//  Copyright © 2017年 Alibaba. All rights reserved.
//

#import "AppConfigurationInitializer.h"

@implementation AppConfigurationInitializer

+ (void) init{
    #warning 将获取到的app_key填入这里
    #warning 将获取到的app_sectet填入
    [[AppConfiguration instance] setAPP_KEY:@""];
    [[AppConfiguration instance] setAPP_SECRET:@""];

}

@end
