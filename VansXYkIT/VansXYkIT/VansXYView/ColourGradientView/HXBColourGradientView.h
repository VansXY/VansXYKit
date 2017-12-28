//
//  HXBColourGradientView.h
//  hoomxb
//
//  Created by HXB on 2017/7/11.
//  Copyright © 2017年 hoomsun-miniX. All rights reserved.
//

#import <UIKit/UIKit.h>
///颜色渐变的View工具
@interface HXBColourGradientView : UIView

///开始位置
@property (nonatomic,assign) CGPoint startPoint;
///终止位置
@property (nonatomic,assign) CGPoint endPoint;
/**
 绘制的颜色 数组(默认是红色渐变)
 @param components 颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
 如果有三个颜色则这个数组有4*3=12个元素
 @param componentsLength 数组长度
 @param locations 颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
 count:渐变个数，等于locations的个数
 */
- (void)colorArray: (NSArray <NSNumber*> *)components andLength: (NSInteger)componentsLength andColorLocation: (NSArray <NSNumber*> *)locations;

- (void)clickEvent: (void(^)(UIView *view))clickBlock;
@end
