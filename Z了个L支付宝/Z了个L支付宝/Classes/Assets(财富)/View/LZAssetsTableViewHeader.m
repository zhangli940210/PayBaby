//
//  LZAssetsTableViewHeader.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZAssetsTableViewHeader.h"

@interface LZAssetsTableViewHeader ()



@end

@implementation LZAssetsTableViewHeader


- (instancetype)initWithFrame:(CGRect)frame
{
    LZAssetsTableViewHeader *header = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
    if (frame.size.width != 0) {
        header.frame = frame;
    }
    return header;
}

/**
 *  右侧箭头点击
 */
- (IBAction)rightTopButtonClicked {
    
}

/**
 *  左侧按钮点击
 */
- (IBAction)leftButtonClicked {
    
}

/**
 *  右侧按钮点击
 */
- (IBAction)rightButtonClicked {
    
}


@end
