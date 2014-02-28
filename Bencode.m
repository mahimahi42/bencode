//
//  Bencode.m
//  bencode
//
//  Created by Bryce Davis on 2/27/14.
//  Copyright (c) 2014 Bryce Davis. All rights reserved.
//

#import "Bencode.h"

@implementation Bencode

+ (BOOL) isNumber:(NSString *)str {
    NSCharacterSet* nonNums = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange r = [str rangeOfCharacterFromSet:nonNums];
    return r.location == NSNotFound;
}

+ (NSString*) decodeString:(NSString *)str {
    NSArray* strComponents = [str componentsSeparatedByString:@":"];
    NSString* strLength = strComponents[0];
    NSString* strContent = strComponents[1];
    
    if (![self isNumber:strLength]) {
        return nil;
    }
    
    NSInteger strLen = [strLength integerValue];
    
    if (strLen != [strContent length]) {
        return nil;
    }
    
    return strContent;
}

+ (NSInteger) decodeInteger:(NSString *)str {
    NSString* firstChar = [str substringToIndex:1];
    NSString* lastChar = [str substringFromIndex:[str length] - 1];
    NSInteger benInt = [[str substringWithRange:NSMakeRange(1, [str length] - 1)] integerValue];
    if ([firstChar isEqualToString:@"i"] && [lastChar isEqualToString:@"e"]) {
        return benInt;
    }
    return 0;
}

+ (NSArray*) decodeList:(NSString *)str {
    
    return nil;
}

@end
