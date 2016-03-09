//
//  LZGridItemCacheTool.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZGridItemCacheTool.h"
#define kItemsArrayCacheKey @"ItemsArrayCacheKey"

@implementation LZGridItemCacheTool

+ (NSArray *)itemsArray
{
    // 从沙盒中取数据
    return [[NSUserDefaults standardUserDefaults] objectForKey:kItemsArrayCacheKey];
}

+ (void)saveItemsArray:(NSArray *)array
{
    [[NSUserDefaults standardUserDefaults] setObject:[array copy] forKey:kItemsArrayCacheKey];
    [[NSUserDefaults standardUserDefaults] synchronize]; // 立即写入
}

@end
