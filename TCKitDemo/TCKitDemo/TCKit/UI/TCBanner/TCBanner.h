//
//  TCBanner.h
//  TCKitDemo
//
//  Created by 崔正清 on 2017/6/18.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TCBanner;

/*
 *  定义了banner的滚动方向
 *  @param  TCBannerScrollDirectionHorizontal           水平方向从左向右
 *  @param  TCBannerScrollDirectionHorizontalReverse    水平方向从右向左
 *  @param  TCBannerScrollDirectionVertical             竖直方向从上往下
 *  @param  TCBannerScrollDirectionVerticalReverse      竖直方向从下往上
 */
typedef NS_ENUM(NSInteger,TCBannerScrollDirection) {
    TCBannerScrollDirectionHorizontal,
    TCBannerScrollDirectionHorizontalReverse,
    TCBannerScrollDirectionVertical,
    TCBannerScrollDirectionVerticalReverse
};

@protocol TCBanner <NSObject>

@optional
/*
 *  点击banner中图片的代理方法
 *  @param  banner  banner的引用
 *  @param  index   点击图片的下标
 */
- (void)banner:(TCBanner *)banner didTapOnImageViewAtIndex:(NSInteger)index;

@end

@interface TCBanner : UIView <UIScrollViewDelegate>

/*
 *  初始化方法
 *  @param  frame       banner的frame属性
 *  @param  images      banner中要显示的图片数组,其中保存的是图片名
 *  @param  direction   banner自动滚动的方向
 *  @param  interval    自动滚动时的时间间隔
 */
- (instancetype)initWithFrame:(CGRect)frame
                       images:(NSArray *)images
                    direction:(TCBannerScrollDirection)direction
                 timeInterval:(NSTimeInterval)interval;

@end
