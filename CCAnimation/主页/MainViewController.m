//
//  MainViewController.m
//  CCAnimation
//
//  Created by 周清城 on 2016/10/4.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewCell.h"
#import "TabBarController.h"
#import "CheckViewController.h"

static NSString *identifier = @"MainViewCell";
@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

{
    NSArray *_titleArr;
    NSArray *_viewControllers;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [self addEffectView];
    [super viewDidLoad];
    
    self.navTitle = @"动画";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    _titleArr = @[@"咻一咻", @"摇奖", @"TabBar点击动画", @"旋转小动画", @"签到", @"移动格子"];
    _viewControllers = @[@"XYXViewController", @"LotteryViewController", @"TabBarController", @"RotateAnimationVC", @"CheckViewController", @"ChickViewController"];
    
    [self registerCell];
}

- (void)registerCell {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MainViewCell" bundle:nil] forCellReuseIdentifier:identifier];
}

#pragma mark Tableview Method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.titleLabel.text = _titleArr[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    NSString *didSelectVCName = _viewControllers[section];
    
    if ([didSelectVCName isEqualToString:@"TabBarController"]) {
        TabBarController *vc = [[NSClassFromString(didSelectVCName) alloc] init];
        [UIView transitionFromView:self.view toView:vc.view duration:0.1 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        }];
        [self.navigationController pushViewController:vc transitionFromView:self.view animationType:UIViewAnimationOptionTransitionCrossDissolve];
    }
    else {
        RootViewController *vc = nil;
        if ([didSelectVCName isEqualToString:@"CheckViewController"]) {
            vc = [[CheckViewController alloc] initWithNibName:nil bundle:nil];
        }
        else {
            vc = [[NSClassFromString(didSelectVCName) alloc] init];
        }
        vc.navTitle = _titleArr[section];
        [self.navigationController pushViewController:vc transitionFromView:self.view animationType:UIViewAnimationOptionTransitionCrossDissolve];
    }
}

@end
