//
//  XTUserViewModel.m
//  ReactiveCocoaDemo
//
//  Created by imchenglibin on 16/3/4.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import "XTLogInViewModel.h"
#import "XTLogInModel.h"
#import "XTAPIManager.h"
#import "XTValidation.h"

@implementation XTLogInViewModel

- (instancetype)initWithModel:(XTLogInModel*)model {
    if (self = [super init]) {
        _model = model;
        
        RACSignal *loginEnableSignal = [RACSignal combineLatest:@[RACObserve(self.model, username), RACObserve(self.model, password)] reduce:^(NSString *username, NSString *password){
            return @([XTValidation isValidUsername:username] && [XTValidation isValidPassword:password]);
        }];
        
        @weakify(self)
        _loginCommand = [[RACCommand alloc] initWithEnabled:loginEnableSignal signalBlock:^RACSignal *(id input) {
            @strongify(self)
            return [XTAPIManager logIn:self.model.username password:self.model.password];
        }];
    }
    return self;
}

- (instancetype)init {
    return [self initWithModel:[[XTLogInModel alloc] init]];
}

@end
