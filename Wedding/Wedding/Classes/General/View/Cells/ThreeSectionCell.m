//
//  ThreeSectionCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ThreeSectionCell.h"

@implementation ThreeSectionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)setModel:(Model4SetMeal *)model{
    
    
    self.txt4kind.text = model.kind;
    self.txt4title.text = model.title;
    self.txt4NowPlace.text = [NSString stringWithFormat:@" ¥ %d",(int)model.sale_price];
    self.txt4FormerPlace.text = [NSString stringWithFormat:@"%d",(int)model.market_price];
    self.txt4saveMoney.text = [NSString stringWithFormat:@"省%d元",((int)model.market_price - (int)model.sale_price)];
    [self.picture sd_setImageWithURL:[NSURL URLWithString:model.cover_path]];
    
}



@end
