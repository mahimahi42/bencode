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
    NSString* sampleString = @"4:spam";
    NSString* correctString = @"spam";
    NSString* testString = [Bencode decodeString:sampleString];
    return [correctString isEqualToString:testString];
}

+ (BOOL) testIntegerDecode {
    NSString* sampleString = @"i42e";
    NSInteger correctInt = 42;
    NSInteger testInt = [Bencode decodeInteger:sampleString];
    return correctInt == testInt ? YES : NO;
}

+ (void) runTests {
    NSLog(@"Bencode Test Suite (Sounds fancy huh?)");
    NSLog(@"--------------------------------------\n");
    NSLog(@"String Decoding Working?: %@",
          LogBool([BencodeTester testStringDecode]));
    NSLog(@"Integer Decoding Working?: %@",
          LogBool([BencodeTester testIntegerDecode]));
}

@end
