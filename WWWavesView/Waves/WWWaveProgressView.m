//
//  WWWaveProgressView.m
//  WWWavesView
//
//  Created by 王万鹏 on 2018/5/16.
//  Copyright © 2018年 王万鹏. All rights reserved.
//

#import "WWWaveProgressView.h"
#import "WWWaterWaveView.h"

@interface WWWaveProgressView ()

@property (nonatomic, weak,readwrite) UIImageView *backgroundImageView;
@property (nonatomic, weak) WWWaterWaveView *waterWaveView;
@property (nonatomic, weak,readwrite) UILabel *numberLabel;
@property (nonatomic, weak,readwrite) UILabel *explainLabel;
@property (nonatomic, weak,readwrite) UILabel *unitLabel;

@end


@implementation WWWaveProgressView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    [self addBackgroudImageView];
    [self addWaterWaveView];
    [self addNumberlabel];
    [self addUnitLabel];
    [self addExplainLabel];
}

- (void)addBackgroudImageView
{
    UIImageView *backgroundImageView = [[UIImageView alloc]init];
    [self addSubview:backgroundImageView];
    _backgroundImageView = backgroundImageView;
}

- (void)addWaterWaveView
{
    WWWaterWaveView *waterWaveView = [[WWWaterWaveView alloc]init];
    [self addSubview:waterWaveView];
    _waterWaveView = waterWaveView;
}

- (void)addNumberlabel
{
    UILabel *numberLabel = [[UILabel alloc]init];
    numberLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:numberLabel];
    _numberLabel = numberLabel;
}

- (void)addUnitLabel
{
    UILabel *unitLabel = [[UILabel alloc]init];
    [self addSubview:unitLabel];
    _unitLabel = unitLabel;
}

- (void)addExplainLabel
{
    UILabel *explainLabel = [[UILabel alloc]init];
    explainLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:explainLabel];
    _explainLabel = explainLabel;
    
}

- (void)startWave
{
    if (_numberLabel.text) {
        if (_percent >= 0) {
            _waterWaveView.percent = _percent;
            [_waterWaveView startWave];
        }else{
            [self resetWave];
        }
    }
}

- (void)stopWave
{
    [_waterWaveView stopWave];
}

- (void)resetWave
{
    [_waterWaveView reset];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat viewHeight = CGRectGetHeight(self.frame);
    CGFloat viewWidth = CGRectGetWidth(self.frame);
    
    _backgroundImageView.frame = self.bounds;
    
    _waterWaveView.frame = CGRectMake(_waveViewMargin.left, _waveViewMargin.top, viewWidth-_waveViewMargin.left-_waveViewMargin.right, viewHeight - _waveViewMargin.top - _waveViewMargin.bottom);
    
    _waterWaveView.layer.cornerRadius = MIN(CGRectGetHeight(_waterWaveView.frame)/2, CGRectGetWidth(_waterWaveView.frame)/2);
    
    CGFloat numberLabelWidth = viewWidth * 2/3;
    CGFloat numberLabelHeight = _numberLabel.font.pointSize + 2;
    
    CGFloat explainLabelWidth = viewWidth * 3/4;
    CGFloat explainLabelHeight = _explainLabel.font.pointSize;
    
    _numberLabel.frame = CGRectMake((viewWidth - numberLabelWidth)/2, (viewHeight - numberLabelHeight - explainLabelHeight)/2, numberLabelWidth, numberLabelHeight);
    
    if (_unitLabel.text.length > 0) {
        _unitLabel.frame = CGRectMake(viewWidth * 0.7, CGRectGetMinY(_numberLabel.frame)*1.2, _unitLabel.font.pointSize*3, _unitLabel.font.pointSize);
    } else{
        _unitLabel.frame = CGRectZero;
    }
    
    _explainLabel.frame = CGRectMake((viewWidth - explainLabelWidth)/2, CGRectGetMaxY(_numberLabel.frame)-numberLabelHeight/30, explainLabelWidth, explainLabelHeight);
}

- (void)dealloc{
    // 很重要 否则wave不能释放
    [self stopWave];
}

@end
