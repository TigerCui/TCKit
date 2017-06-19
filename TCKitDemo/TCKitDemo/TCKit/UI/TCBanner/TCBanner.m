//
//  TCBanner.m
//  TCKitDemo
//
//  Created by 崔正清 on 2017/6/18.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "TCBanner.h"

@implementation TCBanner

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

//初始化scroll view
- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self addSubview:scrollView];
    scrollView.frame = self.frame;
}

@end
