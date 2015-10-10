//
//  RootViewController.m
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "RootViewController.h"
#import "HomePageController.h"
#import "ShwanClassificationController.h"
#import "LYCBrideSayController.h"
//#import "YLTMyController.h"
#import "YLTToolController.h"
#import "ProductionController.h"

@interface RootViewController ()
@property (nonatomic,strong)UIImage *image;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomePageController *homeVC = [[HomePageController alloc]init];
    UINavigationController *homeNC = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    ShwanClassificationController *classificationVC = [[ShwanClassificationController alloc]init];
    UINavigationController *classificationNC= [[UINavigationController alloc]initWithRootViewController:classificationVC];
    
    LYCBrideSayController *brideSayVC = [[LYCBrideSayController alloc]init];
    UINavigationController *brideSayNC = [[UINavigationController alloc]initWithRootViewController:brideSayVC];
    
    YLTToolController *toolVC = [[YLTToolController alloc]init];
    UINavigationController *toolNC = [[UINavigationController alloc]initWithRootViewController:toolVC];
    
    YLTToolController *myVC = [[YLTToolController alloc]init];
    UINavigationController *myNC = [[UINavigationController alloc]initWithRootViewController:myVC];
    
    
    ProductionController *productVC = [[ProductionController alloc]init];
    UINavigationController *productionNC = [[UINavigationController alloc]initWithRootViewController:productVC];
    
    NSArray *rainBow = @[homeNC,classificationNC,brideSayNC,productionNC,toolNC,myNC];
    self.viewControllers = rainBow;
    
    
    //字体颜色
    self.tabBar.tintColor = [UIColor colorWithRed:224/255.0 green:151/255.0 blue:142/255.0 alpha:1];
    
    //导航颜色
    self.tabBar.barTintColor = [UIColor whiteColor];
    
    //透明度
    self.tabBar.translucent = YES;
    
    _image = [_image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _image = [UIImage imageNamed:@"1.png"];
    homeVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:_image selectedImage:_image];
    
    
    _image = [UIImage imageNamed:@"2.png"];
    classificationVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"分类" image:_image selectedImage:_image];
    
    
    _image = [UIImage imageNamed:@"3.png"];
    brideSayVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"新娘说" image:_image selectedImage:_image];
    
    _image = [UIImage imageNamed:@"4.png"];
    _image = [_image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    toolVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"工具" image:_image selectedImage:_image];
    
    _image = [UIImage imageNamed:@"5"];
    _image = [_image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:_image selectedImage:_image];

    
    
    _image = [UIImage imageNamed:@"6"];
    productVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"作品" image:_image selectedImage:_image];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
