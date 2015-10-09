//
//  ShwanComboViewCell.h
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShwanComboModle;
@interface ShwanComboViewCell : UITableViewCell





@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIImageView  *cover_pathImage;
@property(nonatomic,strong)UILabel  *nameLabel;

@property(nonatomic,strong)UILabel *actual_priceLable;
@property(nonatomic,strong)UILabel *market_priceLable;
@property(nonatomic,strong)ShwanComboModle * modle;
@property(nonatomic,strong)UIImageView * urlImage;

@end
