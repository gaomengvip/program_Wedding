//
//  ProductionController.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ProductionController.h"
#import "ProductionCell.h"
#import "ProductionModel.h"
#import "PlayController.h"

@interface ProductionController ()
@property (nonatomic,assign)NSInteger currentPage;
@property (nonatomic,assign)NSInteger pagesize;
@end

@implementation ProductionController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.tableView registerNib:[UINib nibWithNibName:@"ProductionCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self shareData];
    

  //  [self.view addSubview:];
    
}



- (void)shareData{
    
    NSURLRequest  *request = [NSURLRequest requestWithURL:[NSURL URLWithString:ProdutionURL]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = dict[@"opus"];
        for (NSDictionary *dict1 in array) {
            ProductionModel *model = [[ProductionModel alloc]init];
            [model setValuesForKeysWithDictionary:dict1];
            [self.productionArray addObject:model];
        }

        [self.tableView reloadData];
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



- (NSMutableArray *)productionArray{
    if (_productionArray == nil) {
        _productionArray = [[NSMutableArray alloc]init];
    }
    return _productionArray;
}

#pragma mark ---tableView代理方法----

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.productionArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ProductionModel *model = self.productionArray[indexPath.row];
    
    cell.model = model;

    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductionModel *model = self.productionArray[indexPath.row];
    NSArray *array = model.items;
    
    PlayController *playVC = [[PlayController alloc]init];
    playVC.str = array[0][@"path"];
    [self.navigationController pushViewController:playVC animated:YES];
    
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
