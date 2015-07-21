//
//  UIImage+SAMImage.h
//  彩票
//
//  Created by 杨森 on 15/6/27.
//  Copyright (c) 2015年 samyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SAMImage)

// 快速的返回一个最原始的图片
+ (instancetype)imageWithOriRenderingImage:(NSString *)imageName;

+ (instancetype)imageWithStretchableImageName:(NSString *)imageName;
@end
