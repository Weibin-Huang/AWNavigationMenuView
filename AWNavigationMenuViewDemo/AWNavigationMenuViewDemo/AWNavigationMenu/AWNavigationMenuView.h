//
//  AWNavigationMenuView.h
//  AWNavigationMenuViewDemo
//
//  Created by AlanWong on 14-7-3.
//  Copyright (c) 2014年 Alan_Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AWNavigationMenuItem;
@class AWNavigationMenuButton;
enum AWMenuType{
    kMenuTypeDefault = 1,
    KMenuTypeCommunity
};
typedef enum AWMenuType AWMenuType;

@protocol AWNavigationMenuViewDelegate <NSObject>

-(void)didSelectedItemAtIndex:(NSUInteger)index;

@end
@interface AWNavigationMenuView : UIView
@property(nonatomic,retain) NSArray * items;
@property(nonatomic,assign) id<AWNavigationMenuViewDelegate> delegate;
@property(nonatomic,assign) AWMenuType type;
@property(nonatomic,assign) NSInteger currentIndex;

- (void)setItems:(NSArray *)items index:(NSInteger)index;
- (void)setTitle:(NSString *)title;
- (void)displayMenuInView:(UIView *)view;
- (void)hideNavigationToolBar;
@end
