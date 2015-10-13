//
//  AllComboCollection.m
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "AllComboCollection.h"
#import "Model4SetMeal.h"
#import "ThreeSectionCell.h"
#import "SVPullToRefresh.h"
#import "HomePageDetailController.h"


@interface AllComboCollection ()

@property (nonatomic,strong)NSMutableArray *setMealArray;
@property (nonatomic,assign)NSInteger correntPage;

@end

@implementation AllComboCollection


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"超值套餐";
//    self.navigationController.navigationBar.alpha = 1;
    
    UIBarButtonItem *returnButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemDone) target:self action:@selector(returnNext)];
    self.navigationItem.leftBarButtonItem = returnButton;
    _correntPage = 1;
    [self makeDate];
    [self.tableView registerNib:[UINib nibWithNibName:@"ThreeSectionCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    //下拉刷新
    __weak typeof(self)weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        weakSelf.tableView.frame = CGRectMake(0, 63, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height - 50);
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.pullToRefreshView stopAnimating];
    }];
    //上拉加载
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        weakSelf.correntPage ++;
        [weakSelf makeDate];
    }];
}

- (void)returnNext{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    return self.setMealArray.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ThreeSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Model4SetMeal *model = self.setMealArray[indexPath.row];
    cell.model = model;
    
    return cell;
}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Model4SetMeal *model = self.setMealArray[indexPath.row];
    HomePageDetailController *detailVC = [HomePageDetailController new];
    detailVC.ID = model.ID;
    NSLog(@"%@",detailVC.ID);
    [self presentViewController:detailVC animated:NO completion:nil];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


//数据解析
- (void)makeDate{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kAllCombo(_correntPage)]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dataDictionary = dictionary[@"data"];
        NSArray *resultArray = dataDictionary[@"result"];
        for (NSDictionary *resulrDic in resultArray) {
            Model4SetMeal *model = [Model4SetMeal new];
            [model setValuesForKeysWithDictionary:resulrDic];
            [self.setMealArray addObject:model];
        }
        [self.tableView reloadData];
    }];
}

-(NSMutableArray *)setMealArray{
    if (_setMealArray == nil) {
        _setMealArray = [NSMutableArray array];
    }
    return _setMealArray;
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
