//
//  ShwanMoreWrokController.m
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanMoreWrokController.h"
#import "ShwanMoreModle.h"
#import "ShwanMoreCell.h"
#import "ShwanHandShare.h"
@interface ShwanMoreWrokController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@end

@implementation ShwanMoreWrokController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    
    
    _tableView.dataSource=self;
    
    _tableView.delegate=self;
    
    [self.tableView registerClass:[ShwanMoreCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_tableView];
    
    
    [[ShwanHandShare share] setWithMoreNumber:self.myNumber URL:^{
        
        [self.tableView reloadData];
        
    }];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    
    
    
    return 1;
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [ShwanHandShare share].moreArray.count;
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ShwanMoreCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    ShwanMoreModle * modle =[ShwanHandShare share].moreArray[indexPath.row];
    
    
    cell.modle=modle;
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    return 280;
    
}

@end
