//
//  XTValidation.h
//  ReactiveCocoaDemo
//
//  Created by admin on 16/3/6.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XTValidation : NSObject

+ (BOOL)isValidUsername:(NSString*)username;

+ (BOOL)isValidPassword:(NSString*)password;

@end
