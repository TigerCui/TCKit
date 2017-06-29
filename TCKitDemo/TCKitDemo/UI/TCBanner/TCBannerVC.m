//
//  TCBannerVC.m
//  TCKitDemo
//
//  Created by 崔正清 on 2017/6/18.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "TCBannerVC.h"
//banner
#import "TCBanner.h"
//屏幕管理
#import "TCKDUIManager.h"
#import "TCKDScreen.h"
#import "TCKDNavigationBar.h"
#import "TCKDStatusBar.h"

@interface TCBannerVC ()

@end

@implementation TCBannerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TCBanner";
    [self setupBanner];
}


- (void)setupBanner {
    NSArray *images = @[@"banner_0",@"banner_1",@"banner_2",@"banner_3",@"banner_4"];
    CGFloat y = [TCKDUIManager shareManager].navigationBar.height + [TCKDUIManager shareManager].statusBar.height;
    TCBanner *banner = [[TCBanner alloc] initWithFrame:CGRectMake(0, y, [TCKDUIManager shareManager].screen.width, 300)
                                                images:images
                                             direction:TCBannerScrollDirectionVerticalReverse
                                          timeInterval:2.0];
    //[[TCBanner alloc] initWithFrame:CGRectMake(0, y, [TCKDUIManager shareManager].screen.width, 300)];
    [self.view addSubview:banner];
    banner.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
