//
//  RootViewController.h
//  CCAnimation
//
//  Created by 周清城 on 2016/10/4.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (nonatomic, copy, nullable) NSString *navTitle;
@property (nonatomic, strong, nullable) UITableView *tableView;
@property(nonatomic, strong, nullable) UIImageView *backGroundImageview;

//添加毛玻璃效果
- (void)addEffectView;

@end
