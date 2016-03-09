//
//  LZAssetsTableViewHeader.h
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZAssetsTableViewHeader : UIView

/** 头像*/
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/** 昵称*/
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 账号*/
@property (weak, nonatomic) IBOutlet UILabel *accountLabel;
/** 余额*/
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
/** 银行卡*/
@property (weak, nonatomic) IBOutlet UILabel *bankCardLabel;

@end
