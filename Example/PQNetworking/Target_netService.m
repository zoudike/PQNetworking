//
//  Target_netService.m
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/29.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import "Target_netService.h"
#import "PQxxxService.h"

NSString *const kNetxxxService = @"netxxxService";

@implementation Target_netService

- (id<PQNetServiceProtocol>)Action_netxxxService {
    return [[PQxxxService alloc] init];
}

@end
