//
//  headerView4homePage.m
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 蓝欧科技. All rights reserved.
//

#import "headerView4HomePage.h"
#import "UIImageView+WebCache.h"
#import "CarouselFingure.h"
#import "Model4HomePage.h"

#define kurl_Image1 @"http://marry.qiniudn.com/o_19t7s4hbfec5jnm11vlvnvs7ob.png"
#define kurl_Image2 @"http://qnm.hunliji.com/o_19rre1udj1idu1r251ocj19kooqvb.png"
#define kurl_Image3 @"http://marry.qiniudn.com/o_19t7s62lr1ekk1ti3174b1jv71s60b.png"
#define kurl_Image4 @"http://marry.qiniudn.com/o_19t7s6kvp155m6771hc1de19oeb.png"
#define kUrl_HomePage @"http://www.hunliji.com/p/wedding/index.php/home/APIFrontPage/getPosters?device=1&app_version=5.7.2&cid=1"


@interface headerView4homePage()<CarouselFingureDelegate>

@property(nonatomic,strong)Model4HomePage *model;

@end


@implementation headerView4homePage



- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //在init 方法中使用绘图方法,在对象被初始化的时候,自动执行绘制方法
        [self setUp];
        
    }
    return self;
}

-(void)setUp{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 220)];
#pragma mark--headerView添加轮播图--
  
    NSMutableArray *imagesArray = [[NSMutableArray alloc]initWithCapacity:5];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kUrl_HomePage]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSDictionary *mutDictionary = dictionary[@"data"];
    NSArray *sitesArray = mutDictionary[@"sites"];
    for (NSDictionary *dic in sitesArray) {
        if ([dic[@"id" ] isEqualToString:@"1"]) {
            NSArray *postersArray = dic[@"posters"];
            
            for (NSDictionary * postersDictionary in postersArray) {
                _model = [Model4HomePage new];
                [_model setValuesForKeysWithDictionary:postersDictionary];
                UIImage *img = [self requestImageWithUrl:_model.image_path];
                [imagesArray addObject:img];
            }
            
        }
    }

    CarouselFingure *cView = [[CarouselFingure alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 155)];
    cView.backgroundColor = [UIColor redColor];
    cView.imagesArray = imagesArray;
    cView.duration=2;
    cView.delegate = self;
    

    [headerView addSubview:cView];
#pragma mark--headerView添加button--
    UIButton *button1 = [[UIButton alloc]init];
    button1.frame = CGRectMake(0, 160, self.frame.size.width / 4, 60);
    [button1 setTitle:@"找商家" forState:UIControlStateNormal];
    //button图片
    [button1 setImage:[self requestImageWithUrl:kurl_Image1] forState:UIControlStateNormal];
    //button Title
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //title 字体
    [button1 setFont:[UIFont systemFontOfSize:15]];
    //偏移量
    button1.titleEdgeInsets = UIEdgeInsetsMake(40, -162, 0, button1.titleLabel.bounds.size.width);
    button1.imageEdgeInsets = UIEdgeInsetsMake(0,25,20,25);
    [headerView addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.frame = CGRectMake(self.frame.size.width / 4, 160, self.frame.size.width / 4, 60);
    [button2 setTitle:@"婚车租赁" forState:UIControlStateNormal];
    //button图片
    [button2 setImage:[self requestImageWithUrl:kurl_Image2] forState:UIControlStateNormal];
    //button Title
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //title 字体
    [button2 setFont:[UIFont systemFontOfSize:15]];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //偏移量
    button2.titleEdgeInsets = UIEdgeInsetsMake(40, -162, 0, button1.titleLabel.bounds.size.width);
    button2.imageEdgeInsets = UIEdgeInsetsMake(0,25,20,25);
    [headerView addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc]init];
    button3.frame = CGRectMake(2 * self.frame.size.width / 4, 160, self.frame.size.width / 4, 60);
    [button3 setTitle:@"淘婚品" forState:UIControlStateNormal];
    //button图片
    [button3 setImage:[self requestImageWithUrl:kurl_Image3] forState:UIControlStateNormal];
    //button Title
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //title 字体
    [button3 setFont:[UIFont systemFontOfSize:15]];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //偏移量
    button3.titleEdgeInsets = UIEdgeInsetsMake(40, -162, 0, button1.titleLabel.bounds.size.width);
    button3.imageEdgeInsets = UIEdgeInsetsMake(0,25,20,25);
    [headerView addSubview:button3];
    
    UIButton *button4 = [[UIButton alloc]init];
    button4.frame = CGRectMake(3 * self.frame.size.width / 4, 160, self.frame.size.width / 4, 60);
    [button4 setTitle:@"微信请帖" forState:UIControlStateNormal];
    //button图片
    [button4 setImage:[self requestImageWithUrl:kurl_Image4] forState:UIControlStateNormal];
    //button Title
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //title 字体
    [button4 setFont:[UIFont systemFontOfSize:15]];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //偏移量
    button4.titleEdgeInsets = UIEdgeInsetsMake(40, -162, 0, button1.titleLabel.bounds.size.width);
    button4.imageEdgeInsets = UIEdgeInsetsMake(0,25,20,25);
    [headerView addSubview:button4];
    
    [self addSubview:headerView];
    
}

//获取图片
-(UIImage *)requestImageWithUrl:(NSString *)url
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    UIImage *img = [UIImage imageWithData:data];
    return img;
}




/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
