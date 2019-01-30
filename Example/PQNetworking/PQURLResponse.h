//
//  PQURLResponse.h
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/28.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PQRequestDefine.h"

@interface PQURLResponse : NSObject

@property (nonatomic, assign, readwrite) PQResponseStatus status;
@property (nonatomic, copy, readwrite) NSString *contentString;
@property (nonatomic, copy, readwrite) id content;
@property (nonatomic, copy, readwrite) NSURLRequest *request;
@property (nonatomic, assign, readwrite) NSInteger requestId;
@property (nonatomic, copy, readwrite) NSData *responseData;
@property (nonatomic, assign, readwrite) BOOL isCache;
@property (nonatomic, strong, readwrite) NSString *errorMessage;

- (instancetype)initWithResponseObj:(id)responseObj
                           response:(NSURLResponse *)response
                            request:(NSURLRequest *)request
                              error:(NSError *)error;

@end
