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
    
    return 0;
}

@end
