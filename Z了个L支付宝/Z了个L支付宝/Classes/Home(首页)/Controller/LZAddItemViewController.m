//
//  LZAddItemViewController.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZAddItemViewController.h"
#import "LZAddItemGridView.h"
#import "LZHomeGridItemModel.h"

@interface LZAddItemViewController ()

@property (nonatomic, weak) LZAddItemGridView *mainView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation LZAddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMainView];
    
}

- (void)setupMainView
{
    LZAddItemGridView *mainView = [[LZAddItemGridView alloc] initWithFrame:self.view.bounds];
    mainView.showsVerticalScrollIndicator = NO;
    
    NSArray *titleArray = @[@"淘宝",
                            @"生活缴费",
                            @"教育缴费",
                            @"红包",
                            @"物流",
                            @"信用卡",
                            @"转账",
                            @"爱心捐款",
                            @"彩票",
                            @"当面付",
                            @"余额宝",
                            @"AA付款",
                            @"国际汇款",
                            @"淘点点",
                            @"淘宝电影",
                            @"亲密付",
                            @"股市行情",
                            @"汇率换算",
                            ];
    
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 0; i < 18; i++) {
        LZHomeGridItemModel *model = [[LZHomeGridItemModel alloc] init];
        model.destinationClass = [LZBasicViewContoller class];
        model.imageResString = [NSString stringWithFormat:@"i%02d", i];
        model.title = titleArray[i];
        [temp addObject:model];
    }
    
    _dataArray = [temp copy];
    mainView.gridModelsArray = [temp copy];
    
    [self.view addSubview:mainView];
    _mainView = mainView;
}


@end
