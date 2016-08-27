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
    [self addSubview:self.imageView];

    
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
    
    CABasicAnimation* rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI)];
    rotationAnimation.duration = 1.0f;
    rotationAnimation.repeatCount = NSIntegerMax;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.anmationLayer addAnimation:rotationAnimation forKey:@"rotation"];
}
- (void) endAanimation{

    [self.anmationLayer removeAnimationForKey:@"rotation"];
}
- (void)layoutSubviews{

    [super layoutSubviews];
    double width = self.bounds.size.width *(1- 2 *Scale) ;
    double margin = self.bounds.size.width * Scale;
    self.imageView.frame = CGRectMake(margin, margin, width, width);
    
}
@end
