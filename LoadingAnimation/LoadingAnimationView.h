//
//  LoadingAnimationView.h
//  LoadingAnimation
//
//  Created by 吴文海 on 2019/4/22.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoadingAnimationViewDelegate <NSObject>

@optional

@end

@interface LoadingAnimationView : UIView

- (instancetype)initWithFrame:(CGRect)frame atView:(UIView *)view loadingViewWH:(CGFloat)wh poingMagin:(CGFloat)maginW;

- (void)startLoadingAnimation;

- (void)stopLoadingAnimation;
@end
