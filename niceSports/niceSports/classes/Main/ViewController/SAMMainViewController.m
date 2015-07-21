//
//  ViewController.m
//  niceSports
//
//  Created by 杨森 on 15/7/21.
//  Copyright (c) 2015年 samyang. All rights reserved.
//

#import "SAMMainViewController.h"

#import "SAMNavigationController.h"

#import "SAMDiscoverViewController.h"
#import "SAMActivityViewController.h"
#import "SAMMeViewController.h"
#import "SAMFriendsViewController.h"

@interface SAMMainViewController ()

@end

@implementation SAMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    [self setUpAllChildViewController];


}


#pragma mark - 添加所有子控制器
- (void)setUpAllChildViewController
{
    // 活动大厅
    SAMActivityViewController *activity = [[SAMActivityViewController alloc] init];
    
    [self setUpOneChildViewController:activity image:[UIImage imageWithOriRenderingImage:@"botbtn_activity"] selImage:[UIImage imageWithOriRenderingImage:@"botbtn_activity_on"] title:@"活动大厅"];
    
    
    // 发现
    SAMDiscoverViewController *discover = [[SAMDiscoverViewController alloc] init];
    
    [self setUpOneChildViewController:discover image:[UIImage imageWithOriRenderingImage:@"botbtn_find"] selImage:[UIImage imageWithOriRenderingImage:@"botbtn_find_on"] title:@"发现"];
    
    // 好友
    SAMFriendsViewController *friends = [[SAMFriendsViewController alloc] init];
    [self setUpOneChildViewController:friends image:[UIImage imageWithOriRenderingImage:@"botbtn_friend"] selImage:[UIImage imageWithOriRenderingImage:@"botbtn_friend_on"] title:@"好友"];
    
    // 我
    SAMMeViewController *me = [[SAMMeViewController alloc] init];
    [self setUpOneChildViewController:me image:[UIImage imageWithOriRenderingImage:@"botbtn_me"] selImage:[UIImage imageWithOriRenderingImage:@"botbtn_me_on"] title:@"我"];
}


#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image
                           selImage:(UIImage *)selImage title:(NSString *)title
{
    
    UINavigationController *nav = [[SAMNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
    vc.navigationItem.title = title;
    
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    //描述对应按钮的内容
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;

}

@end
