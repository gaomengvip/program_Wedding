//
//  detailCell.h
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detailModel.h"

@interface detailCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picture;

@property (nonatomic,strong)detailModel *model;

@end
