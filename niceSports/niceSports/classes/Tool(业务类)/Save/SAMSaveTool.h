//
//  SAMSaveTool.h
//  彩票
//
//  Created by 杨森 on 15/7/2.
//  Copyright (c) 2015年 samyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAMSaveTool : NSObject

+ (id)objectForKey:(NSString *)defaultName;

+ (void)setObject:(id)value forKey:(NSString *)defaultName;


@end
