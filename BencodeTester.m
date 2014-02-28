//
//  BencodeTester.m
//  bencode
//
//  Created by Bryce Davis on 2/27/14.
//  Copyright (c) 2014 Bryce Davis. All rights reserved.
//

#import "BencodeTester.h"

#define LogBool(BOOL) ((BOOL==YES)?@"YES":@"NO")

@implementation BencodeTester

+ (BOOL) testStringDecode {
    
    return NO;
}

+ (void) runTests {
    NSLog(@"Bencode Test Suite (Sounds fancy huh?)");
    NSLog(@"--------------------------------------\n\n");
    NSLog(@"String Decoding Working?: %@", LogBool([BencodeTester testStringDecode]));
}

@end
