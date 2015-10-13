//
//  ShwanClassificationCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanClassificationCell.h"
#import "SHwanModle.h"
#import "UIImageView+WebCache.h"
@implementation ShwanClassificationCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{



    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
      
        
        [self DrawView];
        
        
        
    }



    return self;
}

-(void)setModle:(SHwanModle *)modle{



    self.titleLable.text=modle.title;
    self.descLable.text=modle.desc;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:modle.icon]];
    
    
}


-(void)DrawView{


    self.iconImage=[[UIImageView  alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    [self.contentView addSubview:_iconImage];
    
    self.titleLable=[[UILabel alloc]initWithFrame:CGRectMake(120, 5, 100, 30)];
    
    [self.contentView addSubview:_titleLable];
    
    
    self.descLable=[[UILabel alloc]initWithFrame:CGRectMake(120, 50, 100, 30)];
    
    [self.contentView addSubview:_descLable];
    
}



















@end
