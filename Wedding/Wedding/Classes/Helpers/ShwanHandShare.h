//
//  ShwanHandShare.h
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShwanHandShare : NSObject
@property(nonatomic,strong)NSMutableArray * array;
@property(nonatomic,strong)NSMutableArray * comboArray;
@property(nonatomic,strong)NSMutableArray * merchantArray;

@property(nonatomic,assign)NSInteger number;
+(ShwanHandShare*)share;


-(void)setWithNumber:(NSInteger)number URL:(void(^)())blockURL;


-(void)setWithComboNumber:(NSInteger)number URL:(void(^)())blockURL;


-(void)setWithMerchantNumber:(NSInteger)number URL:(void (^)())blockURL;


@end
