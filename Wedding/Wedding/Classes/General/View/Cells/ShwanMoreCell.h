//
//  ShwanMoreCell.h
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShwanMoreModle;
@interface ShwanMoreCell : UITableViewCell



@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIImageView  *cover_pathImage;
@property(nonatomic,strong)UILabel  *collectors_countLabel;
@property(nonatomic,strong)UILabel  *nameLabel;
@property(nonatomic,strong)ShwanMoreModle * modle;



@end
