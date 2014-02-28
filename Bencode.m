//
//  Bencode.m
//  bencode
//
//  Created by Bryce Davis on 2/27/14.
//  Copyright (c) 2014 Bryce Davis. All rights reserved.
//

#import "Bencode.h"

@implementation Bencode

- (NSString*) decodeString:(NSString *)str {
    NSString* retStr;
    
    NSError* errRegex = NULL;
    NSRegularExpression* regex = [NSRegularExpression
                                  regularExpressionWithPattern:@"([\\d]+):[\\w]{$1}"
                                  options:NSRegularExpressionCaseInsensitive
                                  error:&errRegex];
    
    NSTextCheckingResult* searchStr = [regex firstMatchInString:str
                                             options:0
                                             range:NSMakeRange(0, [str length])];
    retStr = [str substringWithRange:searchStr.range];
    
    if ([retStr isEqualToString:str]) {
        return retStr;
    }
    
    return nil;
}

@end
