//
//  LastCollectionCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "LastCollectionCell.h"

@implementation LastCollectionCell

- (void)awakeFromNib {
    // Initialization code
}


-(void)setModel:(Model4SetMeal *)model{
    [self.picture sd_setImageWithURL:[NSURL URLWithString:model.cover_path]];
    self.txt4title.text = model.title;
    self.txt4place.text = [NSString stringWithFormat:@" ¥ %d",(int)model.sale_price];
    self.txt4kind.text = model.kind;
    
}



@end
