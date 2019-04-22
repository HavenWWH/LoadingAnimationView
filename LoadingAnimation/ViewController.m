//
//  ViewController.m
//  LoadingAnimation
//
//  Created by 吴文海 on 2019/4/22.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import "ViewController.h"
#import "LoadingAnimationView.h"

@interface ViewController ()
@property (nonatomic, strong) LoadingAnimationView *loadingView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.loadingView startLoadingAnimation];
}


- (LoadingAnimationView *)loadingView {
    
    if (!_loadingView) {
        _loadingView = [[LoadingAnimationView alloc] initWithFrame:CGRectMake(100, 100, 200, 200) atView: self.view loadingViewWH:15.0 poingMagin:30.0];
        _loadingView.backgroundColor = [UIColor orangeColor];
        _loadingView.center = self.view.center;
        _loadingView.layer.cornerRadius = _loadingView.bounds.size.height / 2.0;
        _loadingView.layer.masksToBounds = true;
    }
    return _loadingView;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (_loadingView) {
        [_loadingView stopLoadingAnimation];
        [_loadingView removeFromSuperview];
        _loadingView = nil;
    }
}
@end
