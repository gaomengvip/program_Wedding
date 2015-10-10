//
//  LYCBrideSayController.m
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "LYCBrideSayController.h"
#import "LYCBrideSayFirstCell.h"
#import "LYCBrideSaySecondCell.h"
#import "LYCBrideSayHeadHelper.h"
#import "CarouselFingure.h"
#import "UIImageView+WebCache.h"
#import "LYCBrideSayThirdCell.h"
#import "LYCBrideSayThirdCell2.h"

@interface LYCBrideSayController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CarouselFingureDelegate>

//轮播图
@property(nonatomic,strong)CarouselFingure *cView;

//第一分区cell数据所在的数组
//@property (nonatomic,strong)NSArray *headArray;
//第二分区cell数据所在的数组
@property (nonatomic,strong)NSArray *firstArray;
//第三分区cell数据所在的数组
@property (nonatomic,strong)NSArray *secondArray;
//第四分区cell数据所在的数组
@property (nonatomic,strong)NSArray *thirdArray;
@end

@implementation LYCBrideSayController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //创建底层集合视图
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //每列之间的最小距离
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    //创建集合视图
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.view.frame.size.height) collectionViewLayout:flowLayout];
    
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    
    //数据解析
    //一区cell
    [[LYCBrideSayHeadHelper sharedHelper] requestAllSectionOneAndSenctionThreeWithBlock:^{
        [collectionView reloadData];
    }];
    //二区cell
    [[LYCBrideSayHeadHelper sharedHelper] requestAllSectionTwoWithBlock:^{
        [collectionView reloadData];
    }];
    
   //注册区头
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerFirst"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    //注册区尾
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
 

    
    //注册cell
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [collectionView registerNib:[UINib nibWithNibName:@"LYCBrideSayFirstCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
    [collectionView registerNib:[UINib nibWithNibName:@"LYCBrideSaySecondCell" bundle:nil] forCellWithReuseIdentifier:@"cell2"];
    [collectionView registerNib:[UINib nibWithNibName:@"LYCBrideSayThirdCell" bundle:nil] forCellWithReuseIdentifier:@"cell3"];
    [collectionView registerNib:[UINib nibWithNibName:@"LYCBrideSayThirdCell2" bundle:nil] forCellWithReuseIdentifier:@"cell4"];
    
    
    
    
     [self.view addSubview:collectionView];
    
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
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}


#pragma mark -- 区头大小 --
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(kScreenWidth, 155);
    } else if (section == 1) {
        return CGSizeMake(0, 0);
    } else {
        return CGSizeMake(kScreenWidth, 40);
    }
    
}

#pragma mark -- 设置区头 --
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
            
            UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerFirst" forIndexPath:indexPath];
            
            //header.frame = CGRectMake(0, 0, self.view.frame.size.width, 155);//此处可以省略
            //数据解析
            [[LYCBrideSayHeadHelper sharedHelper] requestAllHeadWithBlock:^{
                
                _cView = [[CarouselFingure alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 155)];
                _cView.imagesArray = [LYCBrideSayHeadHelper sharedHelper].imagesArray;
                _cView.duration= 0.5;
                _cView.delegate = self;
                [collectionView reloadData];

            }];
            [header addSubview:_cView];
            return header;
            
        } else if (indexPath.section == 1) {
            UICollectionReusableView *header1 = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
 
            return header1;
        } else {
            UICollectionReusableView *header2 = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
            
            //header2.frame = CGRectMake(0, 0, kScreenWidth, 25);
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 200, 15)];
            label.text = @"热门推荐";

            [header2 addSubview:label];
            
            return header2;
        }
        
    } else {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
        return footer;
    }
    
}

#pragma mark -- 每个分区items的个数 --
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return [LYCBrideSayHeadHelper sharedHelper].sectionOneArray.count;
    } else if (section == 1) {
        
        return [LYCBrideSayHeadHelper sharedHelper].sectionSecondArray.count + [LYCBrideSayHeadHelper sharedHelper].sectionSecondArray2.count;//决不能用具体数字
    } else {
        return [LYCBrideSayHeadHelper sharedHelper].sectionThreeArray.count;
    }
}



#pragma mark -- 设置每个item的大小 --
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenWidth / 2, 50);
    } else if (indexPath.section == 1) {
        return CGSizeMake(kScreenWidth - 20, 60);
    } else {
        LYCBrideSayHeadItem *item3 = [LYCBrideSayHeadItem new];
        item3 = [LYCBrideSayHeadHelper sharedHelper].sectionThreeArray[indexPath.row];
        if (item3.post.allKeys.count == 3) {
            return CGSizeMake(kScreenWidth, 200);
        } else{
            return CGSizeMake(kScreenWidth, 105);
        }
        
    }
    
}

#pragma mark -- 设置cell --
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //判断区
    

    if (indexPath.section == 0) {
        LYCBrideSayFirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        LYCBrideSayHeadItem *item = [LYCBrideSayHeadItem new];
        item = [LYCBrideSayHeadHelper sharedHelper].sectionOneArray[indexPath.row];
        
        cell.lab4name.text = item.tag[@"name"];
        
        NSArray *array = item.tag[@"colorRGB"];
#pragma mark -- 此处必须判断array中是否有值,方法如下 --
        //判断数组是否为空
        if ([array isKindOfClass:[NSNull class]]) {
            cell.lab4name.backgroundColor = [UIColor whiteColor];
        } else {
        // *********************************************************
            float r = [array[0] floatValue]/255.0;
            float g = [array[1] floatValue]/255.0;
            float b = [array[2] floatValue]/255.0;
            cell.lab4name.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
        }
        
        cell.lab4good_title.text = item.good_title;
        
        return cell;
    } else if (indexPath.section == 1) {
        
        LYCBrideSaySecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
        
        cell.layer.borderWidth = 0.5;
        cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        //不同位置.cell内容不一样
        if (indexPath.row < [LYCBrideSayHeadHelper sharedHelper].sectionSecondArray.count) {
            LYCBrideSayHeadItem *item = [LYCBrideSayHeadItem new];
            item = [LYCBrideSayHeadHelper sharedHelper].sectionSecondArray[indexPath.row];
            [cell.imgView sd_setImageWithURL:[NSURL URLWithString:item.image]];
            cell.lab4title.text = item.title;
            cell.lab4title2.text = item.latest_refine[@"title"];
            cell.lab4title2.font = [UIFont systemFontOfSize:14];
            cell.lab4addCount.text = [NSString stringWithFormat:@"今日%ld",item.added_threads_count];
            cell.lab4addCount.font = [UIFont systemFontOfSize:12];
            cell.lab4addCount.backgroundColor = [UIColor cyanColor];
        } else {
#pragma mark -- 此处必须用sectionSencondArray2接受,另外,注意属性的数据类型不能写错 --
            LYCBrideSayHeadItem *item2 = [LYCBrideSayHeadItem new];
            item2 = [LYCBrideSayHeadHelper sharedHelper].sectionSecondArray2[0];
            [cell.imgView sd_setImageWithURL:[NSURL URLWithString:item2.entry_img]];
            cell.lab4title.text = item2.entry_name;
            cell.lab4title2.text =  item2.story_title;
            cell.lab4addCount.text = @"";
            cell.lab4addCount.backgroundColor = [UIColor whiteColor];
        }

        return cell;
    }else{
        
        LYCBrideSayHeadItem *item3 = [LYCBrideSayHeadItem new];
        item3 = [LYCBrideSayHeadHelper sharedHelper].sectionThreeArray[indexPath.row];
        
        if (item3.post.allKeys.count == 3) {
            
            LYCBrideSayThirdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell3" forIndexPath:indexPath];
            
            cell.layer.borderWidth = 0.2;
            cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
            cell.lab4name.text = item3.tag[@"name"];
            NSArray *array = item3.tag[@"colorRGB"];
            //判断数组是否为空
            if ([array isKindOfClass:[NSNull class]]) {
                cell.lab4name.backgroundColor = [UIColor whiteColor];
            } else {
                float r = [array[0] floatValue]/255.0;
                float g = [array[1] floatValue]/255.0;
                float b = [array[2] floatValue]/255.0;
                cell.lab4name.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
                
                
            }
            
            //判断item3.good_title中是否有值
            if (![item3.good_title isKindOfClass:[NSNull class]]) {
                cell.lab4good_title.text = item3.good_title;
            } else {
                cell.lab4good_title.text = @"";
            }
            
            //判断item3.post[@"message"]是否有值
            if (![item3.post[@"message"] isKindOfClass:[NSNull class]]) {
                cell.lab4menssge.text = item3.post[@"message"];
            } else {
                cell.lab4menssge.text = @"";
            }
            
            cell.lab4auther_nick.text = item3.author_nick;
            cell.lab4praised_sum.text = item3.praised_sum;
            cell.lab4post_count.text = [NSString stringWithFormat:@"%@",item3.post_count];
            
            //判断是否有图片
            
            NSArray *array2 = [NSArray array];
            array2 = item3.post[@"media_items"];
            NSArray *array3 = @[cell.imgView1,cell.imgView2,cell.imgView3];
            for (int i = 0; i < array2.count; i ++) {
                [array3[i] sd_setImageWithURL:[NSURL URLWithString:array2[i][@"path"]]];// ****************************
                
            }
            return cell;
            
        } else{
            LYCBrideSayThirdCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell4" forIndexPath:indexPath];
            
            cell.layer.borderWidth = 0.5;
            cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
            
            cell.lab4name.text = item3.tag[@"name"];
            NSArray *array = item3.tag[@"colorRGB"];
            //判断数组是否为空
            if ([array isKindOfClass:[NSNull class]]) {
                cell.lab4name.backgroundColor = [UIColor whiteColor];
            } else {
                cell.lab4name.backgroundColor = [UIColor colorWithRed: 1.0 * ((int)array[0]/255.0) green:1.0 *((int)array[1]/255.0) blue:1.0 *((int)array[2]/255.0) alpha:0.5];
            }
            
            //判断item3.good_title中是否有值
            if (![item3.good_title isKindOfClass:[NSNull class]]) {
                cell.lab4good_title.text = item3.good_title;
            } else {
                cell.lab4good_title.text = @"";
            }
            
            //判断item3.post[@"message"]是否有值
            if (![item3.post[@"message"] isKindOfClass:[NSNull class]]) {
                cell.lab4menssge.text = item3.post[@"message"];
            } else {
                cell.lab4menssge.text = @"";
            }
            
            cell.lab4author_nick.text = item3.author_nick;
            cell.lab4praised_sum.text = item3.praised_sum;
            cell.lab4post_count.text = [NSString stringWithFormat:@"%@",item3.post_count];

            return cell;

                
        }
        
    }

}


#pragma mark -- 懒加载 --
- (NSArray *)firstArray{
    if (_firstArray == nil) {
        _firstArray = [NSArray new];
    }
    return _firstArray;
}


- (NSArray *)secondArray{
    if (_secondArray == nil) {
        _secondArray = [NSArray new];
    }
    return _secondArray;
}

- (NSArray *)thirdArray{
    if (_thirdArray == nil) {
        _thirdArray = [NSArray new];
    }
    return _thirdArray;
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
