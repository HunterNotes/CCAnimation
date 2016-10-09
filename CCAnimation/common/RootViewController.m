//
//  RootViewController.m
//  CCAnimation
//
//  Created by 周清城 on 2016/10/4.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import "RootViewController.h"
#import "config.h"

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

- (void)setRootTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, app_width, app_height) style:UITableViewStylePlain];
}

@end
