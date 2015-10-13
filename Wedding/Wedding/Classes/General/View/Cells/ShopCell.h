//
//  ShopCell.h
//  Wedding
//
//  Created by lanou3g on 15/10/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopModel.h"

@interface ShopCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *picture;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *txt4Combo;

@property (weak, nonatomic) IBOutlet UILabel *txt4Case;

@property (weak, nonatomic) IBOutlet UILabel *txt4Attention;

@property (weak, nonatomic) IBOutlet UIImageView *picture1;

@property (weak, nonatomic) IBOutlet UIImageView *picture2;

@property (nonatomic, strong) ShopModel *model;




@end
