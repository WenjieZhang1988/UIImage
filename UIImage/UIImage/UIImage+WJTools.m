//
//  UIImage+WJTools.m
//  Kevin
//
//  Created by Kevin on 13/1/14.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "UIImage+WJTools.h"

@implementation UIImage (WJTools)

+ (UIImage *)imageWithTiledFromOldImage:(UIImage *)oldImage
{
    UIEdgeInsets tempSet = UIEdgeInsetsMake(oldImage.size.height *0.5, oldImage.size.width *0.5, oldImage.size.height *0.5, oldImage.size.width *0.5);
    return [oldImage resizableImageWithCapInsets:tempSet];
}

- (UIImage *)resizableImageForTiled
{
    return [UIImage imageWithTiledFromOldImage:self];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGSize size = CGSizeMake(10, 10);
    return [self imageWithColor:color AndSize:size];
}

+ (UIImage *)imageWithColor:(UIColor *)color AndSize:(CGSize)size
{
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //    UIGraphicsBeginImageContext(CGSizeMake(200, 200));
    //    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    //    [[UIColor greenColor] set];
    //    [path fill];
    //
    //    UIImage *tempimage=UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    UIImage * newImage = [theImage resizableImageForTiled];
    return newImage;
}

- (void)saveToPath:(NSString *)path WithImageName:(NSString *)imageName
{
    NSData * imageData = UIImagePNGRepresentation(self);
    // 将图片写入本地
    [imageData writeToFile:[path stringByAppendingPathComponent:imageName] atomically:YES];
}

-(UIImage*) circleImageWithParam:(CGFloat) inset
{
    UIGraphicsBeginImageContext(self.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:162/255.0 green:207/255.0 blue:221/255.0 alpha:1.0].CGColor); //调整边框颜色 162 207 221
    CGRect rect = CGRectMake(inset, inset, self.size.width - inset * 2.0f, self.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    [self drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

@end
