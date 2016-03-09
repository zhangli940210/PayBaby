//
//  LZAssetsTableViewController.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZAssetsTableViewController.h"
#import "LZAssetsTableViewControllerCell.h"
#import "LZAssetsTableViewControllerCellModel.h"
#import "LZAssetsTableViewHeader.h"

@interface LZAssetsTableViewController ()

@end

@implementation LZAssetsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 每一行的cell
    self.cellClass = [LZAssetsTableViewControllerCell class];
    // 添加数据
    [self setupModel];
    // 组数
    self.sectionsNumber = self.dataArray.count;
    
    LZAssetsTableViewHeader *header = [[LZAssetsTableViewHeader alloc] init];
    header.iconView.image = [UIImage imageNamed:@"tmall_icon"];
    self.tableView.tableHeaderView = header;
}

// 添加数据
- (void)setupModel
{
    // section 0 的model
//    LZAssetsTableViewControllerCellModel *model01 = [LZAssetsTableViewControllerCellModel modelWithTitle:@"余额宝" iconImageName:@"20000032Icon" destinationControllerClass:[LZYuEBaoTableViewController class]];
    
    LZAssetsTableViewControllerCellModel *model02 = [LZAssetsTableViewControllerCellModel modelWithTitle:@"招财宝" iconImageName:@"20000059Icon" destinationControllerClass:[LZBasicTableViewController class]];
    
    LZAssetsTableViewControllerCellModel *model03 = [LZAssetsTableViewControllerCellModel modelWithTitle:@"娱乐宝" iconImageName:@"20000077Icon" destinationControllerClass:[LZBasicTableViewController class]];
    
    // section 1 的model
    LZAssetsTableViewControllerCellModel *model11 = [LZAssetsTableViewControllerCellModel modelWithTitle:@"芝麻信用分" iconImageName:@"20000118Icon" destinationControllerClass:[LZBasicTableViewController class]];
    
    LZAssetsTableViewControllerCellModel *model12 = [LZAssetsTableViewControllerCellModel modelWithTitle:@"随身贷" iconImageName:@"20000180Icon" destinationControllerClass:[LZBasicTableViewController class]];
    
    LZAssetsTableViewControllerCellModel *model13 = [LZAssetsTableViewControllerCellModel modelWithTitle:@"我的保障" iconImageName:@"20000110Icon" destinationControllerClass:[LZBasicTableViewController class]];
    
    // section 2 的model
    LZAssetsTableViewControllerCellModel *model21 = [LZAssetsTableViewControllerCellModel modelWithTitle:@"爱心捐赠" iconImageName:@"09999978Icon" destinationControllerClass:[LZBasicTableViewController class]];
    
    self.dataArray = @[@[model02, model03],
                       @[model11, model12, model13],
                       @[model21]
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
