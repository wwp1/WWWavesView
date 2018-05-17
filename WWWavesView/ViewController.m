//
//  ViewController.m
//  WWWavesView
//
//  Created by 王万鹏 on 2018/5/16.
//  Copyright © 2018年 王万鹏. All rights reserved.
//

#import "ViewController.h"
#import "WWWaterWaveView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CGFloat kHeightRates = [[UIScreen mainScreen] bounds].size.height == 812.0 ?  1: [[UIScreen mainScreen] bounds].size.height/667;
    
    WWWaterWaveView *waterWaveView = [[WWWaterWaveView alloc]initWithFrame:CGRectMake(0, 218*kHeightRates, self.view.frame.size.width, 37)];
    //第一个波浪颜色
    waterWaveView.firstWaveColor = [UIColor colorWithRed:0.87 green:0.87 blue:0.87 alpha:0.30];
    //第二个波浪颜色
    waterWaveView.secondWaveColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:0.30];
    // 百分比
    waterWaveView.percent = 0.6;
    [self.view addSubview:waterWaveView];
    [waterWaveView startWave];
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, waterWaveView.frame.size.height + waterWaveView.frame.origin.y, self.view.frame.size.width, 200)];
    view.backgroundColor = [UIColor colorWithRed:0.87 green:0.87 blue:0.87 alpha:0.40];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}


@end
