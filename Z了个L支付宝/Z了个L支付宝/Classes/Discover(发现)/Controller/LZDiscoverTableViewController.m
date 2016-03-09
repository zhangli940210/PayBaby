//
//  LZDiscoverTableViewController.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZDiscoverTableViewController.h"
#import "LZDiscoverTableViewHeader.h"
//#import "LZAssetsTableViewControllerCell.h"
#import "LZDiscoverTableViewControllerCell.h"
#import "LZAssetsTableViewControllerCellModel.h"

@interface LZDiscoverTableViewController ()

@property (nonatomic, strong) NSArray *headerDataArray;

@end

@implementation LZDiscoverTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置cell类型
    self.cellClass = [LZDiscoverTableViewControllerCell class];
    // 设置头部
    [self setupHeader];
    // 添加数据
    [self setupModel];
    
    self.sectionsNumber = self.dataArray.count;
    
}

- (void)setupHeader
{
    LZDiscoverTableViewHeaderItemModel *model0 = [LZDiscoverTableViewHeaderItemModel modelWithTitle:@"红包" imageName:@"adw_icon_apcoupon_normal" destinationControllerClass:[LZBasicTableViewController class]];
    
    LZDiscoverTableViewHeaderItemModel *model1 = [LZDiscoverTableViewHeaderItemModel modelWithTitle:@"电子券" imageName:@"adw_icon_coupon_normal" destinationControllerClass:[LZBasicTableViewController class]];
    
    LZDiscoverTableViewHeaderItemModel *model2 = [LZDiscoverTableViewHeaderItemModel modelWithTitle:@"行程单" imageName:@"adw_icon_travel_normal" destinationControllerClass:[LZBasicTableViewController class]];
    
    LZDiscoverTableViewHeaderItemModel *model3 = [LZDiscoverTableViewHeaderItemModel modelWithTitle:@"会员卡" imageName:@"adw_icon_membercard_normal" destinationControllerClass:[LZBasicTableViewController class]];
    
    self.headerDataArray = @[model0, model1, model2, model3];
    
    
    LZDiscoverTableViewHeader *header = [[LZDiscoverTableViewHeader alloc] init];
    header.height = 90;
    header.headerItemModelsArray = self.headerDataArray;
    __weak typeof(self) weakSelf = self;
    header.buttonClickedOperationBlock = ^(NSInteger index){
        LZDiscoverTableViewHeaderItemModel *model = weakSelf.headerDataArray[index];
        UIViewController *vc = [[model.destinationControllerClass alloc] init];
        vc.title = model.title;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    self.tableView.tableHeaderView = header;
}

- (void)setupModel
{
    // section 0 的model
    LZAssetsTableViewControllerCellModel *model01 = [LZAssetsTableViewControllerCellModel modelWithTitle:@"淘宝电影" iconImageName:@"adw_icon_movie_normal" destinationControllerClass:[LZBasicTableViewController class]];
    
    LZAssetsTableViewControllerCellModel *model02 = [LZAssetsTableViewControllerCellModel modelWithTitle:@"快抢" iconImageName:@"adw_icon_flashsales_normal" destinationControllerClass:[LZBasicTableViewController class]];
    
    LZAssetsTableViewControllerCellModel *model03 = [LZAssetsTableViewControllerCellModel modelWithTitle:@"快的打车" iconImageName:@"adw_icon_taxi_normal" destinationControllerClass:[LZBasicTableViewController class]];
    
    // section 1 的model
    LZAssetsTableViewControllerCellModel *model11 = [LZAssetsTableViewControllerCellModel modelWithTitle:@"我的朋友" iconImageName:@"adw_icon_contact_normal" destinationControllerClass:[LZBasicTableViewController class]];
    
    self.dataArray = @[@[model01, model02, model03],
                       @[model11]
                       ];
}

#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZAssetsTableViewControllerCellModel *model = [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    UIViewController *vc = [[model.destinationControllerClass alloc] init];
    vc.title = model.title;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return (section == self.dataArray.count - 1) ? 10 : 0;
}

@end
