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

@interface TCBanner ()

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,copy) NSArray *images;

@property (nonatomic,assign) TCBannerScrollDirection direction;

@property (nonatomic,assign) NSTimeInterval interval;

@end

@implementation TCBanner

#pragma mark - 初始化方法
//万能初始化方法
- (instancetype)initWithFrame:(CGRect)frame
                       images:(NSArray *)images
                    direction:(TCBannerScrollDirection)direction
                 timeInterval:(NSTimeInterval)interval
{
    self = [super initWithFrame:frame];
    if (self) {
        _images = images;
        _direction = direction;
        _interval = interval;
        [self setupScrollView];
    }
    return self;
}

- (instancetype)init {
    NSLog(@"请使用- (instancetype)initWithFrame: images: direction: timeInterval: 方法初始化TCBanner");
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    NSLog(@"请使用- (instancetype)initWithFrame: images: direction: timeInterval: 方法初始化TCBanner");
    return nil;
}

//初始化scroll view
- (void)setupScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_scrollView];
    switch (_direction) {
        case TCBannerScrollDirectionHorizontal:
        case TCBannerScrollDirectionHorizontalReverse:
        {
            _scrollView.contentSize = CGSizeMake(self.frame.size.width * _images.count, self.frame.size.height);
        }
            break;
        case TCBannerScrollDirectionVertical:
        case TCBannerScrollDirectionVerticalReverse:
        {
            _scrollView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height  * _images.count);
        }
            break;
    }
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    //添加广告图
    [self setupADSImageViewInScrollView:_scrollView];
}

//添加广告图
- (void)setupADSImageViewInScrollView:(UIScrollView *)scrollView {
    if (_images.count > 1) {
        for (int i = 0; i < _images.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.tag = i;
            switch (_direction) {
                case TCBannerScrollDirectionHorizontal:
                case TCBannerScrollDirectionHorizontalReverse:
                {
                    imageView.frame = CGRectMake(i * _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
                }
                    break;
                case TCBannerScrollDirectionVertical:
                case TCBannerScrollDirectionVerticalReverse:
                {
                    imageView.frame = CGRectMake(0, i * _scrollView.frame.size.height, _scrollView.frame.size.width, _scrollView.frame.size.height);
                }
                    break;
            }
            [scrollView addSubview:imageView];
            NSString *image = _images[i];
            NSString *firstImage = [_images firstObject];
            NSString *lastImage = [_images lastObject];
            if (i == 0) {
                imageView.image = [UIImage imageNamed:lastImage];
            } else if (i == _images.count) {
                imageView.image = [UIImage imageNamed:firstImage];
            } else {
                imageView.image = [UIImage imageNamed:image];
            }
        }
        switch (_direction) {
            case TCBannerScrollDirectionHorizontal:
            case TCBannerScrollDirectionHorizontalReverse:
            {
                [_scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:NO];
            }
                break;
            case TCBannerScrollDirectionVertical:
            case TCBannerScrollDirectionVerticalReverse:
            {
                [_scrollView scrollRectToVisible:CGRectMake(0, _scrollView.frame.size.height, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:NO];
            }
                break;
        }
        //设置定时器
        [self startTimer];
    } else if (_images.count == 1) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.tag = 0;
        [scrollView addSubview:imageView];
        imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        NSString *image = _images[0];
        imageView.image = [UIImage imageNamed:image];
    } else {
        NSLog(@"%@",[NSString stringWithFormat:@"传入banner的图片数组中没有元素 %s",__func__]);
    }
}

//给广告图添加点击事件
- (void)addTargetOnImageView:(UIImageView *)imageView {
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnImageView:)];
    [imageView addGestureRecognizer:tapGR];
}

- (void)tapOnImageView:(UIImageView *)imageView {
    
}

//初始化定时器
- (void)startTimer {
    __weak typeof(self) weakself = self;
    [[TCJX_GCDTimerManager sharedInstance] scheduledDispatchTimerWithName:@"banner_timer"
                                                             timeInterval:_interval
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
    switch (_direction) {
        case TCBannerScrollDirectionHorizontal:
        {
            NSInteger index = round(_scrollView.contentOffset.x / _scrollView.frame.size.width);
            [_scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width * (index + 1), 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
        }
            break;
        case TCBannerScrollDirectionHorizontalReverse:
        {
            NSInteger index = round(_scrollView.contentOffset.x / _scrollView.frame.size.width);
            [_scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width * (index - 1), 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
        }
            break;
        case TCBannerScrollDirectionVertical:
        {
            NSInteger index = round(_scrollView.contentOffset.y / _scrollView.frame.size.height);
            [_scrollView scrollRectToVisible:CGRectMake(0, _scrollView.frame.size.height * (index + 1), _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
        }
            break;
        case TCBannerScrollDirectionVerticalReverse:
        {
            NSInteger index = round(_scrollView.contentOffset.y / _scrollView.frame.size.height);
            [_scrollView scrollRectToVisible:CGRectMake(0, _scrollView.frame.size.height * (index - 1), _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
        }
            break;
    }
    
}

//scroll view 代理方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self didScrollEdge:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self startTimer];
    [self didScrollEdge:scrollView];
}

//滚动到边界时
- (void)didScrollEdge:(UIScrollView *)scrollView {
    switch (_direction) {
        case TCBannerScrollDirectionHorizontal:
        case TCBannerScrollDirectionHorizontalReverse:
        {
            NSInteger index = round(scrollView.contentOffset.x / scrollView.frame.size.width);
            if (index == _images.count - 1) {
                [scrollView scrollRectToVisible:CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
            }
            if (index == 0) {
                [scrollView scrollRectToVisible:CGRectMake((_images.count - 1) * scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
            }
        }
            break;
        case TCBannerScrollDirectionVertical:
        case TCBannerScrollDirectionVerticalReverse:
        {
            NSInteger index = round(scrollView.contentOffset.y / scrollView.frame.size.height);
            if (index == _images.count - 1) {
                [scrollView scrollRectToVisible:CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
            }
            if (index == 0) {
                [scrollView scrollRectToVisible:CGRectMake(0, (_images.count - 1) * scrollView.frame.size.height, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
            }
        }
            break;
    }

}

- (void)dealloc {
    NSLog(@"Banner已销毁");
}

@end
