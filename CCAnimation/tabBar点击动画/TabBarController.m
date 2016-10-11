//
//  TabBarController.m
//  CCAnimation
//
//  Created by nbcb on 2016/10/11.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import "TabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
//#import "UIBarButtonItem+Category.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"tabBar点击动画";
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    firstVC.tabBarItem = [UIBarButtonItem itemWithNormalImg:@"tabbar_discover" title:@"导航"];
    UINavigationController *firstNA = [[UINavigationController alloc] initWithRootViewController:firstVC];
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.tabBarItem = [UIBarButtonItem itemWithNormalImg:@"tabbar_home" title:@"首页"];
    UINavigationController *secondNA = [[UINavigationController alloc] initWithRootViewController:secondVC];
    ThreeViewController *threeVC = [[ThreeViewController alloc] init];
    threeVC.tabBarItem = [UIBarButtonItem itemWithNormalImg:@"tabbar_Detection" title:@"发现"];
    UINavigationController *threeNA = [[UINavigationController alloc] initWithRootViewController:threeVC];
    FourViewController *fourVC = [[FourViewController alloc] init];
    fourVC.tabBarItem = [UIBarButtonItem itemWithNormalImg:@"tabbar_profile" title:@"我的"];
    UINavigationController *fourNA = [[UINavigationController alloc] initWithRootViewController:fourVC];
//    self.viewControllers = @[firstVC, secondVC, threeVC, fourVC];
    self.viewControllers = @[firstNA, secondNA, threeNA, fourNA];
    self.selectedIndex = 0;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    //        if (self.indexFlag != index) {
    [self animationWithIndex:index];
    //        }
}

// 动画
- (void)animationWithIndex:(NSInteger) index {
    
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.08;
    pulse.repeatCount = 1;
    pulse.autoreverses = YES;
    pulse.fromValue = [NSNumber numberWithFloat:0.7];
    pulse.toValue = [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
    
    //    self.indexFlag = index;
    
}

@end
