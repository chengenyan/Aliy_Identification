//
//  ApiClientIdentification.h
//  AliyIdentification
//
//  Created by apple on 2017/3/23.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CloudApiSdk/CloudApiSdk.h>
@interface ApiClientIdentification : NSObject
+ (instancetype) instance;

- (void) Identificationwithbasestr:(NSString *)basestring andblock:(void (^)(NSData * , NSURLResponse * , NSError *))completionBlock;
@end
