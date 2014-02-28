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
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    if (![firstChar isEqualToString:@"l"] || ![lastChar isEqualToString:@"e"]) {
        return nil;
    }
    return [Bencode parseList:str
                     withList:arr];
}

+ (NSArray*) parseList:(NSString*)str withList:(NSMutableArray*)arr {
    if ([str length] == 0) {
        return [arr copy];
    }
    NSString* firstChar = [str substringToIndex:1];
    if ([firstChar isEqualToString:@"i"]) {
        int index = 1;
        while ([str characterAtIndex:index] != 'e') {
            index++;
        }
        NSInteger benInt = [[str substringWithRange:NSMakeRange(1, index)] integerValue];
        [arr addObject:[NSNumber numberWithInt:benInt]];
        [Bencode parseList:[str substringFromIndex:index]
                  withList:arr];
    } else {
        [Bencode parseList:[str substringFromIndex:1]
                  withList:arr];
    }
    
    return [arr copy];
}

@end
