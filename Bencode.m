//
//  Bencode.m
//  bencode
//
//  Created by Bryce Davis on 2/27/14.
//  Copyright (c) 2014 Bryce Davis. All rights reserved.
//

#import "Bencode.h"

@implementation Bencode

- (BOOL) isNumber:(NSString *)str {
    NSCharacterSet* nonNums = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange r = [str rangeOfCharacterFromSet:nonNums];
    return r.location == NSNotFound;
}

- (NSString*) decodeString:(NSString *)str {    
//    NSError* errRegex = NULL;
//    NSRegularExpression* regex = [NSRegularExpression
//                                  regularExpressionWithPattern:@"([\\d]+):[\\w]{$1}"
//                                  options:NSRegularExpressionCaseInsensitive
//                                  error:&errRegex];
//    
//    NSTextCheckingResult* searchStr = [regex firstMatchInString:str
//                                             options:0
//                                             range:NSMakeRange(0, [str length])];
//    retStr = [str substringWithRange:searchStr.range];
//    
//    NSLog(@"ArgStr: %@ RetStr: %@", str, retStr);
//    
//    if ([retStr isEqualToString:str]) {
//        return retStr;
//    }
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

@end
