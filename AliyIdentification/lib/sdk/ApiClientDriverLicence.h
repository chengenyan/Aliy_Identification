//
//  ApiClientDriverLicence.h
//  AliyIdentification
//
//  Created by apple on 2017/3/23.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CloudApiSdk/CloudApiSdk.h>
@interface ApiClientDriverLicence : NSObject
+ (instancetype) instance;

- (void) DriverIdentificationwithbasestr:(NSString *)basestring andblock:(void (^)(NSData * , NSURLResponse * , NSError *))completionBlock;
@end
