//
//  RootViewController.m
//  CCAnimation
//
//  Created by 周清城 on 2016/10/4.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import "RootViewController.h"
//#import "config.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationItem.title = self.navTitle;
    
    [self setRootTableView];
}

- (void)addEffectView {
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, app_width, app_height)];
    icon.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:icon];
    
    //毛玻璃效果
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectView.frame = CGRectMake(0, 0, app_width, app_height);
    [icon addSubview:effectView];
    
    self.backGroundImageview = icon;

}

- (void)setRootTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, app_width, app_height) style:UITableViewStylePlain];
}

@end
