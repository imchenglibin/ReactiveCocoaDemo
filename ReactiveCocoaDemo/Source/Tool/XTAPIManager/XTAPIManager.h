//
//  XTAPIManager.h
//  ReactiveCocoaDemo
//
//  Created by admin on 16/3/6.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@interface XTAPIManager : NSObject

+ (RACSignal*)logIn:(NSString*)username password:(NSString*)password;

@end
