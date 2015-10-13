//
//  ProductionModel.h
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductionModel : NSObject

@property (nonatomic,strong)NSString *title;
@property (nonatomic,assign)NSInteger collect_count;
@property (nonatomic,strong)NSArray *items;
@property (nonatomic,strong)NSString *logo_path;
@end
