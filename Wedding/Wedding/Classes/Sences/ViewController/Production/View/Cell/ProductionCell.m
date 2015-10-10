//
//  ProductionCell.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ProductionCell.h"
#import "UIImageView+WebCache.h"
@implementation ProductionCell




- (void)setModel:(ProductionModel *)model{
    
    
    if (model.items.count == 3) {
        [self.img4pic1 sd_setImageWithURL:[NSURL URLWithString:model.items[0][@"path"]]];
        [self.img4pic2 sd_setImageWithURL:[NSURL URLWithString:model.items[1][@"path"]]];
        [self.img4pic3 sd_setImageWithURL:[NSURL URLWithString:model.items[2][@"path"]]];
    }else{
        self.img4pic1.image = [UIImage imageNamed:@"Production2"];
        self.img4pic2.image = [UIImage imageNamed:@"Production3"];
        self.img4pic3.image = [UIImage imageNamed:@"Production4"];
    }
    
    self.lab4Text.text = model.title;
    self.lab4Text1.text = [NSString stringWithFormat:@"%ld",(long)model.collect_count];
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
