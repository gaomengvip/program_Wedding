//
//  ShopModel.m
//  Wedding
//
//  Created by lanou3g on 15/10/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}

@end
