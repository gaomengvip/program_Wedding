//
//  MoewcomboController.m
//  Wedding
//
//  Created by lanou3g on 15/10/11.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "MoewcomboController.h"
#import "SVPullToRefresh.h"
#import "ComboHandle.h"
#import "detailModel.h"
#import "LastCollectionCell.h"
#import "HomePageDetailController.h"


@interface MoewcomboController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,assign)NSInteger correntPage;

@property (nonatomic,strong)NSMutableArray *setMealArray;


@end

@implementation MoewcomboController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _correntPage = 1;
    self.title = @"套餐";
    [self makeDate];
    
    _flowLayout =[[UICollectionViewFlowLayout alloc]init];
    _flowLayout.minimumInteritemSpacing = 0;
    _flowLayout.minimumLineSpacing = 0;
    _flowLayout.itemSize = CGSizeMake(self.view.frame.size.width / 2, 130);
    _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    /**
     collectionView
     */
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:_flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;

    
    
    
    
    
    // Do any additional setup after loading the view.
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [_collectionView registerNib:[UINib nibWithNibName:@"LastCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"MoreComboCell"];
    // Do any additional setup after loading the view.
    UIBarButtonItem *returnButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemDone) target:self action:@selector(returnNext)];
    self.navigationItem.leftBarButtonItem = returnButton;
    
    
    
    //下拉刷新
    __weak typeof(self)weakSelf = self;
    [self.collectionView addPullToRefreshWithActionHandler:^{
        weakSelf.collectionView.frame = CGRectMake(0, 63, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height - 50);
        [weakSelf.collectionView reloadData];
        [weakSelf.collectionView.pullToRefreshView stopAnimating];
    }];
    //上拉加载
    [self.collectionView addInfiniteScrollingWithActionHandler:^{
        weakSelf.correntPage ++;
        [weakSelf makeDate];
        [weakSelf.collectionView.infiniteScrollingView stopAnimating];
    }];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
}

- (void)returnNext{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.setMealArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LastCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MoreComboCell" forIndexPath:indexPath];
    Model4SetMeal *model = self.setMealArray[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (void)makeDate{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kMoreCombo(_moreString,_correntPage)]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = dic[@"data"];
        for (NSDictionary *dictionary in array) {
            Model4SetMeal *setMealModel = [Model4SetMeal new];
            [setMealModel setValuesForKeysWithDictionary:dictionary];
            [self.setMealArray addObject:setMealModel];
        }
        [self.collectionView reloadData];
    }];

}


-(NSMutableArray *)setMealArray{
    if (_setMealArray == nil) {
        _setMealArray = [NSMutableArray array];
    }
    return _setMealArray;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Model4SetMeal *model = self.setMealArray[indexPath.row];
    HomePageDetailController *detailVC = [HomePageDetailController new];
    detailVC.ID = model.ID;
    [self presentViewController:detailVC animated:YES completion:nil];
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
