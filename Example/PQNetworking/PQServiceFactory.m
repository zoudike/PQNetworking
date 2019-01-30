//
//  PQServiceFactory.m
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/29.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import "PQServiceFactory.h"
#import "Target_netService.h"

@interface PQServiceFactory ()

@property (nonatomic, strong) NSMutableDictionary *serviceListCache;

@end

@implementation PQServiceFactory

- (NSMutableDictionary *)serviceListCache {
    if (!_serviceListCache) {
        _serviceListCache = [[NSMutableDictionary alloc] init];
    }
    return _serviceListCache;
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static PQServiceFactory *shared = nil;
    dispatch_once(&onceToken, ^{
        shared = [[PQServiceFactory alloc] init];
    });
    return shared;
}

- (id<PQNetServiceProtocol>)createServiceWithInderfiler:(NSString *)inderfiler {
    if (!self.serviceListCache[inderfiler]) {
        id<PQNetServiceProtocol> service = [[CTMediator sharedInstance] performTarget:@"netService" action:inderfiler params:nil shouldCacheTarget:NO];
        if (service) {
            self.serviceListCache[inderfiler] = service;
            return service;
        }
    }
    return self.serviceListCache[inderfiler];
}

@end
