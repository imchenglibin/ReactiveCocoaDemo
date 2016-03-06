//
//  XTUser.h
//  ReactiveCocoaDemo
//
//  Created by imchenglibin on 16/3/4.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XTLogInModel : NSObject
@property (copy, nonatomic, readonly) NSString *username;
@property (copy, nonatomic, readonly) NSString *password;

- (instancetype)initWithUsername:(NSString*)username password:(NSString*)password;
+ (instancetype)logInModelWithUsername:(NSString*)username password:(NSString*)password;
@end
