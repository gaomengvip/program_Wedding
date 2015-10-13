//
//  MoreShopController.m
//  Wedding
//
//  Created by lanou3g on 15/10/12.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "MoreShopController.h"
#import "HLCLController.h"
#import "HSSYController.h"
#import "SYSController.h"
#import "SXSController.h"
#import "HZSController.h"
#import "ZCRController.h"
#import "HSLFController.h"
#import "SCNavTabBarController.h"






@interface MoreShopController ()

@end

@implementation MoreShopController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HLCLController *HLCL = [HLCLController new];
    HLCL.title = @"婚礼策划";
    HSSYController *HSSY = [HSSYController new];
    HSSY.title = @"婚纱摄影";
    SYSController *SYS = [SYSController new];
    SYS.title = @"摄影师";
    SXSController *SXS = [SXSController new];
    SXS.title = @"摄像师";
    HZSController *HZS = [HZSController new];
    HZS.title = @"化妆师";
    ZCRController *ZCR = [ZCRController new];
    ZCR.title = @"主持人";
    HSLFController *HSLF = [HSLFController new];
    HSLF.title = @"婚纱礼服";
    NSArray *array = @[HLCL,HSSY,SYS,SXS,HZS,ZCR,HSLF];
    SCNavTabBarController *scNavTabBar = [[SCNavTabBarController alloc]init];
    scNavTabBar.subViewControllers = array;
    scNavTabBar.showArrowButton = YES;
    [scNavTabBar addParentController:self];
    
    UIBarButtonItem *returnButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemDone) target:self action:@selector(returnNext)];
    self.navigationItem.leftBarButtonItem = returnButton;
    
    
    // Do any additional setup after loading the view.
}

- (void)returnNext{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
