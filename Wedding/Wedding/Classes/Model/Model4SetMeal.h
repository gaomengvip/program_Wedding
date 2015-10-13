//
//  Model4SetMeal.h
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model4SetMeal : NSObject

@property (nonatomic,strong)NSString *ID;
@property (nonatomic,strong)NSString *cover_path;
@property (nonatomic,strong)NSString *collectors_count;
@property (nonatomic,strong)NSString *title;
@property (nonatomic,assign)NSInteger sale_price;
@property (nonatomic,assign)NSInteger actual_price;
@property (nonatomic,assign)NSInteger market_price;
@property (nonatomic,strong)NSString *rule_id;
@property (nonatomic,strong)NSString *merchant_id;
@property (nonatomic,strong)NSString *kind;
@property (nonatomic,strong)NSString *property_name;
@property (nonatomic,strong)NSDictionary *merchant;




@end
