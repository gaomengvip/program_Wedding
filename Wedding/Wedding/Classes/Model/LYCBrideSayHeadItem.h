//
//  LYCBrideSayHeadItem.h
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYCBrideSayHeadItem : NSObject

//定义属性id,活动名称,头id,图片
@property (nonatomic,strong) NSString * ID, * title, * forward_id, * image_path;
//第一个区添加的属性
@property (nonatomic,strong) NSString * tag_id, *good_title;
//第三个区添加的属性 评论数量,post内含评论信息和点赞次数,作者名
@property (nonatomic,strong) NSString * post_count, *praised_sum, *author_nick;

@property (nonatomic,strong) NSDictionary * tag, *post, *latest_refine;

@property (nonatomic,strong) NSString * entry_img, *entry_name, *story_title, *Description, *image;

@property (nonatomic,assign) NSInteger added_threads_count;
@property (nonatomic,assign) BOOL have_pics;
@end
