//
//  ProductionModel.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ProductionModel.h"

@implementation ProductionModel



- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
   // NSLog(@"%@值异常",key);
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%ld",(long)_collect_count];
}



@end
