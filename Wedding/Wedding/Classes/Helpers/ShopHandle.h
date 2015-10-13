//
//  ShopHandle.h
//  Wedding
//
//  Created by lanou3g on 15/10/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopHandle : NSObject

@property (nonatomic,strong)NSMutableArray *array;

+ (ShopHandle *)shareDate;

- (void)requestWithUrl:(NSString *)string finish:(void(^)())result;

@end
