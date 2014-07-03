//
//  AWNavigationMenuButton.m
//  AWNavigationMenuViewDemo
//
//  Created by 黄伟彬 on 14-6-29.
//  Copyright (c) 2014年 Alan_Wong. All rights reserved.
//

#import "AWNavigationMenuButton.h"

@implementation AWNavigationMenuButton
@synthesize buttonTitleLabel = buttonTitleLabel_;
@synthesize iconImageView = iconImageView_;
@synthesize arrowImageView = arrowImageView_;
@synthesize isActive = isActive_;

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        iconImageView_ = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:iconImageView_];
        
        frame.origin.y -= 2.0;
        buttonTitleLabel_ = [[UILabel alloc]initWithFrame:frame];
        buttonTitleLabel_.textAlignment = NSTextAlignmentCenter;
        buttonTitleLabel_.backgroundColor = [UIColor clearColor];
        buttonTitleLabel_.textColor = [UIColor whiteColor];
        buttonTitleLabel_.font = [UIFont boldSystemFontOfSize:20.0];
        [self addSubview:buttonTitleLabel_];
        
        UIImage * image = [UIImage imageNamed:@"title_view_arrow"];
        arrowImageView_ = [[UIImageView alloc]initWithImage:image];
        [self addSubview:arrowImageView_];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [iconImageView_ sizeToFit];
    [buttonTitleLabel_ sizeToFit];
    CGPoint center = [[[UIApplication sharedApplication].delegate window] center];
    center.y = CGRectGetHeight(self.bounds) * 5;
    buttonTitleLabel_.center = center;
    arrowImageView_.center = CGPointMake(CGRectGetMaxX(buttonTitleLabel_.frame) + 10, self.frame.size.height / 2);
    iconImageView_.center = CGPointMake(CGRectGetMinX(buttonTitleLabel_.frame) - CGRectGetMidX(iconImageView_.bounds) - 5,
                                        buttonTitleLabel_.center.y);
    
}
@end
