//
//  SAMNewFeatureViewController.m
//  彩票
//
//  Created by 杨森 on 15/6/30.
//  Copyright (c) 2015年 samyang. All rights reserved.
//

#import "SAMNewFeatureViewController.h"
#import "SAMGuideViewCell.h"

@interface SAMNewFeatureViewController ()

@property (nonatomic, assign) CGFloat lastOffsetX;

/** guideView */
@property (nonatomic, weak) UIImageView *guideView;

/** guideLargetView */
@property (nonatomic, weak) UIImageView *guideLargetView;

/** guideSmallView */
@property (nonatomic, weak) UIImageView *guideSmallView;

@end

@implementation SAMNewFeatureViewController

static NSString * const reuseIdentifier = @"Cell";

static NSString *ID = @"cell";

- (instancetype)init
{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    
    // 设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置同一行的item间隔
    layout.minimumInteritemSpacing = 0;
    // 设置行之间的间隔
    layout.minimumLineSpacing = 0;
    
    // 设置单个item的大小
    layout.itemSize = SAMScreenBounds.size;
    
    return [super initWithCollectionViewLayout:layout];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 取消弹簧效果
    self.collectionView.bounces = NO;
    
    // 不显示滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    // 分页效果
    self.collectionView.pagingEnabled = YES;
    
    // 注册cell
    [self.collectionView registerClass:[SAMGuideViewCell class] forCellWithReuseIdentifier:ID];
    
    [self addAllSubViews];
}



#pragma mark - 添加所有子控件
- (void)addAllSubViews
{
    // 添加线条
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.centerX -= 165;
    
    [self.collectionView addSubview:guideLine];
    
    // 添加最大的图片
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    guide.centerX = self.view.centerX;
    
    _guideView = guide;
    [self.collectionView addSubview:guide];
    
    // 添加 guideLargeView
    UIImageView *guideLargeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    _guideLargetView = guideLargeView;
    guideLargeView.centerX = self.view.center.x;
    guideLargeView.centerY = self.view.height * 0.7;
    
    [self.collectionView addSubview:guideLargeView];
    
    // 添加 guideSmallView
    UIImageView *guideSmallView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    guideSmallView.centerX = self.view.center.x;
    guideSmallView.centerY = self.view.height * 0.8;
    _guideSmallView = guideSmallView;
    [self.collectionView addSubview:guideSmallView];

    
}

#pragma mark - ScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat curOffsetX = scrollView.contentOffset.x;
    CGFloat offsetX = curOffsetX - _lastOffsetX;
    // 记录上一次的偏移量
    _lastOffsetX = curOffsetX;
    
    // 加上两个偏移量的值
    _guideView.x += 2 * offsetX;
    _guideLargetView.x += 2 * offsetX;
    _guideSmallView.x += 2 * offsetX;
    
    
    // 利用动画再减去一个偏移量这样就有了滑动效果
    [UIView animateWithDuration:0.3 animations:^{
        _guideView.x -= offsetX;
        _guideLargetView.x -=  offsetX;
        _guideSmallView.x -= offsetX;
    }];
    
    // 通过偏移量计算所有的当前图片
    int index = curOffsetX / self.view.width + 1;
    
    _guideView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d",index]];
    _guideLargetView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%d",index]];
    _guideSmallView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%d",index]];
}

#define kCount 4

#pragma mark - collectionView的数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 初始化cell
    SAMGuideViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    
    cell.image = [UIImage imageNamed:imageName];
    
    [cell setUpStratLearningBtnAtIndexPath:indexPath count:kCount];
    
    return cell;
}

@end
