//
//  ShwanViewController.m
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanViewController.h"
#import "ShwanOneController.h"
#import "ShwanTwoController.h"
#import "ShwanThreeController.h"
@interface ShwanViewController ()


@property(nonatomic,strong)ShwanOneController * oneView;
@property(nonatomic,strong)ShwanTwoController * twoView;
@property(nonatomic,strong)ShwanThreeController *threeView;


@end

@implementation ShwanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UISegmentedControl*seg=[[UISegmentedControl alloc]initWithItems:@[@"套餐",@"案例",@"商家"]];
    
    seg.frame=CGRectMake(0, 20, self.view.frame.size.width, 30);
    seg.backgroundColor=[UIColor redColor];
    seg.tintColor=[UIColor whiteColor];
    seg.selectedSegmentIndex=1;
    //seg.apportionsSegmentWidthsByContent=YES;
    seg.layer.cornerRadius=6.5;
    seg.layer.masksToBounds=YES;

    
    _oneView=[ShwanOneController new];
    _twoView=[ShwanTwoController new];
    _threeView=[ShwanThreeController new];
    [self.view addSubview:_oneView.view];
    [self addChildViewController:_oneView];
    [self addChildViewController:_twoView];
    [self addChildViewController:_threeView];
    
    seg.selectedSegmentIndex =1;
    
    [seg addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:seg];
    
    
}
-(void)changePage:(UISegmentedControl*)seg{
    
    if (seg.selectedSegmentIndex==0) {
        [_twoView.view removeFromSuperview];
        [_threeView.view removeFromSuperview];
        [self.view insertSubview:_oneView.view atIndex:0];
    }else if (seg.selectedSegmentIndex==1) {
        [_oneView.view removeFromSuperview];
        [_threeView.view removeFromSuperview];
        [self.view insertSubview:_twoView.view atIndex:0];
    }else{
    
    
        [_oneView.view removeFromSuperview];
        [_twoView.view removeFromSuperview];
        [self.view insertSubview:_threeView.view atIndex:0];
    
    }
    
    
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
