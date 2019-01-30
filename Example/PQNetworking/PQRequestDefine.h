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
    PQResponseStatusSuccess,
    PQResponseStatusTimeout,
    PQResponseStatusCancel,
    PQResponseStatusNotNet,
};

#endif /* PQRequestDefine_h */
