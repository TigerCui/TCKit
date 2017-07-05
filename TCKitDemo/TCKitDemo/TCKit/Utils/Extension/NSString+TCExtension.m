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

- (BOOL)tc_isPureFloat {
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (CGSize)tc_sizeOfStringWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (NSDictionary *)tc_getUrlParameters {
    //获取到"?"位置
    NSRange range = [self rangeOfString:@"?"];
    //判断url中是否有参数
    if (range.length == 0) {
        return nil;
    }
    //截取问号后的内容
    NSString *allParameter = [self substringFromIndex:range.location+range.length];
    NSLog(@"%@ %s",allParameter,__func__);
    //用一个数组保存拆分后的所有参数
    NSMutableArray *parameters = [NSMutableArray array];
    //循环 截取出所有的url参数保存在数组中
    do {
        //获取到"&"的位置
        range = [allParameter rangeOfString:@"&"];
        //如果能够截取到& 说明现在allParameter中还有多个参数  需要截取
        if (range.length) {
            //截取出&之前的字符串
            NSString *parameter = [allParameter substringToIndex:range.location];
            //留下&之后的字符串
            allParameter = [allParameter substringFromIndex:range.location + range.length];
            //将&之前的字符串保存到数组中
            [parameters addObject:parameter];
        } else {
            //allParameter中已经没有&了 说明此时只有一个参数了  把这个参数加入到数组中
            [parameters addObject:allParameter];
        }
    } while (range.length);
    //遍历parameters数组 将其中的字符串转化为字典
    //初始化字典
    NSMutableDictionary *parametersDict = [NSMutableDictionary dictionary];
    //遍历数组
    for (NSString *string in parameters) {
        //获取到字符串中"="位置
        range = [string rangeOfString:@"="];
        if (range.length) {
            //截取"="之前的字符串作为key
            NSString *key = [string substringToIndex:range.location];
            //截取"="之后的字符串作为value
            NSString *value = [string substringFromIndex:range.location+range.length];
            //放入字典
            [parametersDict setObject:value forKey:key];
        }
    }
    return [parametersDict copy];
}

@end
