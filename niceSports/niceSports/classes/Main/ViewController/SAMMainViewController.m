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
    
    [self test];

}

- (void)test{
    NSArray *familyNames =[[NSArray alloc]initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    NSLog(@"[familyNames count]===%lu",(unsigned long)[familyNames count]);
    for(indFamily=0;indFamily<[familyNames count];++indFamily)
        
    {
        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
        fontNames =[[NSArray alloc]initWithArray:[UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indFamily]]];
        
        for(indFont=0; indFont<[fontNames count]; ++indFont)
            
        {
            NSLog(@"Font name: %@",[fontNames objectAtIndex:indFont]);
            
        }
    
    }

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
    
//    // 发现
//    UIStoryboard *storyborad = [UIStoryboard storyboardWithName:@"SAMDiscoverViewController" bundle:nil];
//    SAMDiscoverViewController *discover = [storyborad instantiateInitialViewController];
//    [self setUpOneChildViewController:discover image:[UIImage imageWithOriRenderingImage:@"TabBar_Discovery_new"] selImage:[UIImage imageWithOriRenderingImage:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
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
