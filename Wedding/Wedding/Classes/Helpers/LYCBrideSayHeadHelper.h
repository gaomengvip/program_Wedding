//
//  LYCBrideSayHeadHelper.h
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYCBrideSayHeadItem.h"

@interface LYCBrideSayHeadHelper : NSObject

@property (nonatomic,strong) NSMutableArray * mutArray;
@property (nonatomic,strong) NSMutableArray *imagesArray;
@property (nonatomic,strong) NSMutableArray * sectionOneArray;
@property (nonatomic,strong) NSMutableArray * sectionSecondArray;
@property (nonatomic,strong) NSMutableArray * sectionThreeArray;
@property (nonatomic,strong) NSMutableArray * sectionSecondArray2;

//创建单例
+ (LYCBrideSayHeadHelper *)sharedHelper;

//一区区头数据解析方法
- (void)requestAllHeadWithBlock:(void (^)())block;


//一区和三区数据解析方法
- (void)requestAllSectionOneAndSenctionThreeWithBlock:(void (^)())block;

//二区数据解析方法
- (void)requestAllSectionTwoWithBlock:(void (^)())block;

@end
