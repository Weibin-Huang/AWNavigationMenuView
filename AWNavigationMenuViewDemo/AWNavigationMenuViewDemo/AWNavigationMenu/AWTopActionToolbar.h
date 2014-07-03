//
//  AWTopActionToolbar.h
//  AWNavigationMenuViewDemo
//
//  Created by AlanWong on 14-7-3.
//  Copyright (c) 2014年 Alan_Wong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AWTopActionToolbar;
@protocol AWTopActionToolbarDelegate <NSObject>

- (void) topActionToolBar:(AWTopActionToolbar * )toolbar didSelectedAtIndex:(NSInteger)index;

@end
@interface AWTopActionToolbar : UIView
@property(nonatomic,retain)NSArray * dataSource;
@property(nonatomic,assign)id<AWTopActionToolbarDelegate>delegate;
@property(nonatomic,assign)NSInteger selectedIndex;

- (void)hide;
- (void)show:(void(^)(void))completionBlock;

@end
