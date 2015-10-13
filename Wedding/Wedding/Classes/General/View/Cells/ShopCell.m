//
//  ShopCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShopCell.h"

@implementation ShopCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(ShopModel *)model{
    
    [self.picture sd_setImageWithURL:[NSURL URLWithString:model.logo_path]];
    self.title.text = model.name;
    [self.picture1 sd_setImageWithURL:[NSURL URLWithString:model.sign[@"bond_sign"][@"url"]]];
    
    [self.picture2 sd_setImageWithURL:[NSURL URLWithString:model.sign[@"sign_3"][@"url"]]];
    
    self.txt4Combo.text = [NSString stringWithFormat:@"套餐%@",model.active_works_pcount];
    self.txt4Case.text = [NSString stringWithFormat:@"案例%@",model.active_cases_pcount];
    self.txt4Attention.text = [NSString stringWithFormat:@"关注%@",model.fans_count];
    
}




@end
