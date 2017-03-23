//
//  ApiClientDriverLicence.m
//  AliyIdentification
//
//  Created by apple on 2017/3/23.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ApiClientDriverLicence.h"
#import <CloudApiSdk/HttpConstant.h>
@implementation ApiClientDriverLicence
static NSString* HOST = @"dm-52.data.aliyun.com";

+ (instancetype)instance {
    static dispatch_once_t onceToken;
    static ApiClientDriverLicence *api = nil;
    dispatch_once(&onceToken, ^{
        api = [ApiClientDriverLicence new];
    });
    return api;
}

- (instancetype)init {
    self = [super init];
    return self;
}


- (void) DriverIdentificationwithbasestr:(NSString *)basestring andblock:(void (^)(NSData * , NSURLResponse * , NSError *))completionBlock
{
    
    //定义Path
    ///rest/160601/ocr/ocr_driver_license.json
    NSString * path = @"/rest/160601/ocr/ocr_driver_license.json";
   // NSMutableDictionary *postQueryParams = [[NSMutableDictionary alloc] init];
   // [postQueryParams setValue:@"TestQueryNameVlaue" forKey:@"TestQueryName"];
    
    //NSMutableDictionary *postHeaderParams = [[NSMutableDictionary alloc] init];
   // [postHeaderParams setValue:@"TestPostHeaderValue" forKey:@"TestPostHeader"];
    NSDictionary *bodyDic = @{@"inputs" : @[@{
                                                @"image" : @{@"dataType" : @50,
                                                             @"dataValue" : basestring}}]};
    
    NSData *body = [NSJSONSerialization dataWithJSONObject:bodyDic options:NSJSONWritingPrettyPrinted error:nil];
    
    [[CloudApiSdk instance] httpPost: CLOUDAPI_HTTPS
                                host: HOST
                                path: path
                          pathParams: nil
                         queryParams: nil
                                body: body
                        headerParams: nil
                     completionBlock: completionBlock];
    
}

@end
