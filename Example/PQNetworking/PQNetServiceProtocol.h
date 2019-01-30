//
//  PQNetServiceProtocol.h
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/29.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "PQRequestDefine.h"
#import "PQURLResponse.h"

@protocol PQNetServiceProtocol <NSObject>

- (NSURLRequest *)requestWithBaseUrl:(NSString *)baseUrl
                          requestUrl:(NSString *)requestUrl
                              params:(NSDictionary *)params
                         requestType:(PQRequstMethod)method;

- (PQURLResponse *)resultWithResponseObject:(id)responseObject
                                  response:(NSURLResponse *)response
                                   request:(NSURLRequest *)request
                                     error:(NSError **)error;


@optional

- (AFHTTPSessionManager *)sessionManager;

@end
