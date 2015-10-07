//
//  HomePageController.m
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "HomePageController.h"
#import "headerView4HomePage.h"
#import "OneSectionCollectionCell.h"
#import "BannerCell.h"
#import "ThreeSectionCell.h"


@interface HomePageController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;


@end

@implementation HomePageController

-(instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tableView.backgroundColor = [UIColor whiteColor];
//添加collectionView
    //约束
    _flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _flowLayout.minimumInteritemSpacing = 0;
    _flowLayout.minimumLineSpacing = 0;
    _flowLayout.itemSize = CGSizeMake(self.view.frame.size.width / 2, 70);
    _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //collectionView
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 210) collectionViewLayout:_flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    
    //系统注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    //firstSecond注册(xib)
    [_collectionView registerNib:[UINib nibWithNibName:@"OneSectionCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"firstSection"];
    //bannerView注册
    [self.tableView registerNib:[UINib nibWithNibName:@"BannerCell" bundle:nil] forCellReuseIdentifier:@"bannerCell"];
    //threeSection 注册
    [self.tableView registerNib:[UINib nibWithNibName:@"ThreeSectionCell" bundle:nil] forCellReuseIdentifier:@"threeSectionCell"];
    
    
    headerView4homePage *headerView = [[headerView4homePage alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 230)];
    self.tableView.tableHeaderView = headerView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 3) {
        return 1;
    }else if (section == 2){
        return 3;
    }
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        [cell addSubview:_collectionView];
        return cell;
    }else if (indexPath.section == 1){
        BannerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bannerCell" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 2){
        ThreeSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeSectionCell" forIndexPath:indexPath];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        return cell;
    }
    // Configure the cell...
}


//row 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 210;
    }else if (indexPath.section == 1){
        return 70;
    }else if (indexPath.section == 2){
        return 100;
    }
    else{
        return 40;
    }
}

#pragma mark--区头区尾--
//区头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        NSString *string = @"超值套餐";
        return string;
    }
    return nil;
}
//区尾视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    view.backgroundColor = [UIColor yellowColor];
    if (section == 2) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
        [button setTitle:@"更多超值折扣" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [view addSubview:button];
        view.userInteractionEnabled = YES;
        return view;
    }else{
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 20)];
        view.backgroundColor = [UIColor whiteColor];
        return view;
    }
}
//区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 30;
    }
    return 0.0f;
}



//add collectionView
#pragma mark - Collection view data source
//返回item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

//item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OneSectionCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"firstSection" forIndexPath:indexPath];
    return cell;
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
