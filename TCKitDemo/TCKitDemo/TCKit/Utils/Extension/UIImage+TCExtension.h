//
//  UIImage+TCExtension.h
//  TCKitDemo
//
//  Created by 崔正清 on 2017/7/4.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TCExtension)

/** 生成二维码
 *  @param  qrCode 要生成为二维码的string
 *  @param  size   生成的二维码的图片尺寸,一般为正方形所以这只给一个边长
 */
+ (UIImage *)tc_imageQRCodeWithString:(NSString *)qrCode size:(CGFloat)size;

/** 修改图片尺寸
 *  @param  size    目标图片的尺寸
 */
- (UIImage *)tc_imageScaleToSize:(CGSize)size;

@end
