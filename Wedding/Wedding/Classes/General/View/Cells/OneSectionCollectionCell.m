//
//  OneSectionCollectionCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "OneSectionCollectionCell.h"

@implementation OneSectionCollectionCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(Model4HomePage *)model
{
    [self.picture sd_setImageWithURL:[NSURL URLWithString:model.image_path]];
}

@end
