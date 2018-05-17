//
//  WWWaveProgressView.h
//  WWWavesView
//
//  Created by 王万鹏 on 2018/5/16.
//  Copyright © 2018年 王万鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWWaveProgressView : UIView

@property (nonatomic, weak,readonly) UIImageView *backgroundImageView; // 背景图片

@property (nonatomic, weak,readonly) UILabel *numberLabel;  // 数字

@property (nonatomic, weak,readonly) UILabel *unitLabel;    // 单位符号 ,可以没有

@property (nonatomic, weak,readonly) UILabel *explainLabel; // 单位名称 （分，正确率）

@property (nonatomic,assign) CGFloat percent; // 0~1

@property (nonatomic, assign) UIEdgeInsets  waveViewMargin;

- (void)startWave;

- (void)stopWave;

- (void)resetWave;

@end
