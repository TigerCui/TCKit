//
//  UIColor+TCExtension.m
//  TCKitDemo
//
//  Created by czq on 2017/7/4.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "UIColor+TCExtension.h"

@implementation UIColor (TCExtension)

+ (UIColor *)tc_colorWhitR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b {
    return [UIColor tc_colorWithR:r g:g b:b alpha:1];
}

+ (UIColor *)tc_colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}

+ (UIColor *)tc_colorWithHexNum:(NSInteger)hexNum {
    return [UIColor tc_colorWithHexNum:hexNum alpha:1];
}

+ (UIColor *)tc_colorWithHexNum:(NSInteger)hexNum alpha:(CGFloat)alpha {
    CGFloat red = ((hexNum & 0xFF0000) >> 16)/255.0;
    CGFloat green = ((hexNum & 0xFF00) >> 8)/255.0;
    CGFloat blue = (hexNum & 0xFF)/255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)tc_colorWithHexStr:(NSString *)hexStr {
    return [UIColor tc_colorWithHexStr:hexStr alpha:1];
}

+ (UIColor *)tc_colorWithHexStr:(NSString *)hexStr alpha:(CGFloat)alpha {
    if ([hexStr hasPrefix:@"#"]) {
        hexStr = [hexStr substringFromIndex:1];
    }
    if ([hexStr hasPrefix:@"0x"] || [hexStr hasPrefix:@"0X"]) {
        hexStr = [hexStr substringFromIndex:2];
    }
    if (hexStr.length < 6 || hexStr.length > 6) {
        return [UIColor clearColor];
    }
    NSString *redStr = [hexStr substringWithRange:NSMakeRange(0, 2)];
    NSString *greenStr = [hexStr substringWithRange:NSMakeRange(2, 2)];
    NSString *blueStr = [hexStr substringWithRange:NSMakeRange(4, 2)];
    redStr = [NSString stringWithFormat:@"0x%@",redStr];
    greenStr = [NSString stringWithFormat:@"0x%@",greenStr];
    blueStr = [NSString stringWithFormat:@"0x%@",blueStr];
    unsigned int r,g,b;
    [[NSScanner scannerWithString:redStr] scanHexInt:&r];
    [[NSScanner scannerWithString:greenStr] scanHexInt:&g];
    [[NSScanner scannerWithString:blueStr] scanHexInt:&b];
    UIColor *color = [UIColor tc_colorWithR:r g:g b:b alpha:alpha];
    return color;
}

@end
