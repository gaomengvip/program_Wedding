//
//  lastTopCollectionCell.h
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model4SetMeal.h"

@interface lastTopCollectionCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *picture;

@property (weak, nonatomic) IBOutlet UILabel *txt4title;


@property (weak, nonatomic) IBOutlet UILabel *txt4kind;

@property (nonatomic,strong)Model4SetMeal *model;

@end
