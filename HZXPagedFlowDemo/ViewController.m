//
//  ViewController.m
//  HZXPagedFlowDemo
//
//  Created by hezixuan on 2018/3/10.
//  Copyright © 2018年 hezixuan. All rights reserved.
//

#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)

#import "ViewController.h"
#import "HZXPagedFlowView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *imageUrlArr = @[@"http://d.hiphotos.baidu.com/image/pic/item/b7fd5266d016092408d4a5d1dd0735fae7cd3402.jpg",@"http://h.hiphotos.baidu.com/image/h%3D300/sign=2b3e022b262eb938f36d7cf2e56085fe/d0c8a786c9177f3e18d0fdc779cf3bc79e3d5617.jpg",@"http://a.hiphotos.baidu.com/image/pic/item/b7fd5266d01609240bcda2d1dd0735fae7cd340b.jpg",@"http://h.hiphotos.baidu.com/image/pic/item/728da9773912b31b57a6e01f8c18367adab4e13a.jpg",@"http://h.hiphotos.baidu.com/image/pic/item/0d338744ebf81a4c5e4fed03de2a6059242da6fe.jpg"];
    
    HZXPagedFlowView *flowView = [[HZXPagedFlowView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 150) imageSpacing:10 imageWitdth:(SCREEN_WIDTH - 34) imageUrlArr:imageUrlArr];
    [self.view addSubview:flowView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
