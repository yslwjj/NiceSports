//
//  SAMGuideViewCell.m
//  彩票
//
//  Created by 杨森 on 15/6/30.
//  Copyright (c) 2015年 samyang. All rights reserved.
//

#import "SAMGuideViewCell.h"

#import "SAMMainViewController.h"

@interface SAMGuideViewCell ()

/** imageView */
@property (nonatomic, weak) UIImageView *imageView;

/** startBtn */
@property (nonatomic, weak) UIButton *startBtn;

@end

@implementation SAMGuideViewCell

- (UIButton *)startBtn
{
    if (_startBtn == nil) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [_startBtn sizeToFit];
        
        _startBtn.center = CGPointMake(SAMScreenW * 0.5, SAMScreenH *0.9);
        
        [_startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_startBtn];
        
    }
    return _startBtn;
}

// 实现懒加载
- (UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *imV = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView = imV;
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}

- (void)setUpStratLearningBtnAtIndexPath:(NSIndexPath *)indexPath count:(NSInteger)pagesCount
{
    if (indexPath.row == pagesCount - 1) {
        self.startBtn.hidden = NO;
    }else{
        self.startBtn.hidden = YES;
    }
}

// 点击立即体验按钮
- (void)start
{
    // 跳转到核心界面，push, modal, 切换根控制器的方法
    SAMKeyWindow.rootViewController = [[SAMMainViewController alloc] init];
    
    CATransition *anim = [CATransition animation];
    anim.duration = 0.5;
    anim.type = @"rippleffect";
    [SAMKeyWindow.layer addAnimation:anim forKey:nil];
}

@end
