//
//  ComboHandle.m
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ComboHandle.h"
#import "detailModel.h"
#import "Model4SetMeal.h"

@implementation ComboHandle

+(ComboHandle *)shareHandle{
    static ComboHandle *combo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        combo = [ComboHandle new];
    });
    return combo;
}

-(void)requestDateWithId:(NSString *)string finish:(void (^)())result{
    [self.dateArray removeAllObjects];
    
//    NSString *url = kDetailURL(string);
//    NSLog(@"%@",url);
//    NSString *codeString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //解析
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSLog(@"******%@",connectionError);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dictionary = dic[@"work"];
        self.dictionary = dic[@"work"];
        NSArray *array= dictionary[@"media_items"];
        NSLog(@"======%@",array);
        for (NSDictionary *dictionary in array) {
            Model4SetMeal *setMealModel = [Model4SetMeal new];
            [setMealModel setValuesForKeysWithDictionary:dictionary];
            [self.setMealArray addObject:setMealModel];
            detailModel *model = [detailModel new];
            [model setValuesForKeysWithDictionary:dictionary];
            [self.dateArray addObject:model];
           // NSLog(@"===============%@",self.dateArray);
        }
   
        result();
    }];
    
}


-(NSMutableArray *)dateArray{
    if (_dateArray == nil) {
        _dateArray = [NSMutableArray array];
    }
    return _dateArray;
}

- (NSMutableDictionary *)dictionary{
    if (_dictionary == nil) {
        _dictionary = [NSMutableDictionary dictionary];
    }
    return _dictionary;
}

-(NSMutableArray *)setMealArray{
    if (_setMealArray == nil) {
        _setMealArray = [NSMutableArray array];
    }
    return _setMealArray;
}



@end
