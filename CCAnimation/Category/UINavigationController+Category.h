//
//  UINavigationController+Category.h
//  CCAnimation
//
//  Created by nbcb on 2016/10/13.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Category)

- (void)pushViewController:(UIViewController *)vc transitionFromView:(UIView *)fromView animationType:(UIViewAnimationOptions)animation;

@end
