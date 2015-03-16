//
//  UIImage+WJTools.h
//  Kevin
//
//  Created by Kevin on 13/1/14.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WJTools)

/**
 *  生成一张以原图片为基础的新的平铺图片(以原图片中心一点进行平铺)
 *
 *  @param oldImage 原始图片
 *
 *  @return 新的平铺图片
 */
+ (UIImage *)imageWithTiledFromOldImage:(UIImage *) oldImage;
/**
 *  生成一张以原图片为基础的新的平铺图片(以原图片中心一点进行平铺)
 *
 *  @return 新的平铺图片
 */
- (UIImage *)resizableImageForTiled;
/**
 *  用UIColor画一张可平铺的图片
 *
 *  @param color 颜色
 *
 *  @return 新的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  用UIColor画一张可平铺的图片 , 注意: 这里的size必须要是偶数整数,不然生成的图片会有点问题
 *
 *  @param color 颜色
 *  @param size  尺寸
 *
 *  @return 新的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color AndSize:(CGSize)size;
/**
 *  将图片裁剪为圆形
 *
 *  @param inset
 *
 *  @return 裁剪好的图片
 */
- (UIImage *)circleImageWithParam:(CGFloat) inset;
/**
 *  将图片保存到本地路径
 *
 *  @param path      本地路径
 *  @param imageName 图片名
 */
- (void)saveToPath:(NSString *)path WithImageName:(NSString *)imageName;

@end
