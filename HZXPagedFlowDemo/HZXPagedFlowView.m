//
//  RBPagedFlowView.m
//  GameMall
//
//  Created by hezixuan on 2018/3/8.
//  Copyright © 2018年 andy. All rights reserved.
//
// 卡片式轮播图

#import "HZXPagedFlowView.h"
#import "UIImageView+WebCache.h"
#import "UIView+MJExtension.h"

@interface HZXPagedFlowView()
@property (nonatomic,strong) UIScrollView *mainScrollView;
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UIImageView *centerImageView;
@property (nonatomic,strong) UIImageView *rightImageView;
@property (nonatomic,assign) NSUInteger currentImageIndex;
@property (nonatomic,assign) CGFloat imageWidth; //图片宽度
@property (nonatomic,assign) CGFloat itemMargnPadding; //2张图片间的间距,默认为0
@property (nonatomic,assign) NSInteger imageCount; //数量
@property (nonatomic,weak) NSTimer *timer;
@end

@implementation HZXPagedFlowView

#pragma mark 初始化的工作
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
       imageSpacing:(CGFloat)imageSpacing
        imageWitdth:(CGFloat)imageWidth
        imageUrlArr:(NSArray *)imageUrlArr
{
    HZXPagedFlowView *flowView = [self initWithFrame:frame];
    flowView.itemMargnPadding = imageSpacing;// 图片之间的间距
    flowView.imageWidth = imageWidth; // 图片宽度
    flowView.imageUrlArr = imageUrlArr;
    
    // 更新图片的位置
    [self updateImageViewsFrame];
    // 移动scrollView的位置
    self.mainScrollView.mj_x = (self.width - imageWidth - imageSpacing) / 2;
    self.mainScrollView.width = imageWidth + imageSpacing;
    self.mainScrollView.contentSize = CGSizeMake(self.mainScrollView.width * imageUrlArr.count, self.height);
//    self.mainScrollView.contentOffset = CGPointMake(imageWidth - imageSpacing, 0.0);
    return flowView;
}

// 更新图片的位置
- (void)updateImageViewsFrame
{
    self.leftImageView.frame = CGRectMake(self.itemMargnPadding / 2, 0, self.imageWidth, self.height);
    self.centerImageView.frame = CGRectMake(self.imageWidth + self.itemMargnPadding + self.itemMargnPadding/2, 0, self.imageWidth, self.height);
    self.rightImageView.frame = CGRectMake((self.imageWidth + self.itemMargnPadding) * 2 + self.itemMargnPadding/2, 0, self.imageWidth, self.height);
}

- (void)setupUI
{
    [self addSubview:self.mainScrollView];
    // 左边的图片
    self.leftImageView = [[UIImageView alloc] init];
    self.leftImageView.contentMode = UIViewContentModeScaleToFill;
    self.leftImageView.userInteractionEnabled = YES;
    [self.leftImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftImageViewClickd:)]];
    [self.mainScrollView addSubview:self.leftImageView];
    // 中间的图片
    self.centerImageView = [[UIImageView alloc] init];
    self.centerImageView.contentMode = UIViewContentModeScaleToFill;
    self.centerImageView.userInteractionEnabled = YES;
    [self.centerImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(centerImageViewClickd:)]];
    [self.mainScrollView addSubview:self.centerImageView];
    // 右边的图片
    self.rightImageView = [[UIImageView alloc] init];
    self.rightImageView.contentMode = UIViewContentModeScaleToFill;
    self.rightImageView.userInteractionEnabled = YES;
    [self.rightImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightImageViewClickd:)]];
    [self.mainScrollView addSubview:self.rightImageView];
}

- (void)setImageUrlArr:(NSArray *)imageUrlArr
{
    for (int i = 0; i < imageUrlArr.count; i++) {
        switch (i) {
            case 0:
                [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlArr[i]]];
                break;
            case 1:
                [self.centerImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlArr[i]]];
                break;
            case 2:
                [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlArr[i]]];
                break;
            default:
                break;
        }
    }
}
#pragma mark 图片的点击事件
- (void)leftImageViewClickd:(UITapGestureRecognizer *)tap
{
    //
}
- (void)centerImageViewClickd:(UITapGestureRecognizer *)tap
{
    //
}
- (void)rightImageViewClickd:(UITapGestureRecognizer *)tap
{
    //
}

#pragma mark 懒加载
- (UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width , self.height)];
        _mainScrollView.delegate = self;
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.clipsToBounds = NO;
        _mainScrollView.showsVerticalScrollIndicator = YES;
        _mainScrollView.showsHorizontalScrollIndicator = YES;
        _mainScrollView.backgroundColor = [UIColor redColor];
    }
    return _mainScrollView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    [self reloadImage];
//    self.mainScrollView.mj_x = 20;
//    [self.mainScrollView setContentOffset:CGPointMake(335, 0) animated:NO];
//    self.pageControl.currentPage = self.currentImageIndex;
//    if (self.clickImageBlock) {
//        self.clickImageBlock(self.currentImageIndex);
//    }
}

@end
