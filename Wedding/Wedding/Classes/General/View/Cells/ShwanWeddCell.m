//
//  ShwanWeddCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanWeddCell.h"

@implementation ShwanWeddCell





-(instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        [self Draw];
    }

    return self;
}

-(void)Draw{




    self.weddingView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 100,100)];
    
    self.weddingView.layer.cornerRadius=20;
    self.weddingView.layer.masksToBounds=YES;
    [self.contentView addSubview:_weddingView];
    
    
    self.titleLable=[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 90, 10)];
    
    self.titleLable.font=[UIFont systemFontOfSize:10];
    self.titleLable.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:_titleLable];

}


@end
