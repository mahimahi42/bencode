//
//  Bencode.h
//  bencode
//
//  Created by Bryce Davis on 2/27/14.
//  Copyright (c) 2014 Bryce Davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bencode : NSObject {
    NSString* bencodeString;
}

- (NSString*) decodeString:(NSString*) str;

@end
