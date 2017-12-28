//
//  HXBNoNetworkStatusView.m
//  hoomxb
//
//  Created by HXB-C on 2017/8/14.
//  Copyright © 2017年 hoomsun-miniX. All rights reserved.
//

#import "HXBNoNetworkStatusView.h"
#import "HXBNoDataView.h"

@interface HXBNoNetworkStatusView ()

@property (nonatomic, strong) HXBNoDataView *nodataView;

@property (nonatomic, strong) UIButton *getNetworkAgainBtn;

@end

@implementation HXBNoNetworkStatusView

+ (instancetype)noNetworkStatusView {
    HXBNoNetworkStatusView *noNetworkStatusView = [[HXBNoNetworkStatusView alloc] initWithFrame:CGRectMake(0, HXBStatusBarAndNavigationBarHeight, kWidth, kHeight - HXBStatusBarAndNavigationBarHeight)];
    noNetworkStatusView.hidden = YES;
    noNetworkStatusView.backgroundColor = [UIColor whiteColor];
    return noNetworkStatusView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.nodataView.hidden = NO;
        [self addSubview:self.nodataView];
        [self addSubview:self.getNetworkAgainBtn];
        
        [self.nodataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(200);
            make.height.width.equalTo(@184);
            make.centerX.equalTo(self);
        }];
        [self.getNetworkAgainBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nodataView.mas_bottom).offset(100);
            make.left.equalTo(self).offset(40);
            make.right.equalTo(self).offset(-40);
            make.height.offset(82);
        }];
    }
    return self;
}


- (void)getNetworkAgain
{
    if (self.getNetworkAgainBlock) {
        self.getNetworkAgainBlock();
    }
}

- (UIButton *)getNetworkAgainBtn
{
    if (!_getNetworkAgainBtn) {
//        _getNetworkAgainBtn = [UIButton btnwithTitle:@"重新获取网络" andTarget:self andAction:@selector(getNetworkAgain) andFrameByCategory:CGRectZero];
    }
    return _getNetworkAgainBtn;
}


- (HXBNoDataView *)nodataView {
    if (!_nodataView) {
        _nodataView = [[HXBNoDataView alloc]initWithFrame:CGRectZero];
        _nodataView.imageName = @"wuwangluo";
        _nodataView.noDataMassage = @"咦，没网啦！";
        _nodataView.downPULLMassage = @"小宝喊你快检查网络！";
    }
    return _nodataView;
}

@end
