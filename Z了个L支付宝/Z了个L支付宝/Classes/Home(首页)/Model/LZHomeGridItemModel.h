//
//  LZHomeGridItemModel.h
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZHomeGridItemModel : NSObject

/** 图片名称*/
@property (nonatomic, copy) NSString *imageResString;
/** 标题*/
@property (nonatomic, copy) NSString *title;
/** 要跳转到的类*/
@property (nonatomic, copy) Class destinationClass;

@end
