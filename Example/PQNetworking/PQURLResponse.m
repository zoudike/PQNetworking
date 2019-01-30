//
//  PQURLResponse.m
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/28.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import "PQURLResponse.h"

@implementation PQURLResponse

- (instancetype)initWithResponseObj:(id)responseObj
                           response:(NSURLResponse *)response
                            request:(NSURLRequest *)request
                              error:(NSError *)error {
    if (self = [super init]) {
        if ([responseObj isKindOfClass:[NSData class]]) {
            
            result[kCTApiProxyValidateResultKeyResponseString] = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            result[kCTApiProxyValidateResultKeyResponseObject] = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:NULL];
        } else {
            //这里的kCTApiProxyValidateResultKeyResponseString是用作打印日志用的，实际使用时可以把实际类型的对象转换成string用于日志打印
            //        result[kCTApiProxyValidateResultKeyResponseString] = responseObject;
            result[kCTApiProxyValidateResultKeyResponseObject] = responseObject;
        }
    }
    return self;
}

@end
