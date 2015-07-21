//
//  SAMGuideTool.m
//  彩票
//
//  Created by 杨森 on 15/7/2.
//  Copyright (c) 2015年 samyang. All rights reserved.
//

#import "SAMGuideTool.h"

#import "SAMMainViewController.h"
#import "SAMNewFeatureViewController.h"

#define SAMVersion @"myVersion"
#import "SAMSaveTool.h"

@implementation SAMGuideTool

+ (UIViewController *)chooseRootViewController
{
    UITabBarController *tabBarVc = [[SAMMainViewController alloc] init];
    
    // 获取系统版本号
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    // 从沙盒中获取系统版本号
    NSString *oldVersion = [SAMSaveTool objectForKey:SAMVersion];
    
    UIViewController *rootVc = [[UIViewController alloc] init];
    
    if ([curVersion isEqualToString:oldVersion]) {
      
        rootVc  = tabBarVc;
        
    } else {
        
        rootVc = [[SAMNewFeatureViewController alloc] init];
        [SAMSaveTool setObject:curVersion forKey:SAMVersion];
        
    }
    
    return rootVc;
}

@end
