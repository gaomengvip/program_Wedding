//
//  ShwanMerchantsCell.h
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Shwanmerchant;
@interface ShwanMerchantsCell : UITableViewCell




@property(nonatomic,strong)UIImageView * logo_path;
@property(nonatomic,strong)UILabel * fans_count;
@property(nonatomic,strong)UILabel * active_works_pcount;
@property(nonatomic,strong)UILabel * active_cases_pcount;
@property(nonatomic,strong)UIImageView * signImage;
@property(nonatomic,strong)Shwanmerchant *Modle;



@end
