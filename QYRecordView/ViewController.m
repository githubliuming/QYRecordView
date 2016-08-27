//
//  ViewController.m
//  QYRecordView
//
//  Created by 明刘 on 16/8/27.
//  Copyright © 2016年 liuming. All rights reserved.
//

#import "ViewController.h"
#import "QYRecordView.h"
@interface ViewController ()<QYRecordViewDelegate>
@property (weak, nonatomic) IBOutlet QYRecordView *recordView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.recordView.delegate = self;
    self.recordView.supportTap = YES;
    self.recordView.supportLongPress = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startActionHandler:(id)sender {
    
    [self.recordView startAnimation];
}
- (IBAction)endActonHandler:(id)sender {
    [self.recordView endAanimation];
}


#pragma mark -QYRecordViewDelegate
- (void) endRecord:(QYRecordView *)view{

    NSLog(@"end record");
}
- (void)startRecord:(QYRecordView *)view{

    NSLog(@"start record");
}
@end
