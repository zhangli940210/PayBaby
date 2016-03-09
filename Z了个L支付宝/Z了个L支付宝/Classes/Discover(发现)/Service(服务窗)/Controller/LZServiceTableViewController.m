//
//  ServiceTableViewController.m
//  Z了个L支付宝
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZServiceTableViewController.h"
#import "LZServiceTableViewHeader.h"
#import "LZServiceTableViewCell.h"
#import "LZServiceTableViewCellModel.h"

@interface LZServiceTableViewController ()

@end

@implementation LZServiceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置刷新模式
    self.refreshMode = SDBasicTableViewControllerRefeshModeHeaderRefresh;
    // 设置行高
    self.tableView.rowHeight = 70;
    // 设置头部
    LZServiceTableViewHeader *header = [[LZServiceTableViewHeader alloc] init];
    header.height = 44;
    header.placeholderText = @"搜索服务窗";
    self.tableView.tableHeaderView = header;
    // 设置cell类型
    self.cellClass = [LZServiceTableViewCell class];
    // 添加数据
    [self setupModel];
}

/**
 *  添加数据
 */
- (void)setupModel
{
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 0; i < 12; i++) {
        LZServiceTableViewCellModel *model = [LZServiceTableViewCellModel modelWithTitle:[NSString stringWithFormat:@"服务提醒 -- %d", i] detailString:[NSString stringWithFormat:@"服务提醒摘要 -- %d", i] iconImageURLString:@"http://f.vip.duba.net/data/avatar//201309/9/328/137871226483UB.jpg"];
        [temp addObject:model];
    }
    self.dataArray = [temp copy];
}

#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZServiceTableViewCellModel *model = self.dataArray[indexPath.row];
    UIViewController *vc = [[LZBasicTableViewController alloc] init];
    vc.title = model.title;
    [self.navigationController pushViewController:vc animated:YES];
}

// 开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.tableView endEditing:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath

{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    // 三个方法并用，实现自定义分割线效果
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = insets;
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:insets];
    }
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}


#pragma mark - pull down refresh

- (void)pullDownRefreshOperation
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.refreshControl endRefreshing];
    });
}

@end
