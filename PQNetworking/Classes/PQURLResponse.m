//
//  PQURLResponse.m
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/28.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import "PQURLResponse.h"

@interface PQURLResponse ()

@property (nonatomic, assign, readwrite) PQResponseStatus status;
@property (nonatomic, copy, readwrite) NSString *contentString;
@property (nonatomic, copy, readwrite) id content;
@property (nonatomic, copy, readwrite) NSURLRequest *request;
@property (nonatomic, copy, readwrite) NSData *responseData;
@property (nonatomic, assign, readwrite) BOOL isCache;
@property (nonatomic, strong, readwrite) NSString *errorMessage;

@end

@implementation PQURLResponse

- (instancetype)initWithResponseObj:(id)responseObj
                           response:(NSURLResponse *)response
                            request:(NSURLRequest *)request
                              error:(NSError *)error {
    if (self = [super init]) {
        self.status = [self responseStatusWithError:error];
        if ([responseObj isKindOfClass:[NSData class]]) {
            self.contentString = [[NSString alloc] initWithData:responseObj encoding:NSUTF8StringEncoding];
            NSDictionary *responDict = [NSJSONSerialization JSONObjectWithData:responseObj options:0 error:NULL];
            self.content = responDict ?: @{};
        } else {
            self.contentString = responseObj;
            self.content = responseObj ?: @{};
        }
        self.request = request;
        self.isCache = NO;
        self.errorMessage = [NSString stringWithFormat:@"%@",error];
    }
    return self;
}

#pragma mark - private methods
- (PQResponseStatus)responseStatusWithError:(NSError *)error
{
    if (error) {
        // 除了超时以外，所有错误都当成是无网络
        PQResponseStatus result = PQResponseStatusNotNet;
        if (error.code == NSURLErrorTimedOut) {
            result = PQResponseStatusTimeout;
        }
        if (error.code == NSURLErrorCancelled) {
            result = PQResponseStatusCancel;
        }
        if (error.code == NSURLErrorNotConnectedToInternet) {
            result = PQResponseStatusNotNet;
        }
        return result;
    } else {
        return PQResponseStatusSuccess;
    }
}

@end
