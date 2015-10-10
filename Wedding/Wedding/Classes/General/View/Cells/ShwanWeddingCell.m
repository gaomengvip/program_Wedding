//
//  ShwanWeddingCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanWeddingCell.h"
#import "ShwanModleWeddingdress.h"
@implementation ShwanWeddingCell

-(instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        [self drawView];
        
           }


    return self;
    
    
}


-(void)setModle:(ShwanModleWeddingdress *)modle{


    self.nameLable.text=modle.name;



}
-(void)drawView{



    self.nameLable=[[UILabel alloc]initWithFrame:self.contentView.frame];
    
    
    self.nameLable.textAlignment=UITextAlignmentCenter;
    [self.contentView addSubview:_nameLable];


}


@end
