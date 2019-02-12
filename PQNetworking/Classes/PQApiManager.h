//
//  PQApiManager.h
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/28.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PQRequestDefine.h"
#import "PQURLResponse.h"

@class PQApiManager;

typedef void(^managerDidSuccess)(PQURLResponse *response);

typedef void(^managerDidFail)(PQURLResponse *response);

@protocol PQNetResponseFilter <NSObject>

@optional

- (PQURLResponse *)filteWithResponse:(NSURLResponse *)response responseObj:(id)responseObj request:(NSURLRequest *)request error:(NSError *)error;

@end

/*
 *  该类及其子类是用于存储api请求信息，以及提供api发起入口
 *  
 */
@interface PQApiManager : NSObject

@property (nonatomic, weak) id<PQNetResponseFilter> filter;

//以下属性在是api请求的参数信息,不同的api可以以子类的形式重写set方法
@property (nonatomic, copy, readonly) NSString *baseService;//服务域名
@property (nonatomic, copy, readonly) NSString *requstUrl;//请求地址
@property (nonatomic, copy, readonly) NSDictionary *headerDict;//请求头
@property (nonatomic, copy, readonly) NSDictionary *bodyDict;//请求体
@property (nonatomic, assign, readonly) PQRequstMethod requstMethod;//默认是get方法
@property (nonatomic, assign, readonly) NSTimeInterval requestTimeoutInterval;//请求超时时间,默认为30s
@property (nonatomic, assign, readonly) BOOL allowsCellularAccess;//是否允许蜂窝网络,默认为yes


- (void)executWithSuccess:(managerDidSuccess)success failure:(managerDidFail)failure;

- (void)executWithExtendBody:(NSDictionary *)body extendHeader:(NSDictionary *)header success:(managerDidSuccess)success failure:(managerDidFail)failure;

@end
