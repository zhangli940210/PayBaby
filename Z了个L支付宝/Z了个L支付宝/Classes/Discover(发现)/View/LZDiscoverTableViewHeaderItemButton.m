//
//  LZDiscoverTableViewHeaderItemButton.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZDiscoverTableViewHeaderItemButton.h"

@implementation LZDiscoverTableViewHeaderItemButton

// 代码创建的时候调用
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
// xib或者storyboard的时候调用
- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    // 设置文字普通状态下，为黑色
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 设置文字居中显示
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    // 设置文字字体大小
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    // 设置图片居中模式
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

//- (CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//    CGFloat x = contentRect.size.width * 0.2;
//    CGFloat y = contentRect.size.height * 0.15;
//    CGFloat w = contentRect.size.width - x * 2;
//    CGFloat h = contentRect.size.height * 0.5;
//    CGRect rect = CGRectMake(x, y, w, h);
//    return rect;
//}
//
//- (CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    CGRect rect = CGRectMake(0, contentRect.size.height * 0.65, contentRect.size.width, contentRect.size.height * 0.3);
//    return rect;
//}

// 代码约束
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.titleLabel.x > self.imageView.x) {
        
        CGRect titleRect = CGRectMake(0, self.size.height * 0.65, self.size.width, self.size.height * 0.3);
        self.titleLabel.frame = titleRect;
        
        CGFloat x = self.size.width * 0.2;
        CGFloat y = self.size.height * 0.15;
        CGFloat w = self.size.width - x * 2;
        CGFloat h = self.size.height * 0.5;
        CGRect imageRect = CGRectMake(x, y, w, h);
        self.imageView.frame = imageRect;
        
    }
    
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

@end
