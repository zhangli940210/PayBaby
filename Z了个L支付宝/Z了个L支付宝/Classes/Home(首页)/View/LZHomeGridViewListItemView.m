

#import "LZHomeGridViewListItemView.h"
#import "LZHomeGridItemModel.h"
#import "UIButton+WebCache.h"
#import "LZHomeGridViewListItemViewButton.h"

@implementation LZHomeGridViewListItemView


{
    LZHomeGridViewListItemViewButton *_button;
    UIButton *_iconView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}

- (void)initialization
{
    self.backgroundColor = [UIColor whiteColor];
    
    LZHomeGridViewListItemViewButton *button = [[LZHomeGridViewListItemViewButton alloc] init];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    _button = button;
    
    UIButton *icon = [[UIButton alloc] init];
    [icon setImage:[UIImage imageNamed:@"Home_delete_icon"] forState:UIControlStateNormal];
    [icon addTarget:self action:@selector(iconViewClicked) forControlEvents:UIControlEventTouchUpInside];
    icon.hidden = YES;
    [self addSubview:icon];
    _iconView = icon;
    
    UILongPressGestureRecognizer *longPressed = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(itemLongPressed:)];
    [self addGestureRecognizer:longPressed];
}

#pragma mark - actions

- (void)itemLongPressed:(UILongPressGestureRecognizer *)longPressed
{
    if (self.itemLongPressedOperationBlock) {
        self.itemLongPressedOperationBlock(longPressed);
    }
}

- (void)buttonClicked
{
    if (self.buttonClickedOperationBlock) {
        self.buttonClickedOperationBlock(self);
    }
}

- (void)iconViewClicked
{
    if (self.iconViewClickedOperationBlock) {
        self.iconViewClickedOperationBlock(self);
    }
}

#pragma mark - properties

- (void)setItemModel:(LZHomeGridItemModel *)itemModel
{
    _itemModel = itemModel;
    
    if (itemModel.title) {
        [_button setTitle:itemModel.title forState:UIControlStateNormal];
    }
    
    if (itemModel.imageResString) {
        if ([itemModel.imageResString hasPrefix:@"http:"]) {
            [_button setImageWithURL:[NSURL URLWithString:itemModel.imageResString] forState:UIControlStateNormal placeholderImage:nil];
        } else {
            [_button setImage:[UIImage imageNamed:itemModel.imageResString] forState:UIControlStateNormal];
        }
    }
    
}

- (void)setHidenIcon:(BOOL)hidenIcon
{
    _hidenIcon = hidenIcon;
    _iconView.hidden = hidenIcon;
}

- (void)setIconImage:(UIImage *)iconImage
{
    _iconImage = iconImage;
    
    [_iconView setImage:iconImage forState:UIControlStateNormal];
}

#pragma mark - life circles

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 10;
    _button.frame = self.bounds;
    _iconView.frame = CGRectMake(self.width - _iconView.width - margin, margin, 20, 20);
}

@end
