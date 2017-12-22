//
//  VansXYTools.m
//  OCProjectKit
//
//  Created by HXB-xiaoYang on 2017/12/21.
//Copyright © 2017年 VansXY. All rights reserved.
//

#import "VansXYTools.h"

static VansXYTools *handle = nil;

@implementation VansXYTools

+ (VansXYTools *)shareHandle {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handle = [[VansXYTools alloc] init];
    });
    return handle;
}

- (UIImage*)convertViewToImage:(UIView*)view {
    CGSize size = view.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


//创建阴影
- (void)createViewShadDow:(UIImageView*)imageView {
    //阴影的颜色
    imageView.layer.shadowColor = [UIColor colorWithWhite:0.7 alpha:10.f].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(-2, -2);
    //阴影透明度
    imageView.layer.shadowOpacity = 0.8f;
    imageView.layer.shadowRadius = 3.0f;
    
}


// 自适应宽度的方法
- (CGFloat)WidthWithString:(NSString *)string labelFont:(UIFont *)labelFont addWidth:(CGFloat)width {
    CGRect frame;
    if (string.length && labelFont) {
        NSDictionary *dic = [NSDictionary dictionaryWithObject:labelFont forKey:NSFontAttributeName];
        //2. 计算320宽16字号的label的高度
        frame = [string boundingRectWithSize:CGSizeMake(1000, 15) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    }
    return frame.size.width + width;
}

// 自适应高度的方法
- (CGFloat)heightWithString:(NSString *)string labelFont:(UIFont *)labelFont Width:(CGFloat)width {
    CGSize titleSize;
    if (string.length && labelFont) {
        titleSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:labelFont} context:nil].size;
    }
    return titleSize.height + 15;
}

@end
