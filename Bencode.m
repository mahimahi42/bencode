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

+ (BOOL) isBencodeString:(NSString *)str {
    NSArray* strComponents = [str componentsSeparatedByString:@":"];
    NSString* strLength = strComponents[0];
    NSString* strContent = strComponents[1];
    
    if (![Bencode isNumber:strLength] || [strContent length] != [strLength integerValue]) {
        return NO;
    }
    return YES;
}

+ (BOOL) isBencodeInteger:(NSString *)str {
    NSString* firstChar = [str substringToIndex:1];
    NSString* lastChar = [str substringFromIndex:[str length] - 1];
    if (![firstChar isEqualToString:@"i"] ||
        ![lastChar isEqualToString:@"e"]) {
        return NO;
    }
    return YES;
}

+ (NSString*) decodeString:(NSString *)str {
    if (![Bencode isBencodeString:str]) {
        return nil;
    }
    NSArray* strComponents = [str componentsSeparatedByString:@":"];
    return strComponents[1];
}

+ (NSInteger) decodeInteger:(NSString *)str {
    if (![Bencode isBencodeInteger:str]) {
        return 0;
    }
    return [[str substringWithRange:NSMakeRange(1, [str length] - 1)] integerValue];
}

+ (NSArray*) decodeList:(NSString *)str {
    NSString* firstChar = [str substringToIndex:1];
    NSString* lastChar = [str substringFromIndex:[str length] - 1];
    if (![firstChar isEqualToString:@"l"] || ![lastChar isEqualToString:@"e"]) {
        return nil;
    }
    return nil;
}

@end
