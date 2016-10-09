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
    __weak IBOutlet ZView *_levelView;
}

@end

@implementation TouchStarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    //代码初始化
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
        make.left.equalTo(self.view).mas_offset(145);
        make.top.equalTo(self.view).mas_offset(150);
        make.size.mas_equalTo(CGSizeMake(_levelView.frame.size.width, _levelView.frame.size.height));
    }];
    
    //storyboard生成
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
