//
//  PQApiManager.m
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/28.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import "PQApiManager.h"
#import <AFNetworking/AFNetworking.h>
#import "PQServiceFactory.h"

@implementation PQApiManager

#pragma mark -- set
- (NSString *)baseService {
    return nil;
}

- (NSString *)requstUrl {
    return nil;
}

- (NSString *)serviceIdentifier {
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

- (AFHTTPSessionManager *)seesionManagerWithService:(id<PQNetServiceProtocol>)service  {
    if (service && [service respondsToSelector:@selector(sessionManager)]) {
        return [service sessionManager];
    }
    return [AFHTTPSessionManager manager];
}

#pragma mark -- execut执行方法

- (void)executWithSuccess:(managerDidSuccess)success failure:(managerDidFail)failure {
    [self executWithParams:self.bodyDict success:success failure:failure];
}

- (void)executWithParams:(NSDictionary *)params success:(managerDidSuccess)success failure:(managerDidFail)failure {
    id<PQNetServiceProtocol> service = [[PQServiceFactory sharedInstance] createServiceWithInderfiler:self.serviceIdentifier];
    NSURLRequest *request = [service requestWithBaseUrl:self.baseService requestUrl:self.requstUrl params:params requestType:self.requstMethod];
    AFHTTPSessionManager *sessionManager = [self seesionManagerWithService:service];
    NSURLSessionDataTask *task =
    [sessionManager dataTaskWithRequest:request
                         uploadProgress:nil
                       downloadProgress:nil
                      completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)
     {
        //数据处理，交给实现service接口的实例
         PQURLResponse *pq_response = [service resultWithResponseObject:responseObject response:response request:request error:&error];
         if (error) {
             failure ? failure(pq_response) : nil;
         } else {
             success ? success(pq_response) : nil;
         }
     }];
    [task resume];
    
}

@end
