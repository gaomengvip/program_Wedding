//
//  ShopHandle.m
//  Wedding
//
//  Created by lanou3g on 15/10/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShopHandle.h"
#import "ShopModel.h"

@implementation ShopHandle

+(ShopHandle *)shareDate{
    static ShopHandle *shopHandle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shopHandle = [ShopHandle new];
    });
    return shopHandle;
}


- (void)requestWithUrl:(NSString *)string finish:(void(^)())result{
    
    if (self.array.count > 0) {
        [self.array removeAllObjects];
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dic = dictionary[@"data"];
        NSArray *mutArray = dic[@"merchants"];
        for (NSDictionary *dict in mutArray) {
            ShopModel *model = [ShopModel new];
            [model setValuesForKeysWithDictionary:dict];
            [self.array addObject:model];
        }
        result();
        
    }];
    
    
    
}

-(NSMutableArray *)array{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}

@end
