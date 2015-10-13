//
//  OneSectionCollectionCell.h
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model4HomePage.h"

@interface OneSectionCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *txt4MainTitle;

@property (weak, nonatomic) IBOutlet UILabel *txt4SecondTitle;

@property (weak, nonatomic) IBOutlet UIImageView *picture;

@property (nonatomic,strong) Model4HomePage *model;


@end
