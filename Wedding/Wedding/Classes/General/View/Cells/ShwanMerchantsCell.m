//
//  ShwanMerchantsCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanMerchantsCell.h"
#import "Shwanmerchant.h"
#import "UIImageView+WebCache.h"
@implementation ShwanMerchantsCell




-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{


    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self drawView];
    }

    return self;

}

-(void)setModle:(Shwanmerchant *)Modle{


    
    self.fans_count.text=[NSString stringWithFormat:@"关注%@",Modle.fans_count];;
    self.active_works_pcount.text=[NSString stringWithFormat:@"套餐%@",Modle.active_works_pcount];
    self.active_cases_pcount.text=[NSString stringWithFormat:@"案例%@",Modle.active_cases_pcount];
    [self.logo_path sd_setImageWithURL:[NSURL URLWithString:Modle.logo_path]];
    [self.signImage sd_setImageWithURL:[NSURL URLWithString:Modle.sign[@"url"]]];
    

  
}


-(void)drawView{

    self.logo_path=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];

    [self.contentView addSubview:_logo_path];
    
    self.active_works_pcount=[[UILabel alloc]initWithFrame:CGRectMake(110, 70, 60, 30)];
    [self.contentView addSubview:_active_works_pcount];
    

    self.active_cases_pcount=[[UILabel alloc]initWithFrame:CGRectMake(175, 70, 60, 30)];
    [self.contentView addSubview:_active_cases_pcount];
    
    self.fans_count=[[UILabel alloc]initWithFrame:CGRectMake(240, 70, 100, 30)];
    [self.contentView addSubview:_fans_count];

}






@end
