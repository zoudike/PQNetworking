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

/*
 *  该类及其子类是用于存储api请求信息，以及提供api发起入口
 *  请求参数的拼接和数据处理交给serviceIdentifier对应的service，service的生成是通过PQServiceFactory工厂类
 *  
 */
@interface PQApiManager : NSObject

//以下属性在是api请求的参数信息,不同的api可以以子类的形式重写set方法
@property (nonatomic, copy, readonly) NSString *baseService;//服务域名
@property (nonatomic, copy, readonly) NSString *requstUrl;//请求地址
@property (nonatomic, copy, readonly) NSString *serviceIdentifier;//服务接口的唯一标识
@property (nonatomic, copy, readonly) NSDictionary *headerDict;//请求头
@property (nonatomic, copy, readonly) NSDictionary *bodyDict;//请求体
@property (nonatomic, assign, readonly) PQRequstMethod requstMethod;//默认是get方法

- (void)executWithSuccess:(managerDidSuccess)success failure:(managerDidFail)failure;

- (void)executWithParams:(NSDictionary *)params success:(managerDidSuccess)success failure:(managerDidFail)failure;

@end
