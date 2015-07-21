//
//  SAMSaveTool.m
//  彩票
//
//  Created by 杨森 on 15/7/2.
//  Copyright (c) 2015年 samyang. All rights reserved.
//

#import "SAMSaveTool.h"

@implementation SAMSaveTool

+ (id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}

@end
