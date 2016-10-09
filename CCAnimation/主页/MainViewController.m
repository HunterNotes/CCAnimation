//
//  MainViewController.m
//  CCAnimation
//
//  Created by 周清城 on 2016/10/4.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewCell.h"
#import "TouchStarVC.h"

static NSString *identifier = @"MainViewCell";
@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

{
    NSArray *_titleArr;
    NSArray *_viewControllers;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    _titleArr = @[@"咻一咻", @"点赞", @"摇奖"];
    _viewControllers = @[@"XYXViewController", @"TouchStarVC", @"LotteryViewController"];
    
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
    RootViewController *vc = nil;
    if ([didSelectVCName isEqualToString:@"TouchStarVC"]) {
        vc = [[TouchStarVC alloc] initWithNibName:nil bundle:nil];
    }
    else {
        vc = [[NSClassFromString(didSelectVCName) alloc] init];
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
