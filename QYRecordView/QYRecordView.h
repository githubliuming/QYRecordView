//
//  QYRecordView.h
//  QYRecordView
//
//  Created by 明刘 on 16/8/27.
//  Copyright © 2016年 liuming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYRecordView;
@protocol QYRecordViewDelegate <NSObject>

- (void)startRecord:(QYRecordView *)view;
- (void)endRecord:(QYRecordView *) view;
@end
@interface QYRecordView : UIView

@property(nonatomic,strong)id<QYRecordViewDelegate>delegate;
/**
 *  动画图片
 */
@property(nonatomic,strong)UIImage * annimationImage;
/**
 *  动画时间
 */
@property(nonatomic,assign)CGFloat duration;
/**
 * 是否开启内部的单击手势
 */
@property(nonatomic,assign) BOOL supportTap;
/**
 *  是否开启内部的长按手势
 */
@property(nonatomic,assign) BOOL supportLongPress;

/**
 *  开始动画
 */
- (void) startAnimation;

/**
 *  结束动画
 */
- (void) endAanimation;
@end
