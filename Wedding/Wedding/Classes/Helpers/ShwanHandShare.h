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

@property(nonatomic,strong)NSString* number;
+(ShwanHandShare*)share;


-(void)setWithNumber:(NSString*)number URL:(void(^)())blockURL;








@end
