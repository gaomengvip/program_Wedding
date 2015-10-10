//
//  ShwanWeddingMoreController.m
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanWeddingMoreController.h"
#import "ShwanMoreCaseController.h"
#include "ShwanMoreWrokController.h"
@interface ShwanWeddingMoreController ()



@property(nonatomic,strong)ShwanMoreCaseController * caseView;

@property(nonatomic,strong)ShwanMoreWrokController * workView;

@end

@implementation ShwanWeddingMoreController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UISegmentedControl*seg=[[UISegmentedControl alloc]initWithItems:@[@"套餐",@"案例"]];
    
    seg.frame=CGRectMake(0, 60, self.view.frame.size.width, 30);
    seg.backgroundColor=[UIColor redColor];
    seg.tintColor=[UIColor whiteColor];
    seg.selectedSegmentIndex=1;
    //seg.apportionsSegmentWidthsByContent=YES;
    seg.layer.cornerRadius=6.5;
    seg.layer.masksToBounds=YES;
    
    
    _caseView=[ShwanMoreCaseController new];
    _workView=[ShwanMoreWrokController new];
   
    [self.view addSubview:_caseView.view];
    [self addChildViewController:_caseView];
    [self addChildViewController:_workView];
  
    
    seg.selectedSegmentIndex =0;
    
    [seg addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:seg];
    
    
    UIButton * button =[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-20, 20, 40, 40)];
    
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button4Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
}
-(void)changePage:(UISegmentedControl*)seg{
    
    if (seg.selectedSegmentIndex==0) {
        
        [_workView.view removeFromSuperview];
        [self.view insertSubview:_caseView.view atIndex:0];
    
    }else{
        
        
        [_caseView.view removeFromSuperview];
        
        [self.view insertSubview:_workView.view atIndex:0];
        
    }
    
    
}

-(void)button4Action:(UIButton*)sender{
    
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    
}


@end
