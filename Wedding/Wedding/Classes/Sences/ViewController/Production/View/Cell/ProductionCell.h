//
//  ProductionCell.h
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductionModel.h"

@interface ProductionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img4pic1;
@property (weak, nonatomic) IBOutlet UIImageView *img4pic2;
@property (weak, nonatomic) IBOutlet UIImageView *img4pic3;
@property (weak, nonatomic) IBOutlet UILabel *lab4Text;
@property (weak, nonatomic) IBOutlet UILabel *lab4Text1;


@property (nonatomic,strong)ProductionModel *model;
@end
