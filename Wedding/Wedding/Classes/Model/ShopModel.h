//
//  ShopModel.h
//  Wedding
//
//  Created by lanou3g on 15/10/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopModel : NSObject

@property (nonatomic,strong)NSString *ID;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSArray *contact_phone;
@property (nonatomic,strong)NSString *user_id;
@property (nonatomic,strong)NSString *address;
@property (nonatomic,strong)NSString *logo_path;
@property (nonatomic,strong)NSString *cover_path;
//纬度
@property (nonatomic,strong)NSString *latitude;
//经度
@property (nonatomic,strong)NSString *longitude;
//关注
@property (nonatomic,strong)NSString *fans_count;
//案例
@property (nonatomic,strong)NSString *works_count;
//套餐
@property (nonatomic,strong)NSString *active_works_pcount;
//
@property (nonatomic,strong)NSString *active_cases_pcount;
@property (nonatomic,strong)NSString *rating;
@property (nonatomic, strong) NSDictionary *sign;








@end
