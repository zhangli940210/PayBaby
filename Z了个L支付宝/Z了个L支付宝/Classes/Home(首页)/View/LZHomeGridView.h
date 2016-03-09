//
//  LZHomeGridView.h
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  LZHomeGridView;

@protocol  LZHomeGridViewDeleate <NSObject>

@optional

- (void)homeGrideView:(LZHomeGridView *)gridView selectItemAtIndex:(NSInteger)index;
- (void)homeGrideViewmoreItemButtonClicked:( LZHomeGridView *)gridView;
- (void)homeGrideViewDidChangeItems:( LZHomeGridView *)gridView;

@end

@interface  LZHomeGridView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, weak) id< LZHomeGridViewDeleate> gridViewDelegate;
@property (nonatomic, strong) NSArray *gridModelsArray;
@property (nonatomic, strong) NSArray *scrollADImageURLStringsArray;

@end
