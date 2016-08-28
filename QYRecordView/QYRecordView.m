//
//  QYRecordView.m
//  QYRecordView
//
//  Created by 明刘 on 16/8/27.
//  Copyright © 2016年 liuming. All rights reserved.
//

#import "QYRecordView.h"

#define QY_Progress_ImageName @"progress"
#define QY_Record_MicroPhone_ImageName @"microphone"
#define Scale 0.1f
@interface QYRecordView ()
@property(nonatomic,strong) CALayer * anmationLayer; //动画层
@property(nonatomic,strong) UIImageView * imageView;
@property(nonatomic,assign) BOOL isAnimation;
@end
@implementation QYRecordView
- (instancetype) init{

    self = [super init];
    if (self) {
        
        [self initSubView];
    }
    
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self initSubView];
    }
    
    return self;
}

- (void) awakeFromNib{

    [self initSubView];
}

- (void) initSubView{

    self.anmationLayer = [[CALayer alloc] init];
    self.anmationLayer.frame = self.bounds;
    self.anmationLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:QY_Progress_ImageName].CGImage);
    [self.layer addSublayer:self.anmationLayer];
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:QY_Record_MicroPhone_ImageName]];
    self.imageView.userInteractionEnabled = YES;
    [self addSubview:self.imageView];
    //添加单点手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapActionHandler:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap];
    //长按手势
    UILongPressGestureRecognizer *longPressTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressTapHandler:)];
    [self addGestureRecognizer:longPressTap];
    
}
- (void)setDuration:(CGFloat)duration{

    _duration = duration;
    self.anmationLayer.duration = _duration;
}
- (void) setAnnimationImage:(UIImage *)annimationImage{

    _annimationImage = annimationImage;
    self.anmationLayer.contents = (__bridge id _Nullable)(_annimationImage.CGImage);
}
- (void) startAnimation{
    self.isAnimation = YES;
    CABasicAnimation* rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI)];
    rotationAnimation.duration = 1.0f;
    rotationAnimation.repeatCount = NSIntegerMax;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.anmationLayer addAnimation:rotationAnimation forKey:@"rotation"]  ;
    if (self.delegate && [self.delegate respondsToSelector:@selector(startRecord:)]) {
        
        [self.delegate startRecord:self];
    }
    

}
- (void) endAanimation{

    self.isAnimation = NO;
    [self.anmationLayer removeAnimationForKey:@"rotation"];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(endRecord:)]) {
        [self.delegate endRecord:self];
    }
}
- (void)layoutSubviews{

    [super layoutSubviews];
    self.anmationLayer.frame = self.bounds;
    double width = self.bounds.size.width *(1- 2 *Scale) ;
    double margin = self.bounds.size.width * Scale;
    self.imageView.frame = CGRectMake(margin, margin, width, width);
    
}
- (void)tapActionHandler:(UITapGestureRecognizer *)tap{

    if (!self.supportTap) {
        
        return;
    }
    if (!self.isAnimation) {
        
        [self startAnimation];

    } else {
    
        [self endAanimation];
    }
    
}
- (void)longPressTapHandler:(UILongPressGestureRecognizer *)longPress{

    if (!self.supportLongPress) {
        
        return;
        
    }
    if (longPress.state == UIGestureRecognizerStateBegan) {
        [self startAnimation];
    }
    
    if (longPress.state == UIGestureRecognizerStateEnded || longPress.state == UIGestureRecognizerStateFailed || longPress.state == UIGestureRecognizerStateCancelled) {
        
        [self endAanimation];
    }
}
@end
