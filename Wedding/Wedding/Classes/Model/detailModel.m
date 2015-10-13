//
//  detailModel.m
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "detailModel.h"

@implementation detailModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", _media_path];
}
@end
