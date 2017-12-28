//
//  BaseViewController.m
//  VansXYkIT
//
//  Created by HXB-xiaoYang on 2017/12/25.
//Copyright © 2017年 VansXY. All rights reserved.
//

#import "BaseViewController.h"
#import "HXBColourGradientView.h"
#import "HXBNoNetworkStatusView.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) HXBColourGradientView *colorGradientView;
@property (nonatomic, strong) HXBNoNetworkStatusView *noNetworkStatusView;
@property (nonatomic,strong) UIImageView *nacigationBarImageView;
@property (nonatomic, strong) UIButton *leftBackBtn;

@end

@implementation BaseViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    [self addObservers];
}


#pragma mark - Observers

- (void)addObservers {
    
}

#pragma mark - UI

- (void)setUI {
    
}

- (void)setupLeftBackBtn
{
    UIButton *leftBackBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 35)];
    self.leftBackBtn = leftBackBtn;
    [leftBackBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    
    [leftBackBtn addTarget:self action:@selector(leftBackBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    if (@available(iOS 11.0, *)) {
        leftBackBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    } else {
        spaceItem.width = -15;
    }
    
    self.navigationItem.leftBarButtonItems = @[spaceItem,[[UIBarButtonItem alloc] initWithCustomView:leftBackBtn]];
}

#pragma mark - Network


#pragma mark - Delegate Internal

#pragma mark -


#pragma mark - Delegate External

#pragma mark -


#pragma mark - Action
- (void)leftBackBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Setter / Getter / Lazy
- (void)setIsHiddenNavigationBar:(BOOL)isHiddenNavigationBar {
    _isHiddenNavigationBar = isHiddenNavigationBar;
    self.navigationController.navigationBarHidden = isHiddenNavigationBar;
}

///透明naveBar
- (void)setIsTransparentNavigationBar:(BOOL)isTransparentNavigationBar {
    _isTransparentNavigationBar = isTransparentNavigationBar;
    if (isTransparentNavigationBar) {
        self.view.frame = CGRectMake(0, 0, kWidth, kHeight);
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
}
- (void)setIsColourGradientNavigationBar:(BOOL)isColourGradientNavigationBar {
    if (isColourGradientNavigationBar) {
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont systemFontOfSize:18]};
        self.isTransparentNavigationBar = YES;
        self.nacigationBarImageView.image = [UIImage imageNamed:@"top"];
        [self.view bringSubviewToFront: self.nacigationBarImageView];
    }
}

- (void)setIsWhiteColourGradientNavigationBar:(BOOL)isWhiteColourGradientNavigationBar {
    if (isWhiteColourGradientNavigationBar) {
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
        self.isTransparentNavigationBar = YES;
        self.nacigationBarImageView.backgroundColor = [UIColor whiteColor];
        self.nacigationBarImageView.image = [UIImage imageNamed:@""];
        [self.view bringSubviewToFront: self.nacigationBarImageView];
    }
}
- (void)setIsRedColorWithNavigationBar: (BOOL) isRedColorWithNavigationBar {
    
    if (isRedColorWithNavigationBar) {
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
        self.isTransparentNavigationBar = YES;
        self.nacigationBarImageView.image = [UIImage imageNamed:@"NavigationBar"];
        [self.view bringSubviewToFront: self.nacigationBarImageView];
    }
}
- (void)setIsBlueGradientNavigationBar:(BOOL)isBlueGradientNavigationBar
{
    if (isBlueGradientNavigationBar) {
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
        self.isTransparentNavigationBar = YES;
        self.nacigationBarImageView.image = [UIImage imageNamed:@"nav_top_blue"];
        [self.view bringSubviewToFront: self.nacigationBarImageView];
    }
}


- (UIImageView *)nacigationBarImageView {
    if (!_nacigationBarImageView) {
        _nacigationBarImageView = [[UIImageView alloc] init];
        _nacigationBarImageView.frame = CGRectMake(0, 0, kWidth, HXBStatusBarAndNavigationBarHeight);
        [self.view addSubview:_nacigationBarImageView];
        [self.view bringSubviewToFront:_nacigationBarImageView];
    }
    return _nacigationBarImageView;
}

/**
 无网界面显示
 */
- (HXBNoNetworkStatusView *)noNetworkStatusView {
    
//    kWeakSelf
    if (!_noNetworkStatusView) {
        _noNetworkStatusView = [HXBNoNetworkStatusView noNetworkStatusView];
        _noNetworkStatusView.getNetworkAgainBlock = ^{
//            weakSelf.noNetworkStatusView.hidden = KeyChain.ishaveNet;
//            if (KeyChain.ishaveNet) {
//                [weakSelf getNetworkAgain];
//            }else{
//                [HxbHUDProgress showMessageCenter:kNoNetworkText inView:nil];
//            }
        };
    }
    return _noNetworkStatusView;
}

#pragma mark - Helper


#pragma mark - Other


#pragma mark - Public

@end
