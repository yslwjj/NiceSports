//
//  SAMGuideViewCell.h
//  彩票
//
//  Created by 杨森 on 15/6/30.
//  Copyright (c) 2015年 samyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAMGuideViewCell : UICollectionViewCell

/** image */
@property (nonatomic, strong) UIImage *image;

- (void)setUpStratLearningBtnAtIndexPath:(NSIndexPath *)indexPath count:(NSInteger)pagesCount;

@end
