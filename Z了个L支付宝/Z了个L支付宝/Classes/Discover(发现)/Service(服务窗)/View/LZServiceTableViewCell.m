//
//  LZServiceTableViewCell.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZServiceTableViewCell.h"
#import "LZServiceTableViewCellModel.h"
#import "UIImageView+WebCache.h"

@implementation LZServiceTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    LZServiceTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    cell.iconView.layer.cornerRadius = 4;
    cell.iconView.clipsToBounds = YES;
    
    return cell;
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
    LZServiceTableViewCellModel *cellModel = (LZServiceTableViewCellModel *)model;
    
    self.titleLabel.text = cellModel.title;
    self.detailLabel.text = cellModel.detailString;
    [self.iconView setImageWithURL:[NSURL URLWithString:cellModel.iconImageURLString] placeholderImage:nil];
}

@end
