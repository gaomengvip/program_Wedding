//
//  LYCBrideSayController.m
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "LYCBrideSayController.h"
#import "LYCHeader4BrideSayFirstView.h"
#import "LYCBrideSayFirstCell.h"
#import "LYCBrideSaySecondCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeigth [UIScreen mainScreen].bounds.size.height


@interface LYCBrideSayController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//第一分区cell数据所在的数组
@property (nonatomic,strong)NSArray *firstArray;
//第二分区cell数据所在的数组
@property (nonatomic,strong)NSArray *secondArray;
//第三分区cell数据所在的数组
@property (nonatomic,strong)NSArray *thirdArray;


@end

@implementation LYCBrideSayController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //创建底层集合视图
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //创建集合视图
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.view.frame.size.height) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    
    //注册区头
    [collectionView registerClass:[LYCHeader4BrideSayFirstView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerFirst"];
    
    //注册cell
    [collectionView registerNib:[UINib nibWithNibName:@"LYCBrideSayFirstCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
    [collectionView registerNib:[UINib nibWithNibName:@"LYCBrideSaySecondCell" bundle:nil] forCellWithReuseIdentifier:@"cell2"];
    
    
}

#pragma mark -- 分区个数 --
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

#pragma mark -- 每个区之间的距离 --
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    } else if (section == 1) {
        return UIEdgeInsetsMake(10, 10, 0, 10);
    } else {
        return UIEdgeInsetsMake(0, 10, 0, 10);
    }
}


#pragma mark -- 区头大小 --
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(kScreenWidth, 200);
    } else if (section == 1) {
        return CGSizeMake(0, 0);
    } else {
        return CGSizeMake(kScreenWidth, 30);
    }
    
}

#pragma mark -- 设置区头 --
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
            LYCHeader4BrideSayFirstView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerFirst" forIndexPath:indexPath];
            return header;
        } else if (indexPath.section == 1) {
            return nil;
        } else {
            return nil;
        }
        
    } else {
        return nil;
    }
    
}

#pragma mark -- 每个分区items的个数 --
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 4;
    } else if (section == 1) {
        return 3;
    } else {
        return 3;
    }
}

#pragma mark -- 设置每个item的大小 --
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenWidth / 2, 50);
    } else if (indexPath.section == 1) {
        return CGSizeMake(kScreenWidth - 20, 60);
    } else {
        return CGSizeMake(kScreenWidth - 20, 80);
    }
    
}

#pragma mark -- 设置cell --
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        LYCBrideSayFirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        //cell.lab4name.text = @"123";
        return cell;
    } else if (indexPath.section == 1) {
        LYCBrideSaySecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
        
        return cell;
    } else {
        return nil;
    }
    
}


#pragma mark -- 懒加载 --
- (void)setFirstArray:(NSArray *)firstArray{
    if (_firstArray == nil) {
        _firstArray = [NSArray new];
    }
}

- (void)setSecondArray:(NSArray *)secondArray{
    if (_secondArray == nil) {
        _secondArray = [NSArray new];
    }
}

- (void)setThirdArray:(NSArray *)thirdArray{
    if (_thirdArray == nil) {
        _thirdArray = [NSArray new];
    }
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
