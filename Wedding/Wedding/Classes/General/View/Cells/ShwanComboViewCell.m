//
//  ShwanComboViewCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanComboViewCell.h"
#import "ShwanComboModle.h"
#import "UIImageView+WebCache.h"
@implementation ShwanComboViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{



    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self DrawView];
        
    }



    return self;

}

-(void)setModle:(ShwanComboModle *)modle{



    self.nameLabel.text=modle.name;
    self.titleLabel.text=modle.title;
    self.actual_priceLable.text=[NSString stringWithFormat:@"¥%@",modle.actual_price];
    self.market_priceLable.text=modle.market_price;
    [self.cover_pathImage  sd_setImageWithURL:[NSURL URLWithString:modle.cover_path]];
    NSDictionary*dict=modle.merchant[@"sign"];
    NSDictionary*dic =dict[@"bond_sign"];
   [self.urlImage sd_setImageWithURL:[NSURL URLWithString:dic[@"url"]]];
    
}


-(void)DrawView{



    
    
    
    self.cover_pathImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, self.contentView.frame.size.width-20, 200)];
    
    
    [self.contentView addSubview:_cover_pathImage];
    
    self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 205, 200, 30)];
    
    [self.contentView addSubview:_titleLabel];
    
    self.nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 240, 80, 30)];
    
    self.nameLabel.textColor=[UIColor grayColor];
    
    [self.contentView addSubview:_nameLabel];
    
    self.urlImage=[[UIImageView alloc]initWithFrame:CGRectMake(95, 245, 20, 20)];
    
    [self.contentView addSubview:_urlImage];
    self.actual_priceLable=[[UILabel alloc]initWithFrame:CGRectMake(245, 205, 100, 32)];
    
    self.actual_priceLable.textColor=[UIColor redColor];
    
    [self.contentView addSubview:_actual_priceLable];
    
    
    self.market_priceLable=[[UILabel alloc]initWithFrame:CGRectMake(245, 240, 100, 32)];
    UIImageView * ima=[[UIImageView alloc]initWithFrame:CGRectMake(243, 253, 90, 3)];
    ima.backgroundColor=[UIColor grayColor];
    [self.contentView addSubview:ima];
    
    self.market_priceLable.textColor=[UIColor grayColor];
    
    [self.contentView addSubview:_market_priceLable];



}














@end
