//
//  ComboHandle.h
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComboHandle : NSObject

@property (nonatomic,strong)NSMutableArray *dateArray;
//跟多套餐
@property (nonatomic,strong)NSMutableArray *setMealArray;
@property (nonatomic,strong)NSMutableDictionary *dictionary;

+(ComboHandle *)shareHandle;

-(void)requestDateWithId:(NSString *)string finish:(void(^)())result;



@end
