//
//  detailCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "detailCell.h"

@implementation detailCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(detailModel *)model{
    [self.picture sd_setImageWithURL:[NSURL URLWithString:model.media_path]];
}

@end
