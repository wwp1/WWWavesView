//
//  WWWaterWaveView.h
//  WWWavesView
//
//  Created by 王万鹏 on 2018/5/16.
//  Copyright © 2018年 王万鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWWaterWaveView : UIView

@property (nonatomic, strong)   UIColor *firstWaveColor;    // 第一个波浪颜色
@property (nonatomic, strong)   UIColor *secondWaveColor;   // 第二个波浪颜色
@property (nonatomic, assign)   CGFloat percent;            // 百分比

-(void) startWave;

-(void) stopWave;

-(void) reset;

@end
