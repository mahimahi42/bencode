//
//  main.m
//  bencode
//
//  Created by Bryce Davis on 2/27/14.
//  Copyright (c) 2014 Bryce Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bencode.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Bencode* b = [[Bencode alloc] init];
        NSString* testString = @"4:spam";
        NSString* newString = [b decodeString:testString];
        
        if ([testString isEqualToString:newString]) {
            NSLog(@"Yay!");
        } else {
            NSLog(@"TS: %@ NS: %@", testString, newString);
            NSLog(@"Aww..");
        }
    }
    return 0;
}

