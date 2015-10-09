//
//  LYCBrideSayHeadItem.m
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "LYCBrideSayHeadItem.h"

@implementation LYCBrideSayHeadItem

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    } else if ([key isEqualToString:@"description"]) {
        _Description = value;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", _title];
}



@end
