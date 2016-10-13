//
//  XYXViewController.m
//  CCAnimation
//
//  Created by nbcb on 16/4/20.
//  Copyright © 2016年 ZQC. All rights reserved.
//

#import "XYXViewController.h"

@interface XYXViewController () <CAAnimationDelegate>
{
    CALayer *_layer;
    CAAnimationGroup *_animaTionGroup;
    CADisplayLink *_disPlayLink;
}

@end

@implementation XYXViewController

- (void)viewDidLoad {
    
    [self addEffectView];

    [super viewDidLoad];
}

- (void)startAnimation {
    
    CALayer *layer = [CALayer layer];
    layer.cornerRadius = [UIScreen mainScreen].bounds.size.width / 2;
    layer.frame = CGRectMake(0, 0, layer.cornerRadius * 2, layer.cornerRadius * 2);
    layer.position = self.view.layer.position;
    UIColor *color = [UIColor colorWithRed:arc4random() % 10 * 0.1 green:arc4random() % 10 * 0.1 blue:arc4random() % 10 * 0.1 alpha:0.5];
    layer.backgroundColor = color.CGColor;
    [self.view.layer addSublayer:layer];
    
    
    /**
     *  CAAnimation：是一个抽象类。遵循CAMediaTiming协议和CAAction协议，CAAnimation有很多派生类：
     1.CATransition 提供渐变效果:(推拉push效果,消退fade效果,揭开reveal效果)。
     2.CAAnimationGroup 允许多个动画同时播放。
     3.CABasicAnimation 提供了对单一动画的实现。
     4.CAKeyframeAnimation 关键桢动画,可以定义行动路线。
     5.CAConstraint 约束类,在布局管理器类中用它来设置属性。
     6.CAConstraintLayoutManager 约束布局管理器,是用来将多个CALayer进行布局的.各个CALayer是通过名称来区分,而布局属性是通过CAConstraint来设置的。
     7.CATransaction 事务类,可以对多个layer的属性同时进行修改.它分隐式事务,和显式事务。
     */
    
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    //创建动画实例
    _animaTionGroup = [CAAnimationGroup animation];
    _animaTionGroup.delegate = self;
    //动画的持续时间
    _animaTionGroup.duration = 2.0f;
    //动画重复的时间
//    _animaTionGroup.repeatDuration = 1.0f;
    //设置是否动画完成后，动画效果从设置的layer上移除。默认为YES。
    _animaTionGroup.removedOnCompletion = YES;
    //是否重播，原动画的倒播
//    _animaTionGroup.autoreverses = YES;
    //重复次数
//    _animaTionGroup.repeatCount = NSNotFound;
    //控制动画运行的节奏
    _animaTionGroup.timingFunction = defaultCurve;
    
    //界限 bounds
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.fromValue = [NSValue valueWithCGRect:layer.bounds];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectZero];
    
    //透明度变化 opacity
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @1.0;
    opacityAnimation.toValue = @0.1;
    
    //    //旋转动画 transform.rotation
    //    CABasicAnimation* rotationAnimation =
    //    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转
    //    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 3];
    //    rotationAnimation.duration = 2.0f;
    //    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; //缓入缓出
    
    //位置移动 position
    //    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    //    animation.fromValue =  [NSValue valueWithCGPoint: layer.position];
    //    CGPoint toPoint = layer.position;
    //    toPoint.x += 180;
    //    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    
    //缩放动画 transform.scale.xy 沿xy轴方向
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.fromValue = @0.0;
    scaleAnimation.toValue = @1.0;
    scaleAnimation.duration = 2;

    /**
     *  CAKeyframeAnimation 重要属性
     1. path:这是一个CGPathRef对象，默认是空的，当我们创建好CAKeyframeAnimation的实例的时候，可以通过制定一个自己定义的path来让某一个物体按照这个路径进行动画。这个值默认是nil当其被设定的时候  values  这个属性就被覆盖
     2. values:一个数组，提供了一组关键帧的值，当使用path的 时候 values的值自动被忽略。下面是一个简单的例子  效果为动画的连续移动一个block到不同的位置
     
     关键帧动画的基础步骤
     1.决定你想要做动画的属性(例如,框架,背景,锚点,位置,边框,等等) 2.在动画对象值的区域中,指定开始,结束,和中间的值。这些都是你的关键帧
     3.使用 duration 这个字段指定动画的时间
     4.通常来讲,通过使用 times 这个字段,来给每帧动画指定一个时间。如果你没有指定这些,核心动画就会通过你在 values 这个字段指定的值分割出时间段。
     5.通常,指定时间功能来控制步调。 这些都是你需要做的。你创建你的动画和增加他们到层中。调用-addAnimation 就开始了动画。
     */
    
    CAKeyframeAnimation *opencityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opencityAnimation.duration = 2;
    opencityAnimation.values = @[@0.8, @0.4, @0];
    opencityAnimation.keyTimes = @[@0, @0.5, @1];
    opencityAnimation.removedOnCompletion = YES;
    
//    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    CGMutablePathRef path = CGPathCreateMutable();
//    positionAnimation.path = path;
    NSArray *animations = @[scaleAnimation,opencityAnimation];
    _animaTionGroup.animations = animations;
    
    //开始动画
    [layer addAnimation:_animaTionGroup forKey:nil];
    //    [layer addAnimation:_animaTionGroup forKey:@"animationGroup"];
    
    //对layer做操作
    [self performSelector:@selector(endAnimation:) withObject:layer afterDelay:1.5];
}

- (void)endAnimation:(CALayer *)layer {
    
    //去掉所有动画
    [layer removeFromSuperlayer];
    //去掉key动画
    //    [layer removeAnimationForKey:@"animationGroup"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    _disPlayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(delayAnimation)];
    _disPlayLink.frameInterval = 40;
    [_disPlayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)delayAnimation {
    
    [self startAnimation];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view.layer removeAllAnimations];
    [_disPlayLink invalidate];
    _disPlayLink = nil;
}

@end
