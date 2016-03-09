

#import "LZHomeViewController.h"
#import "UIView+LZExtension.h"
#import "LZHomeGridView.h"
#import "LZHomeGridItemModel.h"
#import "LZScanViewController.h"
#import "LZAddItemViewController.h"
#import "LZGridItemCacheTool.h"

#define kHomeHeaderViewHeight 110

@interface LZHomeViewController () <LZHomeGridViewDeleate>

@property (nonatomic, weak) UIView *headerView;
@property (nonatomic, weak) LZHomeGridView *mainView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation LZHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupHeader];
    [self setupMainView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGFloat tabbarHeight = [[self.tabBarController tabBar] height];
    
    CGFloat headerY = 0;
    headerY = ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) ? 64 : 0;
    _headerView.frame = CGRectMake(0, headerY, self.view.width, kHomeHeaderViewHeight);
    
    _mainView.frame = CGRectMake(0, _headerView.y + kHomeHeaderViewHeight, self.view.width, self.view.height - kHomeHeaderViewHeight - tabbarHeight);
}

#pragma mark - private actions

- (void)setupHeader
{
    UIView *header = [[UIView alloc] init];
    header.bounds = CGRectMake(0, 0, self.view.width, kHomeHeaderViewHeight);
    header.backgroundColor = [UIColor colorWithRed:(38 / 255.0) green:(42 / 255.0) blue:(59 / 255.0) alpha:1];
    [self.view addSubview:header];
    _headerView = header;
    
    UIButton *scan = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, header.width * 0.5, header.height)];
    [scan setImage:[UIImage imageNamed:@"home_scan"] forState:UIControlStateNormal];
    [scan addTarget:self action:@selector(scanButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [header addSubview:scan];
    
    UIButton *pay = [[UIButton alloc] initWithFrame:CGRectMake(scan.width, 0, header.width * 0.5, header.height)];
    [pay setImage:[UIImage imageNamed:@"home_pay"] forState:UIControlStateNormal];
    [header addSubview:pay];
    
    
}

- (void)scanButtonClicked
{
    LZBasicViewContoller *desVc = [[LZScanViewController alloc] init];
    [self.navigationController pushViewController:desVc animated:YES];
}

- (void)setupMainView
{
    LZHomeGridView *mainView = [[LZHomeGridView alloc] init];
    mainView.gridViewDelegate = self;
    mainView.showsVerticalScrollIndicator = NO;
    
    [self setupDataArray];
    mainView.gridModelsArray = _dataArray;
    
    // 模拟轮播图数据源
    mainView.scrollADImageURLStringsArray = @[@"http://ww3.sinaimg.cn/bmiddle/9d857daagw1er7lgd1bg1j20ci08cdg3.jpg",
                                              @"http://ww4.sinaimg.cn/bmiddle/763cc1a7jw1esr747i13xj20dw09g0tj.jpg",
                                              @"http://ww4.sinaimg.cn/bmiddle/67307b53jw1esr4z8pimxj20c809675d.jpg"];
    [self.view addSubview:mainView];
    _mainView = mainView;
}

- (void)setupDataArray
{
    NSArray *itemsArray = [LZGridItemCacheTool itemsArray];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *itemDict in itemsArray) {
        LZHomeGridItemModel *model = [[LZHomeGridItemModel alloc] init];
        model.destinationClass = [LZBasicViewContoller class];
        model.imageResString =[itemDict.allValues firstObject];
        model.title = [itemDict.allKeys firstObject];
        [temp addObject:model];
    }
    _dataArray = [temp copy];
}

#pragma mark - LZHomeGridViewDeleate

- (void)homeGrideView:(LZHomeGridView *)gridView selectItemAtIndex:(NSInteger)index
{
    LZHomeGridItemModel *model = _dataArray[index];
    UIViewController *vc = [[model.destinationClass alloc] init];
    vc.title = model.title;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)homeGrideViewmoreItemButtonClicked:(LZHomeGridView *)gridView
{
    LZAddItemViewController *addVc = [[LZAddItemViewController alloc] init];
    addVc.title = @"添加更多";
    [self.navigationController pushViewController:addVc animated:YES];
}

- (void)homeGrideViewDidChangeItems:(LZHomeGridView *)gridView
{
    [self setupDataArray];
}


@end
