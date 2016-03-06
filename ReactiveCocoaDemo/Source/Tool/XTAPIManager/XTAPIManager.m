//
//  XTAPIManager.m
//  ReactiveCocoaDemo
//
//  Created by admin on 16/3/6.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import "XTAPIManager.h"
#import <ReactiveCocoa.h>

@implementation XTAPIManager

static NSString *kXTAPIManagerErrorDomain = @"XTAPIManagerDomain";

+ (RACSignal*)logIn:(NSString*)username password:(NSString*)password {
    
    NSString *usernameCopy = [username copy];
    NSString *passwordCopy = [password copy];
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //mock login logic
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([usernameCopy isEqualToString:@"imchenglibin"]
                && [passwordCopy isEqualToString:@"123456"]) {
                [subscriber sendNext:@(YES)];
                [subscriber sendCompleted];
            } else {
                [subscriber sendError:[NSError errorWithDomain:kXTAPIManagerErrorDomain code:0 userInfo:nil]];
            }
        });
        return nil;
    }];
}

@end
