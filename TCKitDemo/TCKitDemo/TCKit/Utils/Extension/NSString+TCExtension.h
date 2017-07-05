//
//  NSString+TCExtension.h
//  TCKitDemo
//
//  Created by czq on 2017/7/4.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TCExtension)

/** md5加密
 *  @return 返回加密后的字符串
 */
- (NSString *)tc_getMd5_32Bit;

/** 检查字符串是否为空
 *  @return YES字符串为空    NO字符串不为空
 */
- (BOOL)tc_isNull;

/*  检查字符串是否为整数
 *  @return YES是整数  NO不是整数
 */
- (BOOL)tc_isPureInt;

@end
