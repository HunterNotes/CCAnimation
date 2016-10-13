//
//  ChickViewController.m
//  LX_GridView
//
//  Created by chuanglong02 on 16/9/21.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ChickViewController.h"
#import "ShitGridViewController.h"

@interface ChickViewController ()

@end

@implementation ChickViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    LxButton *button =[LxButton LXButtonWithTitle:@"点我" titleFont:[UIFont systemFontOfSize:16.0] Image:nil backgroundImage:nil backgroundColor:nil titleColor:[UIColor blackColor] frame:CGRectMake(self.view.center.x, self.view.center.y, 100, 40)];
    [self.view addSubview:button];
    __weak ChickViewController *weakSelf = self;
    [button addClickBlock:^(UIButton *button) {
        ShitGridViewController *shitGrid =[[ShitGridViewController alloc] init];
        [weakSelf.navigationController pushViewController:shitGrid transitionFromView:self.view animationType:UIViewAnimationOptionTransitionCrossDissolve];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
