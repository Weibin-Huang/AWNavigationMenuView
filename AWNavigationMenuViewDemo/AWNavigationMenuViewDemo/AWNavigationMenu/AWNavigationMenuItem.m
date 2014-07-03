//
//  AWNavigationMenuItem.m
//  AWNavigationMenuViewDemo
//
//  Created by AlanWong on 14-7-3.
//  Copyright (c) 2014年 Alan_Wong. All rights reserved.
//

#import "AWNavigationMenuItem.h"

@implementation AWNavigationMenuItem
@synthesize imageName = imageName_;
@synthesize selectedImageName = selectedImageName_;
@synthesize title = title_;
@synthesize iconImageName = iconImageName_;
+(AWNavigationMenuItem *)menuItemWithImageName:(NSString *)imageName
                             selectedImageName:(NSString *)selectedImageName
                                         title:(NSString *)title
                                 iconImageName:(NSString *)iconImageName
{
    AWNavigationMenuItem *item = [[AWNavigationMenuItem alloc] init];
    item.imageName = imageName;
    item.selectedImageName = selectedImageName;
    item.title = title;
    item.iconImageName = iconImageName;
    return item;
}
@end
