//
//  QYRecordView.h
//  QYRecordView
//
//  Created by 明刘 on 16/8/27.
//  Copyright © 2016年 liuming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYRecordView : UIView

/**
 *  @author 刘明
 *
 *  动画图片
 */
@property(nonatomic,strong)UIImage * annimationImage;
/**
 *  @author 刘明
 *
 *  动画时间
 */
@property(nonatomic,assign)CGFloat duration;
- (void) startAnimation;
- (void) endAanimation;
@end
