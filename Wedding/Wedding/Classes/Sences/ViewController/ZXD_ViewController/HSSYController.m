//
//  HLCLController.m
//  Wedding
//
//  Created by lanou3g on 15/10/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "HSSYController.h"
#import "ShopHandle.h"
#import "ShopCell.h"
#import "ShopModel.h"
#import "SVPullToRefresh.h"


@interface HSSYController ()

@property(nonatomic,assign)NSInteger currentPage;
@property (nonatomic,strong)NSMutableArray *array;

@end

@implementation HSSYController

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentPage = 1;
    NSInteger a = 6;
    [self requestWithUrl:kHLCH_url(a,_currentPage)];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ShopCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    

    //下拉刷新
    __weak typeof(self)weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
//        weakSelf.tableView.frame = CGRectMake(0, 63, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height - 50);
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.pullToRefreshView stopAnimating];
    }];
    //上拉加载
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        weakSelf.currentPage ++;

        [weakSelf requestWithUrl:kHLCH_url(6,weakSelf.currentPage)];

        [weakSelf.tableView.infiniteScrollingView stopAnimating];
    }];
}


- (void)requestWithUrl:(NSString *)string{

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dic = dictionary[@"data"];
        NSArray *mutArray = dic[@"merchants"];
        for (NSDictionary *dict in mutArray) {
            ShopModel *model = [ShopModel new];
            [model setValuesForKeysWithDictionary:dict];
            [self.array addObject:model];
        }
        [self.tableView reloadData];
    }];

}
-(NSMutableArray *)array{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ShopModel *model = self.array[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
