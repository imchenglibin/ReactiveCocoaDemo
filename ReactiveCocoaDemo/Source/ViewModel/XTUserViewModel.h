//
//  XTUserViewModel.h
//  ReactiveCocoaDemo
//
//  Created by imchenglibin on 16/3/4.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@class XTUser;
@interface XTUserViewModel : NSObject
@property (strong, nonatomic) XTUser *user;
@property (strong, nonatomic) RACCommand *loginCommand;
@end
