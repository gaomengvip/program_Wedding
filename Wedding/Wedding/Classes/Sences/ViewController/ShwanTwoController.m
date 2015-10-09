//
//  ShwanTwoController.m
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanTwoController.h"
#import "ShwanHandShare.h"
#import "ShwanpackageModle.h"
#import "ShwanPackerCellTableViewCell.h"
@interface ShwanTwoController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,strong)NSMutableArray * array;



@end

@implementation ShwanTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    
    
    _tableView.dataSource=self;
    
    _tableView.delegate=self;
    
    [self.tableView registerClass:[ShwanPackerCellTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_tableView];
    
    

    
    [[ShwanHandShare share]setWithNumber:@"6" URL:^{
        
        [self.tableView reloadData];
        
    }];
    

}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{





    return 1;
    
    

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return [ShwanHandShare share].array.count;

}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    ShwanPackerCellTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    ShwanpackageModle * modle =[ShwanHandShare share].array[indexPath.row];


    cell.modle=modle;

    return cell;


}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{




    return 280;

}


@end
