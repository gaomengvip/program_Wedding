//
//  ShwanMoreCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanMoreCell.h"
#import "ShwanMoreModle.h"
#import "UIImageView+WebCache.h"
@implementation ShwanMoreCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self DrawView];
        
    }
    
    
    
    return self;
    
}

-(void)setModle:(ShwanMoreModle *)modle{
    
    self.titleLabel.text=modle.title;
    
    
    self.nameLabel.text=modle.merchant[@"name"];
    
 
    
    self.collectors_countLabel.text=modle.collectors_count;
    
    [self.cover_pathImage sd_setImageWithURL:[NSURL  URLWithString:modle.cover_path]];
    
}

-(void)DrawView{
    
    
    self.cover_pathImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, self.contentView.frame.size.width, 200)];
    
    
    [self.contentView addSubview:_cover_pathImage];
    
    self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 205, 200, 30)];
    
    [self.contentView addSubview:_titleLabel];
    
    self.nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 240, 100, 30)];
    
    self.nameLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:_nameLabel];
    
    self.collectors_countLabel=[[UILabel alloc]initWithFrame:CGRectMake(290, 210, 100, 30)];
    
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(245, 205, 32, 32)];
    img.image=[UIImage imageNamed:@"iconfont-starton-1"];
    
    [self.contentView addSubview:img];
    
    [self.contentView addSubview:_collectors_countLabel];
    
    
}


@end
