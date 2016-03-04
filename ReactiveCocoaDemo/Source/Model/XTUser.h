//
//  XTUser.h
//  ReactiveCocoaDemo
//
//  Created by imchenglibin on 16/3/4.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XTUser : NSObject
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *password;

- (instancetype)initWithUsername:(NSString*)username password:(NSString*)password;
+ (instancetype)userWithUsername:(NSString*)username password:(NSString*)password;
@end
