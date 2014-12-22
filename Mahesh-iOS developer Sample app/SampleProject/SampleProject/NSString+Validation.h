//
//  NSString+Validation.h
//  SampleProject
//
//  Created by Nagabhushana Rao Vaddi on 20/12/14.
//  Copyright (c) 2014 Nagabhushan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)

+(BOOL)isNullOrEmpty:(NSString *)value;
+(BOOL)validateEmailWithString:(NSString*)email;
@end
