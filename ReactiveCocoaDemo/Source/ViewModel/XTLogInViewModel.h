//
//  XTUserViewModel.h
//  ReactiveCocoaDemo
//
//  Created by imchenglibin on 16/3/4.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@class XTLogInModel;

@interface XTLogInViewModel : NSObject
@property (strong, nonatomic, readonly) XTLogInModel *model;
@property (strong, nonatomic, readonly) RACCommand *loginCommand;

- (instancetype)initWithModel:(XTLogInModel*)model;
@end
