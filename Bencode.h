//
//  Bencode.h
//  bencode
//
//  Created by Bryce Davis on 2/27/14.
//  Copyright (c) 2014 Bryce Davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bencode : NSObject

+ (NSString*) decodeString:(NSString*) str;
+ (NSInteger) decodeInteger:(NSString*) str;
+ (NSArray*) decodeList:(NSString*) str;

@end
