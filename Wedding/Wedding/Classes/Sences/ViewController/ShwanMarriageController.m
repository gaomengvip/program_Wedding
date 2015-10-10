//
//  ShwanMarriageController.m
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanMarriageController.h"

@interface ShwanMarriageController ()

@end

@implementation ShwanMarriageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UISegmentedControl*seg=[[UISegmentedControl alloc]initWithItems:@[@"婚纱",@"礼服",@"婚鞋",@"配饰",@"首饰",@"婚庆用品",@"家居用品"]];
    
    seg.frame=CGRectMake(0, 60, self.view.frame.size.width, 30);
    seg.backgroundColor=[UIColor redColor];
    seg.tintColor=[UIColor whiteColor];
    seg.selectedSegmentIndex=1;
    //seg.apportionsSegmentWidthsByContent=YES;
    seg.layer.cornerRadius=6.5;
    seg.layer.masksToBounds=YES;
    
    
    
    [seg addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:seg];
    
    
    UIButton * button =[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-20, 20, 40, 40)];
    
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button4Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
-(void)button4Action:(UIButton*)sender{
    
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    
}

@end
