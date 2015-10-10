//
//  ShwanThreeController.m
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanThreeController.h"
#import "ShwanHandShare.h"
#import "ShwanMerchantsCell.h"
#import "Shwanmerchant.h"
@interface ShwanThreeController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@end

@implementation ShwanThreeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    
    
    _tableView.dataSource=self;
    
    _tableView.delegate=self;
    
    [self.tableView registerClass:[ShwanMerchantsCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_tableView];
    
    
    
    
   [[ShwanHandShare share] setWithMerchantNumber:self.Mynumber URL:^{
       
       [self.tableView reloadData];
       
   }];
    
    
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    
    
    
    return 1;
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [ShwanHandShare share].merchantArray.count;
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ShwanMerchantsCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Shwanmerchant * modle =[ShwanHandShare share].merchantArray[indexPath.row];
    
    
    cell.Modle=modle;
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    return 100;
    
}

@end
