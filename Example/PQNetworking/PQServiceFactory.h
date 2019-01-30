//
//  PQServiceFactory.h
//  PQNetworking_Example
//
//  Created by wenpq on 2019/1/29.
//  Copyright © 2019年 zoudike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PQNetServiceProtocol.h"
#import "PQServiceName.h"

// 该工厂类也可以采用抽象工厂类的形式，避免之后新增类别要修改改工厂类源码
// 这里采用反射的机制来达到“开闭原则”，而没有使用抽象工厂类形式
@interface PQServiceFactory : NSObject

+ (instancetype)sharedInstance;

- (id<PQNetServiceProtocol>)createServiceWithInderfiler:(NSString *)inderfiler;

@end
