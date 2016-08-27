//
//  ViewController.m
//  QYRecordView
//
//  Created by 明刘 on 16/8/27.
//  Copyright © 2016年 liuming. All rights reserved.
//

#import "ViewController.h"
#import "QYRecordView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet QYRecordView *recordView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

@end
