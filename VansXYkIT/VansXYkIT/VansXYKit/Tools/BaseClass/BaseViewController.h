//
//  BaseViewController.h
//  VansXYkIT
//
//  Created by HXB-xiaoYang on 2017/12/25.
//Copyright © 2017年 VansXY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

///是否隐藏导航栏
@property (nonatomic,assign) BOOL isHiddenNavigationBar;
///使navBar 透明
@property (nonatomic,assign) BOOL isTransparentNavigationBar;
///导航条是否为红色渐变
@property (nonatomic,assign) BOOL isColourGradientNavigationBar;
@property (nonatomic,assign) BOOL isRedColorWithNavigationBar;
///导航条是否为白色
@property (nonatomic, assign) BOOL isWhiteColourGradientNavigationBar;
///导航条是否为蓝色
@property (nonatomic,assign) BOOL isBlueGradientNavigationBar;

///可以重写返回方法
- (void)leftBackBtnClick;

///无网状态的网络连接
- (void)getNetworkAgain;

/**
 隐藏导航栏，仅能在派生类的viewWillAppear方法中调用
 调用条件：如果需要隐藏导航栏就调用调用该方法
 @param animated 是否动画
 */
- (void)hideNavigationBar:(BOOL)animated;

/**
 设置导航栏title颜色透明， 仅能在派生类的viewWillAppear方法中调用
 调用条件：如果当前页面有presentedViewController这个方法的调用， 那就需要调用该方法
 */
- (void)transparentNavigationTitle;

/**
 替代viewDidAppear方法，子类如果需要重新加载页面，只需重写这个方法就可以
 注意：这个方法处理了滑动返回时的种种情况，要将所有的重新加载操作，放在这个方法里
 */
- (void)reLoadWhenViewAppear;

/**
 加载无网络视图
 
 @return YES, 已经显示了；NO，没有显示
 */
- (BOOL)loadNoNetworkView;

@end
