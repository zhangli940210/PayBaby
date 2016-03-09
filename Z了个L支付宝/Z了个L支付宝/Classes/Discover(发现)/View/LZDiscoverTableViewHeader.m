//
//  LZDiscoverTableViewHeader.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZDiscoverTableViewHeader.h"
#import "LZDiscoverTableViewHeaderItemButton.h"

@implementation LZDiscoverTableViewHeader


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setHeaderItemModelsArray:(NSArray *)headerItemModelsArray
{
    _headerItemModelsArray = headerItemModelsArray;
    
    [headerItemModelsArray enumerateObjectsUsingBlock:^(LZDiscoverTableViewHeaderItemModel *model, NSUInteger idx, BOOL *stop) {
            LZDiscoverTableViewHeaderItemButton *button = [[LZDiscoverTableViewHeaderItemButton alloc] init];
            button.tag = idx;
            button.title = model.title;
            button.imageName = model.imageName;
            [button addTarget:self action:@selector(buttonClickd:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.subviews.count == 0) return;
    CGFloat w = self.width / self.subviews.count;
    CGFloat h = self.height;
    [self.subviews enumerateObjectsUsingBlock:^(UIView *button, NSUInteger idx, BOOL *stop) {
        button.frame = CGRectMake(idx * w, 0, w, h);
    }];
}

- (void)buttonClickd:(LZDiscoverTableViewHeaderItemButton *)button
{
    if (self.buttonClickedOperationBlock) {
        self.buttonClickedOperationBlock(button.tag);
    }
}

@end


@implementation LZDiscoverTableViewHeaderItemModel

+ (instancetype)modelWithTitle:(NSString *)title imageName:(NSString *)imageName destinationControllerClass:(Class)destinationControllerClass
{
    LZDiscoverTableViewHeaderItemModel *model = [[LZDiscoverTableViewHeaderItemModel alloc] init];
    model.title = title;
    model.imageName = imageName;
    model.destinationControllerClass = destinationControllerClass;
    return model;
}

@end