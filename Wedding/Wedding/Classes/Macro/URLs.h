//
//  URLs.h
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#ifndef Wedding_URLs_h
#define Wedding_URLs_h
//首页界面
#define kUrl_HomePage @"http://www.hunliji.com/p/wedding/index.php/home/APIFrontPage/getPosters?device=1&app_version=5.7.2&cid=1"
//首页下方collectionView
#define kSelect @"http://hunliji.com/p/wedding/index.php/home/APIFrontPage/getHotMeals?cid=1"
//超值套餐
#define kTaocan @"http://www.hunliji.com/p/wedding/index.php/home/APIFrontPage/getSetMeals?cid=1"
//更多套餐
#define kMoreCombo(id,page) [NSString stringWithFormat:@"http://www.hunliji.com/p/wedding/index.php/home/APIFrontPage/getMealPerpage?cid=1&per_page=20&type=2&tag_id=%@&page=%ld",id,page]

//更多案例
#define kMoreCase(id,page) [NSString stringWithFormat:@"http://www.hunliji.com/p/wedding/index.php/home/APIFrontPage/getMealPerpage?cid=1&per_page=20&type=3&tag_id=%@&page=%ld",id,page]


//商家推荐
#define URL_Shangjia @"http://hunliji.com/p/wedding/index.php/home/APIFrontPage/getMerchants?cid="
//商家推荐(更多)[property:婚纱策划(2),婚纱摄影(6)摄影师(7),摄像师(8),化妆师(9),主持人(11),婚纱礼服(12)]
#define kHLCH_url(property,page) [NSString stringWithFormat:@"http://www.hunliji.com/p/wedding/index.php/home/APIMerchant/getMerchant?per_page=20&property=%ld&city=1&page=%ld",property,page]




//套餐详情

#define kDetailURL(catid) [NSString stringWithFormat:@"http://www.hunliji.com/p/wedding/index.php/home/APIMerchant/GetMealsInfo/id/%@",catid]
//更多超值折扣
#define kAllCombo(page) [NSString stringWithFormat:@"http://www.hunliji.com/p/wedding/index.php/home/APIFrontPage/getSetMeals?cid=1&page=%ld&per_page=20",page]

//店铺详情页
#define kStoreUrl(id) [NSString stringWithFormat:@"http://www.hunliji.com/exhibit/merchants/%@",id]
//http://www.hunliji.com/exhibit/merchants/16493

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










#define ProdutionURL @"http://www.hunliji.com/opus.json?city=0&page=1&property=0&sort=0"

#endif
