//
//  LYCHeader4BrideSayFirstView.m
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "LYCHeader4BrideSayFirstView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeigth [UIScreen mainScreen].bounds.size.height

@interface LYCHeader4BrideSayFirstView ()

@property (nonatomic,strong) NSArray *headArray;


@end

@implementation LYCHeader4BrideSayFirstView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self drawView];
    }
    return self;
    
}


- (void)drawView{
    
    //设置轮播图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    scrollView.contentSize = CGSizeMake(kScreenWidth * self.headArray.count, 200);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    
    [self addSubview:scrollView];
    
    //设置图片
    for (int i = 0; i < self.headArray.count; i ++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, 200)];
        
        [scrollView addSubview:imgView];
    }
    
    
}


- (void)setHeadArray:(NSArray *)headArray{
    
    if (_headArray == nil) {
        _headArray = [NSArray new];
    }
}


@end
