
#import "LZBasicViewContoller.h"

@implementation LZBasicViewContoller

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationItem.backBarButtonItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:5]} forState:UIControlStateNormal];
}

@end
