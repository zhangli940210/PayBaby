//
//  LZServiceTableViewCellModel.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZServiceTableViewCellModel.h"

@implementation LZServiceTableViewCellModel

+ (instancetype)modelWithTitle:(NSString *)title detailString:(NSString *)detailString iconImageURLString:(NSString *)iconImageURLString
{
    LZServiceTableViewCellModel *model = [[LZServiceTableViewCellModel alloc] init];
    model.title = title;
    model.detailString = detailString;
    model.iconImageURLString = iconImageURLString;
    return model;
}

@end
