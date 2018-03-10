//
//  RBPagedFlowView.h
//  GameMall
//
//  Created by hezixuan on 2018/3/8.
//  Copyright © 2018年 andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZXPagedFlowView : UIView<UIScrollViewDelegate>
/**
 图片间有间距  又要有翻页效果～～
 @param imageSpacing 图片间 间距
 @param imageWidth 图片宽
 @param data 数据
 */
- (id)initWithFrame:(CGRect)frame
       imageSpacing:(CGFloat)imageSpacing
        imageWitdth:(CGFloat)imageWidth
        imageUrlArr:(NSArray *)imageUrlArr;

/** 网络图片数据源 */
@property (nonatomic,strong) NSArray *imageUrlArr;

@end

