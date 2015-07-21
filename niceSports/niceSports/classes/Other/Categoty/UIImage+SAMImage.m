//
//  UIImage+SAMImage.m
//  彩票
//
//  Created by 杨森 on 15/6/27.
//  Copyright (c) 2015年 samyang. All rights reserved.
//

#import "UIImage+SAMImage.h"

@implementation UIImage (SAMImage)

// 快速的返回一个最原始的图片
+ (instancetype)imageWithOriRenderingImage:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (instancetype)imageWithStretchableImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
