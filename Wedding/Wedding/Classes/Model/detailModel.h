//
//  detailModel.h
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface detailModel : NSObject

@property (nonatomic,strong)NSString *ID;
@property (nonatomic,strong)NSString *set_meal_id;
@property (nonatomic,strong)NSString *media_path;
@property (nonatomic,strong)NSString *describe;
@property (nonatomic,strong)NSString *persistent_id;
@property (nonatomic,strong)NSString *width;
@property (nonatomic,strong)NSString *height;
@property (nonatomic,strong)NSString *position;
@property (nonatomic,strong)NSString *created_at;
@property (nonatomic,strong)NSString *updated_at;
@property (nonatomic,strong)NSString *kind;
@property (nonatomic,strong)NSDictionary *persistent_path;

@end
