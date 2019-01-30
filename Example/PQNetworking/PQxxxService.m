//
//  PQxxxService.m
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/29.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import "PQxxxService.h"
#import <AFNetworking/AFNetworking.h>
#import "PQRequestDefine.h"

@interface PQxxxService ()

//在此处添加私有属性

@property (nonatomic, strong) AFHTTPRequestSerializer * requestSerializer;

@end

@implementation PQxxxService

#pragma mark -- imp protocol

- (NSURLRequest *)requestWithBaseUrl:(NSString *)baseUrl requestUrl:(NSString *)requestUrl params:(NSDictionary *)params requestType:(PQRequstMethod)method {
    NSString *methodStr = @"GET";
    switch (method) {
        case PQRequstMethodGET:
            methodStr = @"GET";
            break;
        case PQRequstMethodPOST:
            methodStr = @"POST";
            break;
        case PQRequstMethodPUT:
            methodStr = @"PUT";
            break;
        case PQRequstMethodDELETE:
            methodStr = @"DELETE";
            break;
        default:
            break;
    }
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:methodStr
                                    URLString:[NSString stringWithFormat:@"%@%@",baseUrl,requestUrl]
                                   parameters:params
                                        error:nil];
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
