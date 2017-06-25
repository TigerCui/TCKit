//
//  TCBanner.m
//  TCKitDemo
//
//  Created by 崔正清 on 2017/6/18.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "TCBanner.h"
//定时器
#import "TCJX_GCDTimerManager.h"

@implementation TCBanner
{
    UIScrollView *_scrollView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupScrollView];
    }
    return self;
}

//初始化scroll view
- (void)setupScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _scrollView.backgroundColor = [UIColor blueColor];
    [self addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(self.frame.size.width * 5.0, self.frame.size.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    //添加广告图
    [self setupADSImageViewInScrollView:_scrollView];
    //设置定时器
    [self startTimer];
}

//添加广告图
- (void)setupADSImageViewInScrollView:(UIScrollView *)scrollView {
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        [scrollView addSubview:imageView];
        switch (i) {
            case 0:
            {
                imageView.backgroundColor = [UIColor colorWithRed:146/255.0 green:39/255.0 blue:143/255.0 alpha:1];
            }
                break;
            case 1:
            {
                imageView.backgroundColor = [UIColor colorWithRed:241/255.0 green:89/255.0 blue:42/255.0 alpha:1];
            }
                break;
            case 2:
            {
                imageView.backgroundColor = [UIColor colorWithRed:248/255.0 green:147/255.0 blue:31/255.0 alpha:1];
            }
                break;
            case 3:
            {
                imageView.backgroundColor = [UIColor colorWithRed:140/255.0 green:197/255.0 blue:64/255.0 alpha:1];
            }
                break;
            default:
            {
                imageView.backgroundColor = [UIColor colorWithRed:9/255.0 green:179/255.0 blue:205/255.0 alpha:1];
            }
                break;
        }
    }
}

//初始化定时器
- (void)startTimer {
    __weak typeof(self) weakself = self;
    [[TCJX_GCDTimerManager sharedInstance] scheduledDispatchTimerWithName:@"banner_timer"
                                                             timeInterval:2.0
                                                                    queue:nil
                                                                  repeats:YES
                                                             actionOption:AbandonPreviousAction
                                                                   action:^
    {
        [weakself scrollScrollView];
    }];
}

//停止timer
- (void)stopTimer {
    [[TCJX_GCDTimerManager sharedInstance] cancelTimerWithName:@"banner_timer"];
}

//滚动scroll view
- (void)scrollScrollView {
    //获取当前scroll view显示的index
    NSInteger index = round(_scrollView.contentOffset.x / _scrollView.frame.size.width);
    [_scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width * (index + 1), 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
}

//scroll view 代理方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}

//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    NSLog(@"拖拉结束");
//    [self startTimer];
//    [self didScrollEdge:scrollView];
//}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"动画结束");
    [self didScrollEdge:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"减速结束");
    [self startTimer];
    [self didScrollEdge:scrollView];
}

//滚动到边界时
- (void)didScrollEdge:(UIScrollView *)scrollView {
    NSInteger index = round(scrollView.contentOffset.x / scrollView.frame.size.width);
    if (index == 4) {
        [scrollView scrollRectToVisible:CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
    }
    if (index == 0) {
        [scrollView scrollRectToVisible:CGRectMake(3 * scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
    }
}

//滚动到边界时如何处理

- (void)dealloc {
    NSLog(@"Banner已销毁");
}

@end
