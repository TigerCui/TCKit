//
//  TCKDScreen.m
//  TCKitDemo
//
//  Created by 崔正清 on 2017/6/18.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "TCKDScreen.h"

@implementation TCKDScreen

- (CGFloat)width {
    return [UIScreen mainScreen].bounds.size.width;
}

- (CGFloat)height {
    return [UIScreen mainScreen].bounds.size.height;
}

@end
