//
//  AWNavigationMenuView.m
//  AWNavigationMenuViewDemo
//
//  Created by AlanWong on 14-7-3.
//  Copyright (c) 2014年 Alan_Wong. All rights reserved.
//

#import "AWNavigationMenuView.h"
#import "AWNavigationMenuItem.h"
#import "AWNavigationMenuButton.h"
#import "AWTopActionToolbar.h"

#define AW_TITLE_PARTITION @"!@#$%^&*"

#define UIColorFromRGB(rgbValue)	[UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 \
green:((float)(((rgbValue) & 0x00FF00) >> 8))/255.0 \
blue:((float)((rgbValue) & 0x0000FF))/255.0 \
alpha:1.0]

@interface AWNavigationMenuView()<AWTopActionToolbarDelegate>
@property(nonatomic, retain) AWNavigationMenuButton *menuBtn;
@property(nonatomic, retain) AWTopActionToolbar *toolbar;
@property(nonatomic, retain) UIView *menuContainer;

@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) UIView *maskView;
@end
@implementation AWNavigationMenuView
@synthesize items = items_;
@synthesize menuBtn = menuBtn_;
@synthesize toolbar = toolbar_;
@synthesize menuContainer = menuContainer_;
@synthesize delegate = delegate_;
@synthesize currentIndex = currentIndex_;
@synthesize type = type_;
@synthesize title = title_;
@synthesize maskView = maskView_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        menuBtn_ = [[AWNavigationMenuButton alloc] initWithFrame:frame];
        [menuBtn_ addTarget:self action:@selector(menuBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuBtn_];
        type_ = kMenuTypeDefault;
        currentIndex_ = NSNotFound;
    
    }
    return self;
}

- (void)menuBtnTapped:(id)sender {
    self.menuBtn.isActive = !self.menuBtn.isActive;
    if (self.menuBtn.isActive) {
        [self onShowToolbar];
    } else {
        [self onHideToolbar];
   
    
    }
}


- (void)updateMenuTitle {
    
    AWNavigationMenuItem *item = [self.items objectAtIndex:currentIndex_];
    
    NSString *title = title_;
    if (!title)
        title = item.title;
    
    NSArray *titles = [title componentsSeparatedByString:AW_TITLE_PARTITION];
    if ([titles count]>1)
        title = [titles objectAtIndex:0];
    
    menuBtn_.buttonTitleLabel.text = title;
    
    UIImage *image = [UIImage imageNamed:item.iconImageName];
    menuBtn_.iconImageView.image = image;
    
}

- (void)setTitle:(NSString *)title
{
    if (title_) {
        title_ = nil;
    }
    
    title_ = title ;
}

- (void)setItems:(NSArray *)items index:(NSInteger)index
{
    if (items_){
        items = nil;
    }
    items_ = items;
    
    if (index <0 || index > [items count] - 1) {
        index = 0;
    }
    self.currentIndex = index;
    
    //初始化toolbar
    self.toolbar.dataSource = items;
    
    
}
- (void)onShowToolbar {
    self.toolbar.frame = CGRectMake(0, 0, self.menuContainer.bounds.size.width, 90);
    [self showMaskView];
    [self.menuContainer addSubview:self.toolbar];
    [self rotateArrow:M_PI];
    [self.toolbar show:nil];
    
}

- (void)displayMenuInView:(UIView *)view {
    self.menuContainer = view;
}
- (void)onHideToolbar {
    [self hideMaskView];
    [self.toolbar hide];
    [self rotateArrow:0];
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    if (currentIndex_ != currentIndex) {
        currentIndex_ = currentIndex;
        [self updateMenuTitle];
        
        self.toolbar.selectedIndex = currentIndex;
    }
}
- (void)setItems:(NSArray *)items {
    
    [self setItems:items index:0];
}


- (AWTopActionToolbar *) toolbar {
    if (!toolbar_) {
        toolbar_ =[[AWTopActionToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
        toolbar_.delegate = self;
    }
    return toolbar_;
}

- (void)rotateArrow:(float)degrees {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.menuBtn.arrowImageView.layer.transform = CATransform3DMakeRotation(degrees, 0, 0, 1);
    } completion:NULL];
}

- (UIView *)maskView {
    if (!maskView_) {
        maskView_ = [[UIView alloc] initWithFrame:CGRectZero];
        maskView_.backgroundColor = [UIColor blackColor];
        UIGestureRecognizer *grzr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuBtnTapped:)];
        [maskView_ addGestureRecognizer:grzr];
    }
    return maskView_;
}
- (void)hideNavigationToolBar {
    if(self.menuBtn.isActive) {
        [self menuBtnTapped:nil];
    }
}

- (void)showMaskView {
    if (self.menuContainer) {
        if (self.toolbar) {
            __block CGRect frame = self.menuContainer.bounds;
            self.maskView.frame = frame;
            [self.menuContainer addSubview:maskView_];
            [self.menuContainer bringSubviewToFront:self.maskView];
            self.maskView.hidden = NO;
            self.maskView.alpha = 0;
            
            [UIView animateWithDuration:0.5f animations:^(void) {
                //self.maskView.hidden = NO;
                self.maskView.alpha = 0.5f;
            }];
        }
    }
}

- (void)hideMaskView {
    if ([self.maskView superview]) {
        [UIView animateWithDuration:0.5f animations:^(void) {
            //self.maskView.hidden = NO;
            self.maskView.alpha = 0.0f;
        }completion:^(BOOL fisnished) {
            [self.maskView removeFromSuperview];
        }];
        
    }
}



#pragma mark - 
#pragma mark TopActionToolBar Delegate

- (void)topActionToolBar:(AWTopActionToolbar *)toolbar didSelectedAtIndex:(NSInteger)index {
    NSLog(@"tool bar did selected at %ld",index);
    [self menuBtnTapped:nil];
    self.currentIndex = index;
    if (delegate_ && [delegate_ respondsToSelector:@selector(didSelectedItemAtIndex:)]) {
        [delegate_ didSelectedItemAtIndex:index];
    }
}
@end
