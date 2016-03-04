//
//  XTUserViewModel.m
//  ReactiveCocoaDemo
//
//  Created by imchenglibin on 16/3/4.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import "XTUserViewModel.h"
#import "XTUser.h"

@implementation XTUserViewModel

- (instancetype)init {
    if (self = [super init]) {
        _user = [[XTUser alloc] init];
        
        RACSignal *loginEnableSignal = [RACSignal combineLatest:@[RACObserve(_user, username), RACObserve(_user, password)] reduce:^(NSString *username, NSString *password){
            return @(username.length > 0 && password.length > 0);
        }];
        
        @weakify(self)
        _loginCommand = [[RACCommand alloc] initWithEnabled:loginEnableSignal signalBlock:^RACSignal *(id input) {
           return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
               //do login logic
               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   @strongify(self)
                   if ([self.user.username isEqualToString:@"imchenglibin"]
                       && [self.user.password isEqualToString:@"123456"]) {
                       [subscriber sendNext:@(YES)];
                       [subscriber sendCompleted];
                   } else {
                       [subscriber sendError:[NSError errorWithDomain:@"XTUserViewModel" code:1 userInfo:nil]];
                   }
                   
               });
               return nil;
           }];
        }];
        
    }
    
    return self;
}

@end
