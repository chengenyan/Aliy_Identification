/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#import "AppConfiguration.h"

@implementation AppConfiguration

/**
 *
 *  使用单例模式
 *  保证NSURLSession对象可以复用
 *
 */
+ (instancetype)instance {
    static dispatch_once_t onceToken;
    static AppConfiguration *appConfiguration = nil;
    dispatch_once(&onceToken, ^{
        appConfiguration = [AppConfiguration new];
    });
    return appConfiguration;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        APP_CACHE_POLICY = 1;
        APP_CONNECTION_TIMEOUT = 5;
    }
    return self;
}


@synthesize APP_KEY , APP_SECRET , APP_CACHE_POLICY , APP_CONNECTION_TIMEOUT;

@end
