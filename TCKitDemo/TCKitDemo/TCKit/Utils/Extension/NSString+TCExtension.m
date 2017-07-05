//
//  NSString+TCExtension.m
//  TCKitDemo
//
//  Created by czq on 2017/7/4.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "NSString+TCExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (TCExtension)

- (NSString *)tc_getMd5_32Bit {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned int)self.length, digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return [result copy];
}

- (BOOL)tc_isNull {
    if ( !self || (self.length == 0) || [self isEqualToString:@"Null"] || [self isEqualToString:@"null"] || [self isEqualToString:@"nil"]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)tc_isPureInt {
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

@end
