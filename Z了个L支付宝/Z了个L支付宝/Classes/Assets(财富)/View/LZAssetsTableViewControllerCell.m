//
//  LZAssetsTableViewControllerCell.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZAssetsTableViewControllerCell.h"
#import "LZAssetsTableViewControllerCellModel.h"

@implementation LZAssetsTableViewControllerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.textLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
    LZAssetsTableViewControllerCellModel *cellModel = (LZAssetsTableViewControllerCellModel *)model;
    
    self.textLabel.text = cellModel.title;
    self.imageView.image = [UIImage imageNamed:cellModel.iconImageName];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}


@end
