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

@property (nonatomic, assign, readonly) PQResponseStatus status;
@property (nonatomic, copy, readonly) NSString *contentString;
@property (nonatomic, copy, readonly) id content;
@property (nonatomic, copy, readonly) NSURLRequest *request;
@property (nonatomic, copy, readonly) NSData *responseData;
@property (nonatomic, assign, readonly) BOOL isCache;
@property (nonatomic, strong, readonly) NSString *errorMessage;

- (instancetype)initWithResponseObj:(id)responseObj
                           response:(NSURLResponse *)response
                            request:(NSURLRequest *)request
                              error:(NSError *)error;

@end
