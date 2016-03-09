//
//  LZAssetsTableViewControllerCellModel.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZAssetsTableViewControllerCellModel.h"

@implementation LZAssetsTableViewControllerCellModel

+ (instancetype)modelWithTitle:(NSString *)title iconImageName:(NSString *)iconImageName destinationControllerClass:(Class)destinationControllerClass
{
    LZAssetsTableViewControllerCellModel *model = [[LZAssetsTableViewControllerCellModel alloc] init];
    model.title = title;
    model.iconImageName = iconImageName;
    model.destinationControllerClass = destinationControllerClass;
    return model;
}

@end
