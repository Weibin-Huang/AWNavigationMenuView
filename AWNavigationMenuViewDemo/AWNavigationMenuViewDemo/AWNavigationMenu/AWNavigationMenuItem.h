//
//  AWNavigationMenuItem.h
//  AWNavigationMenuViewDemo
//
//  Created by AlanWong on 14-7-3.
//  Copyright (c) 2014年 Alan_Wong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AWNavigationMenuItem : NSObject
@property(nonatomic,copy)NSString *imageName;
@property(nonatomic,copy)NSString *selectedImageName;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *iconImageName;
+ (AWNavigationMenuItem *)menuItemWithImageName:(NSString *)imageName
                              selectedImageName:(NSString *)selectedImageName
                                          title:(NSString *)title
                                  iconImageName:(NSString *)iconImageName;

@end
