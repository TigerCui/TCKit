//
//  NSString+TCExtension.h
//  TCKitDemo
//
//  Created by czq on 2017/7/4.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TCExtension)

/** md5加密
 *  @return 返回加密后的字符串
 */
- (NSString *)tc_getMd5_32Bit;

/** 检查字符串是否为空
 *  @return YES字符串为空    NO字符串不为空
 */
- (BOOL)tc_isNull;

/** 检查字符串是否为整数
 *  @return YES是整数  NO不是整数
 */
- (BOOL)tc_isPureInt;

/** 检查字符串是否是小数
 *  @return YES是小数 NO不是小数
 */
- (BOOL)tc_isPureFloat;

/** 计算字符串所占面积大小
 *  @param  font    字符串字体
 *  @param  maxSize 允许字符串所能展示的最大面积,如果只显示一行,将宽高都设置为MAXFLOAT,如果想限制宽度,可以给定一个宽度值,高度仍然设置为MAXFLOAT
 *  @return 返回字符串所占面积大小
 */
- (CGSize)tc_sizeOfStringWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/** 从url中截取出参数
 *  @return 将url中所有的参数以key-value的方式返回
 */
- (NSDictionary *)tc_getUrlParameters;

@end
