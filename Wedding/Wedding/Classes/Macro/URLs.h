//
//  URLs.h
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#ifndef Wedding_URLs_h
#define Wedding_URLs_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeigth [UIScreen mainScreen].bounds.size.height

#pragma mark -- 新娘说轮播图 --
#define kLYCBrideSayScrollView @"http://hunliji.com/p/wedding/index.php/Home/APIBanner/BannerList"

#pragma mark -- 新娘说轮播图详情页--第一页 --
#define kLYCBrideSayScrollViewDetail_a @"http://hunliji.com/p/wedding/index.php/Home/APICommunityThread/ThreadDetail/id/68750"
#define kLYCBrideSayScrollViewDetail_b @"http://hunliji.com/p/wedding/index.php/Home/APICommunityPost/PostsList?count=20&no=0&order=asc&thread_id=68750"

#pragma mark -- 新娘说轮播图详情页--第二页 --
#define kLYCBrideSayScrollViewDetail_c @"http://hunliji.com/p/wedding/index.php/Home/APICommunityThread/ThreadDetail/id/68750"
#define kLYCBrideSayScrollViewDetail_d @"http://hunliji.com/p/wedding/index.php/Home/APICommunityPost/PostsList?count=20&no=0&order=asc&thread_id=68750"

#pragma mark -- 新娘说第一区和第三区cell --
#define kLYCBrideSaySectionOne @"http://hunliji.com/p/wedding/index.php/Home/APICommunityThread/ThreadsList?fetch_story=1&page=1&per_page=20"

#pragma mark -- 新娘说第二区cell --
#define kLYCBrideSaySectionTwo @"http://hunliji.com/p/wedding/index.php/Home/APICommunityGroup/GroupsList?cids=1"

#endif
