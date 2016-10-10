//
//  TouchStarVC.m
//  CCAnimation
//
//  Created by 周清城 on 2016/10/9.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import "TouchStarVC.h"
#import "ZView.h"
#import "Masonry.h"

@interface TouchStarVC ()
{
    ZView *_levelView;
}

@end

@implementation TouchStarVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _levelView = [[ZView alloc] init];
    [self.view addSubview:_levelView];
    [_levelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(135);
        make.top.offset(211);
        make.size.mas_equalTo(CGSizeMake(141, 24));
    }];
    
    //半星，带上浮效果
    ZView *view = [[ZView alloc] init];
    view.iconColor = [UIColor orangeColor];
    view.iconSize = CGSizeMake(20, 20);
    view.canScore = YES;
    view.animated = YES;
    view.level = 3.5;
    view.maxLevel = 5;
    [view setScoreBlock:^(float level) {
        NSLog(@"打分：%.1f", level);
    }];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(135);
        make.top.offset(150);
        make.size.mas_equalTo(CGSizeMake(141, 24));
    }];
    
    //整星，不带上浮效果
    _levelView.backgroundColor = [UIColor clearColor];
    _levelView.iconColor = [UIColor redColor];
    _levelView.canScore = YES;
    _levelView.levelInt = YES;
    _levelView.iconSize = CGSizeMake(20, 20);
    _levelView.iconFull = [UIImage imageNamed:@"lp_badge_star_full"];
    _levelView.iconHalf = [UIImage imageNamed:@"lp_badge_star_half"];
    _levelView.iconEmpty = [UIImage imageNamed:@"lp_badge_star_empty"];
    _levelView.level = 2.0;
    _levelView.maxLevel = 5;
    [_levelView setScoreBlock:^(float leve) {
        NSLog(@"点赞：%.1f", leve);
    }];

}

@end
