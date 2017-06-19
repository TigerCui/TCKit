//
//  TCKDTableViewController.h
//  TCKitDemo
//
//  Created by 崔正清 on 2017/6/18.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCKDTableViewController : UITableViewController

/*
 @description   table view的初始化方法
 @parameter     tableViewData tableView会根据此数据初始化tableView
                数据结构为
                @{
                    @"key":@"value"
                }
 */
+ (TCKDTableViewController *)tableViewWithDictionary:(NSDictionary *)tableViewData;

@property (nonatomic,strong) NSDictionary *tableViewData;

@end
