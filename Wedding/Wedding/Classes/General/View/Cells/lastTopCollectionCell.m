//
//  lastTopCollectionCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "lastTopCollectionCell.h"

@implementation lastTopCollectionCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(Model4SetMeal *)model{
    [self.picture sd_setImageWithURL:[NSURL URLWithString:model.cover_path]];
    self.txt4title.text = model.title;
    self.txt4kind.text = model.kind;
    
}

@end
