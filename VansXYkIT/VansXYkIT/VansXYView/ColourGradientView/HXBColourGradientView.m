//
//  HXBColourGradientView.m
//  hoomxb
//
//  Created by HXB on 2017/7/11.
//  Copyright © 2017年 hoomsun-miniX. All rights reserved.
//

#import "HXBColourGradientView.h"
@interface HXBColourGradientView ()
/**
 颜色数组
 */
@property (nonatomic,strong)  NSArray<NSNumber *> *components;
/**
 颜色长度
 */
@property (nonatomic,assign) NSInteger componentsLength;
/**
 颜色渐变的位置
 */
@property (nonatomic,strong) NSArray <NSNumber *>*locations;
@property (nonatomic,copy) void(^clickBlock)(UIView *view);
@end

@implementation HXBColourGradientView


- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUPValue];
    }
    return self;
}

- (void)setUPValue {
    self.endPoint = CGPointMake(kWidth, 64);
    self.startPoint = CGPointMake(0, 0);
    NSArray *colorArrayTemp = @[
        @0.99,@0.40,@0.30,@1.00,
        @1.00,@0.24,@0.31,@1.00
    ];

    self.components = colorArrayTemp;
    NSArray <NSNumber *>*colorLocationTemp = @[
        @0,@1
    ];
    self.locations = colorLocationTemp;
    self.componentsLength = 2;
}

- (void)setClickBlock:(void (^)(UIView *))clickBlock {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickView:)];
    [self addGestureRecognizer:tap];
    _clickBlock = clickBlock;
}
- (void)clickView: (UITapGestureRecognizer*)tap
{
    if (self.clickBlock) {
        self.clickBlock(tap.view);
    }
}

///开始位置
- (void) setStartPoint:(CGPoint)startPoint {
    _startPoint = startPoint;
    [self setNeedsDisplay];
}


///终止位置
- (void)setEndPoint:(CGPoint)endPoint {
    _endPoint = endPoint;
    [self setNeedsDisplay];
}

///颜色数组
- (void)setComponents:(NSArray <NSNumber *>*)components {
    _components = components;
    [self setNeedsDisplay];
}

/**
 绘制的颜色 数组(默认是红色渐变)
 @param components 颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
 如果有三个颜色则这个数组有4*3=12个元素
 @param componentsLength 数组长度
 @param locations 颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
 count:渐变个数，等于locations的个数
 */
- (void)colorArray: (NSArray <NSNumber*> *)components andLength: (NSInteger)componentsLength andColorLocation: (NSArray <NSNumber*> *)locations {
    self.components = components;
    self.componentsLength = componentsLength;
    self.locations = locations;
    [self setNeedsDisplay];
}


-(void)drawRect:(CGRect)rect{
    CGContextRef context=UIGraphicsGetCurrentContext();
    [self drawLinearGradient:context];
}

#pragma mark 线性渐变
-(void)drawLinearGradient:(CGContextRef)context{
    //使用rgb颜色空间
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    
    /*指定渐变色
     space:颜色空间
     components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
     如果有三个颜色则这个数组有4*3个元素
     locations:颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
     count:渐变个数，等于locations的个数
     */
    CGFloat components[100] = {0};
    CGFloat locations[100] = {0};
    for (int i = 0; i < self.componentsLength * 4; i ++) {
        CGFloat value = self.components[i].floatValue;
        components[i] = value;
    }
    for (int i = 0; i < self.locations.count; i ++) {
        locations[i] = self.locations[i].floatValue;
    }
    CGGradientRef gradient= CGGradientCreateWithColorComponents(colorSpace, components, locations, self.componentsLength);

    /*绘制线性渐变
     context:图形上下文
     gradient:渐变色
     startPoint:起始位置
     endPoint:终止位置
     options:绘制方式,kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制，
     kCGGradientDrawsAfterEndLocation开始位置之前不进行绘制，到结束点之后继续填充
     */
    CGPoint start = self.startPoint;
    CGPoint end = self.endPoint;
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsAfterEndLocation);
    //释放颜色空间
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
}
- (void)clickEvent: (void(^)(UIView *view))clickBlock {
    self.clickBlock = clickBlock;
}
@end
