//
//  AWNavigationMenuButton.h
//  AWNavigationMenuViewDemo
//
//  Created by 黄伟彬 on 14-6-29.
//  Copyright (c) 2014年 Alan_Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AWNavigationMenuButton : UIButton

@property(nonatomic, retain)UIImageView *iconImageView;
@property(nonatomic, retain)UIImageView *arrowImageView;
@property(nonatomic, retain)UILabel *buttonTitleLabel;
@property(nonatomic, assign)BOOL isActive;

@end
