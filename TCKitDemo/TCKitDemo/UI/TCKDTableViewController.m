//
//  TCKDTableViewController.m
//  TCKitDemo
//
//  Created by 崔正清 on 2017/6/18.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "TCKDTableViewController.h"

@interface TCKDTableViewController ()

@end

@implementation TCKDTableViewController

#pragma mark - 初始化方法
+ (TCKDTableViewController *)tableViewWithDictionary:(NSDictionary *)tableViewData {
    TCKDTableViewController *tableViewController = [[TCKDTableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableViewController.tableViewData = tableViewData;
    return tableViewController;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置naviBar
    [self setupNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 设置navibar
- (void)setupNavigationBar {
    //获取数据
    NSArray *keys = [_tableViewData allKeys];
    self.title = keys[0];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_tableViewData allKeys].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //获取数据
    id value = [_tableViewData allValues].firstObject;
    if ([value isKindOfClass:[NSDictionary class]]) {
        NSArray *itemNames = [value allKeys];
        cell.textLabel.text = itemNames[indexPath.row];
        return cell;
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"数据出错%s",__func__ ];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取下个界面的数据
    NSArray *values = [_tableViewData allValues];
    id value = values[indexPath.row];
    if ([value isKindOfClass:[NSDictionary class]]) {
        //判断下个界面是什么界面
        NSDictionary *dValue = (NSDictionary *)value;
        NSArray *subValues = [dValue allValues];
        id subValue = subValues.firstObject;
        /*
         subValue 是NSDictionary  下个界面仍然是列表页面
                  是NSString      下个界面是功能展示页面
         */
        if ([subValue isKindOfClass:[NSDictionary class]]) {
            //下个界面仍然是列表页面
            TCKDTableViewController *tableViewController = [TCKDTableViewController tableViewWithDictionary:value];
            [self.navigationController pushViewController:tableViewController animated:YES];
        } else if ([subValue isKindOfClass:[NSString class]]) {
            //下个界面是功能展示页
            Class class = NSClassFromString(subValue);
            if (class) {
                id objc = [[class alloc] init];
                if ([objc isKindOfClass:[UIViewController class]]) {
                    [self.navigationController pushViewController:objc animated:YES];
                } else {
                    NSLog(@"%@不是继承与viewController类,无法创建界面%s",subValue,__func__);
                }
            } else {
                NSLog(@"不存在%@这个类%s",subValue,__func__);
            }
            
        } else {
            
        }
        
    } else {
        
    }
    
}


@end
