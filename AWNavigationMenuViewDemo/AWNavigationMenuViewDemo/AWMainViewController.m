//
//  AWMainViewController.m
//  AWNavigationMenuViewDemo
//
//  Created by AlanWong on 14-7-3.
//  Copyright (c) 2014年 Alan_Wong. All rights reserved.
//

#import "AWMainViewController.h"
#import "AWNavigationMenu/AWNavigationMenuView.h"
#import "AWNavigationMenuItem.h"
@interface AWMainViewController ()<AWNavigationMenuViewDelegate>
@property (nonatomic,retain) UILabel * label;
@end

@implementation AWMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.view.backgroundColor = [UIColor whiteColor];
   // self.title = @"测试";
    [self setupMenuView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setupMenuView{
    NSLog(@"%f %f",self.view.frame.origin.x,self.view.frame.origin.y);
    
    NSLog(@"%f %f",self.view.frame.size.width,self.view.frame.size.height);
    if(self.navigationItem) {
        CGRect rect = CGRectMake(0.0f, 0.0f, 200.0f, self.navigationController.navigationBar.bounds.size.height);
        AWNavigationMenuView *menuView = [[AWNavigationMenuView alloc] initWithFrame: rect];
        
        //公司动态
        AWNavigationMenuItem *itemCompany = [AWNavigationMenuItem menuItemWithImageName:@"top_toolbar_company_normal" selectedImageName:@"top_toolbar_company_selected" title:@"动态" iconImageName:@"title_view_icon_company" ];
        
        //我的关注
        AWNavigationMenuItem *itemFollow = [AWNavigationMenuItem menuItemWithImageName:@"top_toolbar_follow_normal" selectedImageName:@"top_toolbar_follow_selected" title:@"关注" iconImageName:@"title_view_icon_follow" ];
        //热门讨论
        AWNavigationMenuItem *itemHot = [AWNavigationMenuItem menuItemWithImageName:@"top_toolbar_hot_normal" selectedImageName:@"top_toolbar_hot_selected" title:@"小心" iconImageName:@"title_view_icon_hot" ];
        //企业公告
        
        AWNavigationMenuItem *itemBulletin = [AWNavigationMenuItem menuItemWithImageName:@"top_toolbar_bulletin_normal" selectedImageName:@"top_toolbar_bulletin_selected" title:@"欢乐"iconImageName:@"title_view_icon_bulletin" ];
        
        menuView.delegate = self;
        [menuView setItems:@[itemCompany,itemFollow,itemHot,itemBulletin] index:0];
        [menuView displayMenuInView:self.view];
        
        self.navigationItem.titleView = menuView;
    }

}
#pragma mark - 
#pragma mark NavigationMenuView Delegate
-(void)didSelectedItemAtIndex:(NSUInteger)index{
    NSLog(@"MenuView did selected at %ld",index);
}
@end
