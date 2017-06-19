//
//  TCKDUIManager.h
//  TCKitDemo
//
//  Created by 崔正清 on 2017/6/18.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TCKDScreen;
@class TCKDNavigationBar;
@class TCKDStatusBar;

@interface TCKDUIManager : NSObject

/**
 *  @description    单例方法
 *  @return         返回TCKDScreen的单例对象
 */
+ (TCKDUIManager *)shareManager;

//屏幕相关信息
@property (nonatomic,strong) TCKDScreen *screen;

//导航栏相关信息
@property (nonatomic,strong) TCKDNavigationBar *navigationBar;

//状态栏相关信息
@property (nonatomic,strong) TCKDStatusBar *statusBar;

@end
