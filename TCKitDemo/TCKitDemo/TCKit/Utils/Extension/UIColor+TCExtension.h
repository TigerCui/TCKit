//
//  UIColor+TCExtension.h
//  TCKitDemo
//
//  Created by czq on 2017/7/4.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TCExtension)

/** RGB转换为颜色
 *  @param  r  red
 *  @param  g  green
 *  @param  b  blue
 */
+ (UIColor *)tc_colorWhitR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;

/** RGB转换为颜色
 *  @param  r       red
 *  @param  g       green
 *  @param  b       blue
 *  @param  alpha   透明度
 */
+ (UIColor *)tc_colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha;

/** 十六进制数转换为颜色
 *  @param  hexNum   十六进制数颜色
 *  注：+ (UIColor *)colorWithHexNum:(NSInteger)hexNum;方法中透明度默认为1
 */
+ (UIColor *)tc_colorWithHexNum:(NSInteger)hexNum;

/** 十六进制数转换为颜色
 *  @param  hexNum   十六进制数颜色
 *  @param  alpha   透明度
 *  注：+ (UIColor *)colorWithHexNum:(NSInteger)hexNum;方法中透明度默认为1
 */
+ (UIColor *)tc_colorWithHexNum:(NSInteger)hexNum alpha:(CGFloat)alpha;

/** 十六进制字符串转换为颜色
 *  @hexStr     十六进制字符串
 *  注：+ (UIColor *)colorWithHexStr:(NSString *)hexStr;方法中透明度默认为1
 *      十六进制字符串格式包括：@"000000" @"#000000"  @"0x000000"  @"0X000000"
 */
+ (UIColor *)tc_colorWithHexStr:(NSString *)hexStr;

/** 十六进制字符串转换为颜色
 *  @hexStr     十六进制字符串
 *  @alpha      透明度
 *  注：十六进制字符串格式包括：@"000000" @"#000000"  @"0x000000"  @"0X000000"
 */
+ (UIColor *)tc_colorWithHexStr:(NSString *)hexStr alpha:(CGFloat)alpha;

@end
