//
//  XTUser.m
//  ReactiveCocoaDemo
//
//  Created by imchenglibin on 16/3/4.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import "XTUser.h"

@implementation XTUser

- (instancetype)initWithUsername:(NSString*)username password:(NSString*)password {
    if (self = [super init]) {
        _username = [username copy];
        _password = [password copy];
    }
    return self;
}

+ (instancetype)userWithUsername:(NSString*)username password:(NSString*)password {
    return [[self alloc] initWithUsername:username password:password];
}

@end
