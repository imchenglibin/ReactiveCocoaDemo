//
//  XTValidation.m
//  ReactiveCocoaDemo
//
//  Created by admin on 16/3/6.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import "XTValidation.h"

@implementation XTValidation

+ (BOOL)isValidUsername:(NSString*)username {
    return username.length > 0;
}

+ (BOOL)isValidPassword:(NSString*)password {
    return password.length > 0;
}

@end
