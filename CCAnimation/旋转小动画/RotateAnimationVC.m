//
//  RotateAnimationVC.m
//  CCAnimation
//
//  Created by nbcb on 2016/10/11.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import "RotateAnimationVC.h"
#import "BaseViewController.h"

@interface RotateAnimationVC ()
{
    BOOL _isSelected;
}
@property (nonatomic , strong) UIButton *button;
@property (nonatomic , strong) FTT_Roundview *romate;
@property (nonatomic , strong) NSMutableArray *datasource;

@end

@implementation RotateAnimationVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    FTT_Roundview *romate = [[FTT_Roundview alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    romate.center = self.view.center;
    self.romate = romate;
    _datasource = [NSMutableArray new];
//    romate.BtnBackgroudColor = [UIColor cyanColor];
//    romate.backgroundColor = [UIColor redColor];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"BtnList.plist" ofType:nil];
    NSArray *contentArray = [NSArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *item  in contentArray) {
        BtnModel *model = [[BtnModel alloc]init];
        [model setValuesForKeysWithDictionary:item];
        [_datasource addObject:model];
    }
    
    NSMutableArray *titleArray = [NSMutableArray new];
    NSMutableArray *imageArray = [NSMutableArray new];
    for (BtnModel *model  in _datasource) {
        [titleArray addObject:model.title];
        [imageArray addObject:model.image1];
    }
    
    [romate BtnType:FTT_RoundviewTypeCustom BtnWitch:100 adjustsFontSizesTowidth:YES msaksToBounds:YES conrenrRadius:50 image:imageArray TitileArray:titleArray titileColor:[UIColor blackColor]];
    __weak RotateAnimationVC *weakself = self;
    romate.back = ^(NSInteger num,NSString *name) {
        [weakself pushView:num name:name];
    };
    [self.view addSubview:romate];
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _button.center = self.view.center;
    _button.adjustsImageWhenHighlighted = NO;
    [_button setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [_button setImage:[UIImage imageNamed:@"button_sel"] forState:UIControlStateSelected];
    _isSelected = NO;
    _button.selected = _isSelected;
    _button.layer.cornerRadius = 50;
    [_button addTarget:self action:@selector(showItems:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button];
}

- (void)showItems:(UIButton *)sender {
    
    _isSelected = !_isSelected;
    _button.selected = _isSelected;
    [_romate show];
}

// 跳转界面
- (void)pushView:(NSInteger)num name:(NSString *)name {
    
    NSMutableArray *classArray = [NSMutableArray new];
    for (BtnModel *model  in _datasource) {
        [classArray addObject:model.className];
    }
    Class class = NSClassFromString(classArray[num]);
    BaseViewController *vc = [[class alloc]init];
    vc.title = name;
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
