//
//  AppDelegate+TableViewData.m
//  TCKitDemo
//
//  Created by 崔正清 on 2017/6/18.
//  Copyright © 2017年 tc. All rights reserved.
//  处理tableView的数据

#import "AppDelegate+TableViewData.h"

@implementation AppDelegate (TableViewData)

- (NSDictionary *)setupTableViewData {
    NSDictionary *data = @{@"TCKit":@{
                                   @"UI":@{
                                           @"TCBanner":@"TCBannerVC"
                                           }
                                   }
                           };
    return data;
}

@end
