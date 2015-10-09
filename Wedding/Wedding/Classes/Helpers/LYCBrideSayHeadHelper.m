//
//  LYCBrideSayHeadHelper.m
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "LYCBrideSayHeadHelper.h"
#import "UIImageView+WebCache.h"


@implementation LYCBrideSayHeadHelper

+ (LYCBrideSayHeadHelper *)sharedHelper{
    
    static LYCBrideSayHeadHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [LYCBrideSayHeadHelper new];
    });
    return helper;
}

//一区区头数据解析方法
- (void)requestAllHeadWithBlock:(void (^)())block{
    
    if (self.imagesArray.count > 0) {
        [self.imagesArray removeAllObjects];
    }
    //进入子线程解析数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kLYCBrideSayScrollView]];
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            for (NSDictionary *dict in array) {
                LYCBrideSayHeadItem *item = [LYCBrideSayHeadItem new];
                [item setValuesForKeysWithDictionary:dict];
                [self.mutArray addObject:item];
                
                UIImage *img = [self requestImageWithUrl:item.image_path];
                [self.imagesArray addObject:img];
                
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                block();
            });
        }];
    });
    
}

//make image
-(UIImage *)requestImageWithUrl:(NSString *)url
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    UIImage *img = [UIImage imageWithData:data];
    return img;
}


//一区和三区数据解析方法
- (void)requestAllSectionOneAndSenctionThreeWithBlock:(void (^)())block{
    
    if (self.sectionOneArray > 0) {
        [self.sectionOneArray removeAllObjects];
    }
    if (self.sectionThreeArray > 0) {
        [self.sectionThreeArray removeAllObjects];
    }
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kLYCBrideSaySectionOne]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * connectionError) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        //获取一区cell数据
        NSArray *array = dict[@"threads"];
        for (NSDictionary *dic in array) {
            LYCBrideSayHeadItem *item = [LYCBrideSayHeadItem new];
            [item setValuesForKeysWithDictionary:dic];
            [self.sectionOneArray addObject:item];

        }
        
        //获取三区cell数据
        NSDictionary *dict2 = dict[@"archive"];
        NSArray *array2 = dict2[@"threads"];
        for (NSDictionary *dic in array2) {
            LYCBrideSayHeadItem *item = [LYCBrideSayHeadItem new];
            [item setValuesForKeysWithDictionary:dic];
            [self.sectionThreeArray addObject:item];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    }];
    
}

- (void)requestAllSectionTwoWithBlock:(void (^)())block{
    
    if (self.sectionSecondArray > 0) {
        [self.sectionSecondArray removeAllObjects];
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kLYCBrideSaySectionTwo]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

        //解析婚礼筹备总动员
        NSArray *array = dict[@"groups"];
        NSLog(@"%@",array);
        for (NSDictionary *dic in array) {
            LYCBrideSayHeadItem *item = [LYCBrideSayHeadItem new];
            [item setValuesForKeysWithDictionary:dic];
            [self.sectionSecondArray addObject:item];
        }
        
        NSDictionary *dict2 = [[NSDictionary alloc]init];
        dict2 = dict[@"story"];
        LYCBrideSayHeadItem *item2 = [LYCBrideSayHeadItem new];
        [item2 setValuesForKeysWithDictionary:dict2];
        [self.sectionSecondArray2 addObject:item2];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
        
    }];
}




//lazy load
- (NSMutableArray *)sectionSecondArray2{
    if (_sectionSecondArray2 == nil) {
        _sectionSecondArray2 = [NSMutableArray new];
    }
    return _sectionSecondArray2;
}

- (NSMutableArray *)sectionOneArray{
    if (_sectionOneArray == nil) {
        _sectionOneArray = [NSMutableArray new];
    }
    return _sectionOneArray;
}

- (NSMutableArray *)sectionSecondArray{
    if (_sectionSecondArray == nil) {
        _sectionSecondArray = [NSMutableArray new];
    }
    return _sectionSecondArray;
}

- (NSMutableArray *)sectionThreeArray{
    if (_sectionThreeArray == nil) {
        _sectionThreeArray = [NSMutableArray new];
    }
    return _sectionThreeArray;
}

- (NSMutableArray *)mutArray{
    if (_mutArray == nil) {
        _mutArray = [NSMutableArray new];
    }
    return _mutArray;
}

-(NSMutableArray *)imagesArray{
    if (_imagesArray == nil) {
        _imagesArray = [NSMutableArray array];
    }
    return _imagesArray;
}





@end
