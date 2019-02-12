//
//  PQApiManager.m
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/28.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import "PQApiManager.h"
#import <AFNetworking/AFNetworking.h>

@interface PQApiManager()

@property (nonatomic, strong) AFHTTPRequestSerializer * requestSerializer;

@end

@implementation PQApiManager

#pragma mark -- 用于子类重写的set方法，根据不同的请求重写各个属性
- (NSString *)baseService {
    return nil;
}

- (NSString *)requstUrl {
    return nil;
}

- (NSDictionary *)headerDict {
    return nil;
}

- (NSDictionary *)bodyDict {
    return nil;
}

- (PQRequstMethod)requstMethod {
    return PQRequstMethodGET;
}

- (NSTimeInterval)requestTimeoutInterval {
    return 30;
}

- (BOOL)allowsCellularAccess {
    return YES;
}

- (AFHTTPRequestSerializer *)requestSerializer {
    if (!_requestSerializer) {
        _requestSerializer = [[AFHTTPRequestSerializer alloc] init];
        _requestSerializer.timeoutInterval = self.requestTimeoutInterval;
        _requestSerializer.allowsCellularAccess = self.allowsCellularAccess;
        [_requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];//默认请求类型
        if (self.headerDict) {
            for (NSString *headerKey in self.headerDict.allKeys) {
                [_requestSerializer setValue:self.headerDict[headerKey] forHTTPHeaderField:headerKey];
            }
        }
    }
    return _requestSerializer;
}

#pragma mark -- execut执行方法

- (void)executWithSuccess:(managerDidSuccess)success failure:(managerDidFail)failure {
    [self executWithExtendBody:nil extendHeader:nil success:success failure:failure];
}

- (void)executWithExtendBody:(NSDictionary *)body extendHeader:(NSDictionary *)header success:(managerDidSuccess)success failure:(managerDidFail)failure {
    NSURLRequest *request = [self createRequestWithExtendBody:body extendHeader:header];
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:nil];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSURLSessionDataTask *task =
    [sessionManager dataTaskWithRequest:request
                         uploadProgress:nil
                       downloadProgress:nil
                      completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)
     {
         PQURLResponse *pq_response = [[PQURLResponse alloc] initWithResponseObj:responseObject
                                                                        response:response
                                                                         request:request
                                                                           error:error];
         if (error) {
             failure ? failure(pq_response) : nil;
         } else {
             success ? success(pq_response) : nil;
         }
     }];
    [task resume];
    
}

#pragma mark -- private functions

- (NSURLRequest *)createRequestWithExtendBody:(NSDictionary *)extendBody extendHeader:(NSDictionary *)extendHeader {
    NSString *methodStr = @"GET";
    switch (self.requstMethod) {
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
    NSMutableDictionary *bodyDict = [[NSMutableDictionary alloc] initWithDictionary:extendBody];
    [bodyDict addEntriesFromDictionary:self.bodyDict];
    for (NSString *headerKey in extendHeader.allKeys) {
        [self.requestSerializer setValue:extendHeader[headerKey] forHTTPHeaderField:headerKey];
    }
    NSMutableURLRequest *request =
    [self.requestSerializer requestWithMethod:methodStr
                                    URLString:[NSString stringWithFormat:@"%@%@",self.baseService,self.requstUrl]
                                   parameters:bodyDict
                                        error:nil];
    return request;
}

@end
