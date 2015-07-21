//
//  SAMNavigationController.m
//  niceSports
//
//  Created by 杨森 on 15/7/21.
//  Copyright (c) 2015年 samyang. All rights reserved.
//

#import "SAMNavigationController.h"

@interface SAMNavigationController ()

@end

@implementation SAMNavigationController


#pragma mark - 当前类或者子类第一次初始化的时候调用
+ (void)initialize
{
    //获取使用这个类的所有导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    /**
     *  BarMetrics:  一定要选择Default
     */
    [bar setBackgroundImage:[UIImage imageNamed:@"topactbar_bg"] forBarMetrics:UIBarMetricsDefault];

    //设置导航条标题颜色 (复文本）
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleAttr[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [bar setTitleTextAttributes:titleAttr];
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


@end
