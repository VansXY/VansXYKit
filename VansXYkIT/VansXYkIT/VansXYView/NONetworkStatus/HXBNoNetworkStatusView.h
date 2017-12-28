//
//  HXBNoNetworkStatusView.h
//  hoomxb
//
//  Created by HXB-C on 2017/8/14.
//  Copyright © 2017年 hoomsun-miniX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXBNoNetworkStatusView : UIView

+ (instancetype)noNetworkStatusView;

/**
 重新获取网络
 */
@property (nonatomic, copy) void(^getNetworkAgainBlock)();

@end
