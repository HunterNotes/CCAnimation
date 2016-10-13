//
//  UINavigationController+Category.m
//  CCAnimation
//
//  Created by nbcb on 2016/10/13.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import "UINavigationController+Category.h"

@implementation UINavigationController (Category)

- (void)pushViewController:(UIViewController *)vc transitionFromView:(UIView *)fromView animationType:(UIViewAnimationOptions)animation {

    [UIView transitionFromView:fromView toView:vc.view duration:0.1 options:animation completion:^(BOOL finished) {
        
    }];
    [self pushViewController:vc animated:YES];
}

@end
