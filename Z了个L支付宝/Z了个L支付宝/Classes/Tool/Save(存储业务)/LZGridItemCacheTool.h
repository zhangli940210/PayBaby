//
//  LZGridItemCacheTool.h
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZGridItemCacheTool : NSObject

/** 获取数据*/
+ (NSArray *)itemsArray;

/** 保存数据*/
+ (void)saveItemsArray:(NSArray *)array;

@end
