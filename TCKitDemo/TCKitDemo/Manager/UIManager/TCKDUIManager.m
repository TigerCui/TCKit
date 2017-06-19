//
//  TCKDUIManager.m
//  TCKitDemo
//
//  Created by 崔正清 on 2017/6/18.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "TCKDUIManager.h"

//屏幕
#import "TCKDScreen.h"
//导航栏
#import "TCKDNavigationBar.h"
//状态栏
#import "TCKDStatusBar.h"

static TCKDUIManager *manager;

@implementation TCKDUIManager

+ (TCKDUIManager *)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TCKDUIManager alloc] init];
    });
    
    return manager;
}

- (TCKDScreen *)screen {
    if (_screen == nil) {
        self.screen = [[TCKDScreen alloc] init];
    }
    return _screen;
}

- (TCKDNavigationBar *)navigationBar {
    if (_navigationBar == nil) {
        self.navigationBar = [[TCKDNavigationBar alloc] init];
    }
    return _navigationBar;
}

- (TCKDStatusBar *)statusBar {
    if (_statusBar == nil) {
        self.statusBar = [[TCKDStatusBar alloc] init];
    }
    return _statusBar;
}


@end
