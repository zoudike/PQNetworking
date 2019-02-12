//
//  PQRequestDefine.h
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/30.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#ifndef PQRequestDefine_h
#define PQRequestDefine_h

typedef NS_ENUM(NSInteger, PQRequstMethod) {
    PQRequstMethodGET,
    PQRequstMethodPOST,
    PQRequstMethodPUT,
    PQRequstMethodDELETE,
};

typedef NS_ENUM(NSInteger, PQResponseStatus) {
    PQResponseStatusSuccess,    //请求成功
    PQResponseStatusTimeout,    //请求超时
    PQResponseStatusCancel,     //请求取消
    PQResponseStatusNotNet,     //无网络
};

#endif /* PQRequestDefine_h */
