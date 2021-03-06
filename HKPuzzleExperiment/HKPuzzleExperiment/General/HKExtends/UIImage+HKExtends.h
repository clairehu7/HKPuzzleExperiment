//
//  UIImage+HKExtends.h
//  HKBaseNavigationDemo
//
//  Created by hukaiyin on 16/6/26.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HKExtends)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;

+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  缩放图片
 *
 *  @param newSize   图片尺寸
 *  @param withScale 是否 * [UIScreen mainScreen].scale
 *
 *  @return 处理后的图片
 */
-(UIImage*)scaledToSize:(CGSize)newSize withScale:(BOOL)withScale;

-(UIImage*)getSubImage:(CGRect)rect;

//高斯模糊效果
- (UIView *)blurView;

//截屏
+ (UIImage *)screenshot;

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image
                                            withSize:(CGFloat)size;

//压缩到指定大小
+ (NSData *)scaleImage:(UIImage *)image toKb:(NSInteger)kb;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
