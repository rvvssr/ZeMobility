//
//  NSString+Validation.m
//  SampleProject
//
//  Created by Nagabhushana Rao Vaddi on 20/12/14.
//  Copyright (c) 2014 Nagabhushan. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

+(BOOL)isNullOrEmpty:(NSString *)value
{
    NSString *str =  [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if(str.length == 0)
      return YES;
    else
      return NO;
}
+(BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
@end
