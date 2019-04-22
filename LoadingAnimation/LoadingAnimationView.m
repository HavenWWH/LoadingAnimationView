//
//  LoadingAnimationView.m
//  LoadingAnimation
//
//  Created by 吴文海 on 2019/4/22.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import "LoadingAnimationView.h"

#define LAYERCOUNT 3

@interface LoadingAnimationView ()

@property (nonatomic, strong) CALayer *baseLayer;
@property (nonatomic, strong) CAReplicatorLayer *replicatorLayer;

@property (nonatomic, assign) CGFloat widthAndHeight;
@property (nonatomic, assign) CGFloat maginW;
@end

@implementation LoadingAnimationView

- (instancetype)initWithFrame:(CGRect)frame atView:(UIView *)view loadingViewWH:(CGFloat)wh poingMagin:(CGFloat)maginW {
    
    if (self = [super initWithFrame:frame]) {
        
        view ? [view addSubview:self]:[[UIApplication sharedApplication].keyWindow addSubview:self];
        [self.superview bringSubviewToFront:self];
        
        self.widthAndHeight = wh;
        self.maginW = maginW;
        [self setupView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}
#pragma mark - Intial Methods
- (void)setupView {
    
   
}
#pragma mark - Target Methods

#pragma mark - Public Methods
- (void)startLoadingAnimation {
    
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.removedOnCompletion = false;
    animationGroup.repeatCount = HUGE;
    animationGroup.duration = 0.7;
    
//    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
//    animation.keyPath = @"transform.scale";
//    animation.fromValue = @1;
//    animation.toValue = @0.4;
    CAKeyframeAnimation *animation = [[CAKeyframeAnimation alloc] init];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1, @0.8, @0.6,@0.4];
    
    animationGroup.animations = @[animation];
    
    [self.baseLayer addAnimation:animationGroup forKey:nil];
    
    [self.replicatorLayer addSublayer:self.baseLayer];
    [self.layer addSublayer:self.replicatorLayer];
}

- (void)removeSubLayer {
    
    [self.replicatorLayer removeFromSuperlayer];
    [self.baseLayer removeFromSuperlayer];
}

- (void)stopLoadingAnimation {
    
    [self removeSubLayer];
}

#pragma mark - Private Method

#pragma mark - Setter Getter Methods
- (CALayer *)baseLayer {
    if (!_baseLayer) {
        _baseLayer = [[CALayer alloc] init];
        _baseLayer.bounds = CGRectMake(0, 0, self.widthAndHeight,self.widthAndHeight);
        _baseLayer.cornerRadius = self.widthAndHeight / 2.0;
        _baseLayer.backgroundColor = [UIColor whiteColor ].CGColor;
        _baseLayer.masksToBounds = true;
        _baseLayer.position = CGPointMake((self.bounds.size.width - self.widthAndHeight - self.maginW / 2.0 - self.maginW) / 2.0, (self.bounds.size.height - self.widthAndHeight / 2.0) / 2.0);
    }
    return _baseLayer;
}

- (CAReplicatorLayer *)replicatorLayer {
    if (!_replicatorLayer) {
        _replicatorLayer = [[CAReplicatorLayer alloc] init];
        _replicatorLayer.instanceCount = LAYERCOUNT;
        _replicatorLayer.instanceDelay = 0.2;
        _replicatorLayer.instanceTransform = CATransform3DMakeTranslation(self.maginW, 0, 0);
        _replicatorLayer.frame = self.bounds;
    }
    return _replicatorLayer;
}
@end
