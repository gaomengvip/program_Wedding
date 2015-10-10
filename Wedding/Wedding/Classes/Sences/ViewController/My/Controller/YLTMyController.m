//
//  YLTMyController.m
//  Wedding
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "YLTMyController.h"
#import "YLTMyCell.h"
#import "YLTMyHeaderView.h"
#import "EditController.h"
#import "LoginController.h"

@interface YLTMyController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation YLTMyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(170, 30);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width,150);


    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册cell
    [collectionView registerNib:[UINib nibWithNibName:@"YLTMyCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    //注册头
    [collectionView registerNib:[UINib nibWithNibName:@"YLTMyHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"myheader"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    
    //注册区尾
    [collectionView registerClass:[UICollectionElementKindSectionFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
    
    [self.view addSubview:collectionView];

}


#pragma mark ----collection的代理方法-----

//设置分区的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}



//设置条目的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 4;
    }else if (section == 2){
        return 1;
    }else{
        return 2;
    }

}

//设置cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YLTMyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.lab4Text.text = @"我的钱包";
            cell.img4pic.image = [UIImage imageNamed:@"my1"];
        }else{
            cell.lab4Text.text = @"我的订单";
            cell.img4pic.image = [UIImage imageNamed:@"my2"];
        }
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.lab4Text.text = @"收藏的套餐/案例";
            cell.img4pic.image = [UIImage imageNamed:@"my3"];
            
        }else if (indexPath.row == 1){
            cell.lab4Text.text = @"收藏的商品";
            cell.img4pic.image = [UIImage imageNamed:@"my4"];
        }else if (indexPath.row == 2){
            cell.lab4Text.text = @"收藏的酒店";
            cell.img4pic.image = [UIImage imageNamed:@"my5"];
        }else{
            cell.lab4Text.text = @"关注的商家";
            cell.img4pic.image = [UIImage imageNamed:@"my6"];
        }
    }else if (indexPath.section == 2){
        cell.lab4Text.text = @"参加的活动";
        cell.img4pic.image = [UIImage imageNamed:@"my7"];
        
    }else if(indexPath.section == 3) {
        if (indexPath.row == 0) {
            cell.lab4Text.text = @"话题";
            cell.img4pic.image = [UIImage imageNamed:@"my8"];
            
        }else{
            cell.lab4Text.text = @"关注的人";
            cell.img4pic.image = [UIImage imageNamed:@"my9"];
            
        }
    }else if (indexPath.row == 0) {
        cell.lab4Text.text = @"联系客服";
        cell.img4pic.image = [UIImage imageNamed:@"my10"];
        
    }else{
        cell.lab4Text.text = @"设置";
        cell.img4pic.image = [UIImage imageNamed:@"my11"];
    }
    
    
    return cell;
    
}


//判断区头或者区尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
            //取出区头
            YLTMyHeaderView *myheader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"myheader" forIndexPath:indexPath];
            myheader.img4pic.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
            [myheader.img4pic addGestureRecognizer:tap];
            myheader.backgroundColor = [UIColor lightGrayColor];
            
            [myheader.btn4login addTarget:self action:@selector(loginPage:) forControlEvents:UIControlEventTouchUpInside];
            return myheader;
        }else{
            UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
            header.backgroundColor = [UIColor colorWithRed:221/255.0 green:168/255.0 blue:158/255.0 alpha:1];
            return header;
        }
        
        
    }else{
        //取出区尾
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind  withReuseIdentifier:@"footer" forIndexPath:indexPath];
        return footer;
    }
}


//item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(180, 30);
    }else{
        return CGSizeMake(self.view.frame.size.width - 20, 30);
    }
}

//设置区头高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(375, 150);
    }else {
        return CGSizeMake(375, 8);
    }
    
}







/* 定义每个UICollectionView 的边缘 */
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 5, 10, 5);//上 左 下 右
}


#pragma mark ----- 跳转页面 ------
- (void)tapAction{
    EditController  *edit = [[EditController alloc]init];
    [self.navigationController pushViewController:edit animated:YES];
    
}

- (void)loginPage:(UIButton *)button{
    
    LoginController *login = [[LoginController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
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
