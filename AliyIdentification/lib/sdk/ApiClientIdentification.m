//
//  ApiClientIdentification.m
//  AliyIdentification
//
//  Created by apple on 2017/3/23.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ApiClientIdentification.h"
#import <CloudApiSdk/HttpConstant.h>
@implementation ApiClientIdentification
static NSString* HOST = @"dm-51.data.aliyun.com";

+ (instancetype)instance {
    static dispatch_once_t onceToken;
    static ApiClientIdentification *api = nil;
    dispatch_once(&onceToken, ^{
        api = [ApiClientIdentification new];
    });
    return api;
}

- (instancetype)init {
    self = [super init];
    return self;
}


- (void) Identificationwithbasestr:(NSString *)basestring andblock:(void (^)(NSData * , NSURLResponse * , NSError *))completionBlock
{
    
    //定义Path
    ///rest/160601/ocr/ocr_driver_license.json
    NSString * path = @"/rest/160601/ocr/ocr_idcard.json";
    NSMutableDictionary *postQueryParams = [[NSMutableDictionary alloc] init];
    [postQueryParams setValue:@"TestQueryNameVlaue" forKey:@"TestQueryName"];
    
    NSMutableDictionary *postHeaderParams = [[NSMutableDictionary alloc] init];
    [postHeaderParams setValue:@"TestPostHeaderValue" forKey:@"TestPostHeader"];
    NSDictionary *bodyDic = @{@"inputs" : @[@{
                                                @"image" : @{@"dataType" : @50,
                                                             @"dataValue" : basestring},@"configure" : @{@"dataType" : @50,@"dataValue" : @"{\"side\":\"face\"}"}}]};
    
    NSData *body = [NSJSONSerialization dataWithJSONObject:bodyDic options:NSJSONWritingPrettyPrinted error:nil];
    
    [[CloudApiSdk instance] httpPost: CLOUDAPI_HTTPS
                                host: HOST
                                path: path
                          pathParams: nil
                         queryParams: postQueryParams
                                body: body
                        headerParams: postHeaderParams
                     completionBlock: completionBlock];
    
}

@end
