//
//  LotteryViewController.m
//  Lottery
//
//  Created by nbcb on 16/4/22.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import "LotteryViewController.h"
#import "Masonry.h"

@interface LotteryViewController ()<CAAnimationDelegate>

{
    NSString *_strPrise;
    CGSize   _size;
}

@property (nonatomic, strong) UILabel       *infoLabel;
@property (nonatomic, strong) UIButton      *button;
@property (nonatomic, strong) UIImageView   *turntable;
@property (nonatomic, strong) UIImageView   *handleView;
@property (nonatomic, strong) UIImageView   *popImageView;

@end

@implementation LotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _size = self.view.frame.size;
    
    //背景
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(0);
        make.top.equalTo(self.view).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(_size.width, _size.height));
    }];
    
    //抽奖转盘
    [self.view addSubview:self.turntable];
    [self.turntable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(15);
        make.bottom.equalTo(self.view).mas_offset(-50);
        make.size.mas_equalTo(CGSizeMake(_size.width - 30, _size.width - 30));
    }];
    
    //摇奖按钮
    [self.view addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.turntable);
        make.size.mas_equalTo(CGSizeMake(82, 82));
    }];
    
    //手指
    [self.view addSubview:self.handleView];
    [self.handleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.button).mas_offset(0);
        make.centerY.equalTo(self.button).mas_offset(-20);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    //摇奖信息
    [self.view addSubview:self.infoLabel];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).mas_offset(0);
        make.left.equalTo(self.view).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(_size.width, 25));
    }];
    self.infoLabel.hidden = YES;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        self.infoLabel = [[UILabel alloc] init];
        _infoLabel.backgroundColor = [UIColor clearColor];
        _infoLabel.textColor = [UIColor orangeColor];
        _infoLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _infoLabel;
}

- (UIButton *)button {
    if (!_button) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [_button setTitle:@"" forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor clearColor]];
        _button.layer.borderColor = [UIColor clearColor].CGColor;
        _button.layer.borderWidth = 1.0f;
        _button.layer.cornerRadius = 42.0f;
        _button.layer.masksToBounds = YES;
    }
    return _button;
}

- (UIImageView *)turntable {
    if (!_turntable) {
        self.turntable = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhuanpan"]];
    }
    return _turntable;
}

- (UIImageView *)handleView {
    if (!_handleView) {
        self.handleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hander"]];
    }
    return _handleView;
}

- (UIImageView *)popImageView {
    if (!_popImageView) {
        self.popImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"prise"]];
    }
    return _popImageView;
}

- (void)btnClick {
    
    self.infoLabel.hidden = NO;
    self.infoLabel.text = @"抽奖中.....";
    NSInteger angle = 0;
    NSInteger randomNum = arc4random() % 10;
    
    if (randomNum > 0 && randomNum <= 1) {
        angle = 30;
        _strPrise = @"一等奖";
    } else if (randomNum > 1 && randomNum <= 2) {
        angle = 60;
        _strPrise = @"二等奖";
    } else if (randomNum > 2 && randomNum <= 3) {
        angle = 180;
        _strPrise = @"三等奖";
    } else {
        angle = 240;
        _strPrise = @"没中奖";
    }
    self.button.enabled = NO;
    
    //旋转
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = @(angle * M_PI / 35);
    animation.duration = 1.0f;
    animation.cumulative = YES;
    animation.delegate = self;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.turntable.layer addAnimation:animation forKey:@"animation"];
    
    [self.view addSubview:self.popImageView];
    [self.popImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(_size.width / 2 - (_size.width - 300) / 2);
        make.bottom.equalTo(self.view).mas_offset(-(_size.width - 30 + 30));
        make.size.mas_equalTo(CGSizeMake(_size.width - 300, _size.width - 300));
    }];
    self.popImageView.hidden = YES;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [UIView animateWithDuration:2.0 animations:^{
        
        CGFloat scale = _size.width / (_size.width - 300);
        self.popImageView.hidden = NO;
        self.popImageView.transform = CGAffineTransformMakeScale(scale, scale);
        //改变中心点，上浮/下沉
        self.popImageView.center = CGPointMake(self.view.center.x, 125);
    } completion:^(BOOL finished) {
        
        self.infoLabel.text = [NSString stringWithFormat:@"中奖结果：%@", _strPrise];
        [self.popImageView removeFromSuperview];
        self.popImageView = nil;
        self.button.enabled = YES;
    }];
}

@end
