//
//  UIView+SAMFrame.h
//  彩票
//
//  Created by 杨森 on 15/6/27.
//  Copyright (c) 2015年 samyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SAMFrame)

// 分类里面不能生成成员属性
// 会自动生成get，set方法和成员属性

// @property如果在分类里面只会生成get,set方法的声明，并不会生成成员属性。
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@end
