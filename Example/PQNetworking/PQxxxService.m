//
//  PQxxxService.m
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/29.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import "PQxxxService.h"
#import <AFNetworking/AFNetworking.h>

@interface PQxxxService ()

//在此处添加私有属性

@property (nonatomic, strong) AFHTTPRequestSerializer * requestSerializer;

@end

@implementation PQxxxService

#pragma mark -- imp protocol

- (NSURLRequest *)requestWithParams:(NSDictionary *)params requestType:(PQURLRequestMethod)method {
    NSString *methodStr = @"GET";
    switch (method) {
        case PQURLRequestMethodGet:
            methodStr = @"GET";
            break;
        case PQURLRequestMethodPost:
            methodStr = @"POST";
            break;
        case PQURLRequestMethodPut:
            methodStr = @"PUT";
            break;
        case PQURLRequestMethodDelete:
            methodStr = @"DELETE";
            break;
        default:
            break;
    }
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:methodStr URLString:[NSString stringWithFormat:@"%@%@",self.] parameters:<#(nullable id)#> error:<#(NSError *__autoreleasing  _Nullable * _Nullable)#>];
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:methodStr URLString:[NSString stringWithFormat:@"%@%@",baseUrl,requestUrl] parameters:params error:nil];
    return request;
}

- (AFHTTPRequestSerializer *)requestSerializer {
    if (!_requestSerializer) {
        _requestSerializer = [[AFHTTPRequestSerializer alloc] init];
        [_requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    return _requestSerializer;
}

@end
