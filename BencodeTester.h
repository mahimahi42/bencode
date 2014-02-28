//
//  BencodeTester.h
//  bencode
//
//  Created by Bryce Davis on 2/27/14.
//  Copyright (c) 2014 Bryce Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bencode.h"

@interface BencodeTester : NSObject

+ (BOOL) testStringDecode;
+ (BOOL) testIntegerDecode;
+ (BOOL) testListDecode;

+ (void) runTests;

@end
