//
//  CheckViewController.h
//  CCAnimation
//
//  Created by nbcb on 2016/10/12.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
@class GradientView, CLLocation;

typedef void(^ClickSignBtn)(BOOL isSignSuccess);

@interface CheckViewController : RootViewController

@property (strong, nonatomic) GradientView *gradientView;
@property (assign, nonatomic) int signCount;
@property (strong, nonatomic) CLLocation *signLocation;
@property (strong, nonatomic) ClickSignBtn clickSignBtn;

@end
