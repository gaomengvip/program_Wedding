//
//  ShwanClassificationController.h
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^Block4Str)(NSString*);
@interface ShwanClassificationController : UIViewController


@property(nonatomic,assign)NSInteger number;
@property(nonatomic,assign)NSInteger Morenumber;
@property(nonatomic,copy)Block4Str block;


@end
