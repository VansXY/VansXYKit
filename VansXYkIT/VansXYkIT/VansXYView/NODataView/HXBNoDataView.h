//
//  HXBNoDataView.h
//  hoomxb
//
//  Created by HXB on 2017/7/14.
//  Copyright © 2017年 hoomsun-miniX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickBtn)(void);
@interface HXBNoDataView : UIView
@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,copy) NSString *noDataMassage;
@property (nonatomic,copy) NSString *downPULLMassage;
@property (nonatomic, copy) clickBtn clickBlock;


/**
 快速创建无数据的View

 @param imgName imageName
 @param noDataMassage noDataMassage
 @param downPullMassage downPullMassage
 @param view 父视图
 @param remakeConstraints 约束
 @return HXBNoDataView
 */
+ (HXBNoDataView *)noDataViewWithImgName:(NSString *)imgName
                           noDataMassage:(NSString *)noDataMassage
                         downPullMassage:(NSString *)downPullMassage
                                  inView:(UIView *)view
                       remakeConstraints:(void(^)(MASConstraintMaker *make))remakeConstraints;
@end
