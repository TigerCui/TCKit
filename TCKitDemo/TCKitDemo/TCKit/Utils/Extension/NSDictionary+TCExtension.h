//
//  NSDictionary+TCExtension.h
//  TCKitDemo
//
//  Created by czq on 2017/7/3.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (TCExtension)

/*
 *  从url中截取出参数
 *  @param  url 需要分析的url
 *  @return 将url中所有的参数以key-value的方式返回
 */
+ (NSDictionary *)tc_parametersFromUrl:(NSString *)url;

@end
