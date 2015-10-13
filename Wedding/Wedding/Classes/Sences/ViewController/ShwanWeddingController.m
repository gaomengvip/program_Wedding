//
//  ShwanWeddingController.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanWeddingController.h"
#import "ShwanWeddCell.h"
#import "ShwanModleWeddingdress.h"
#import "UIImageView+WebCache.h"

@interface ShwanWeddingController ()<UICollectionViewDelegate,UICollectionViewDataSource>


@property(nonatomic,strong)UIImageView * imagView;
@property(nonatomic,strong)UICollectionView * collectionView;
@end

@implementation ShwanWeddingController



-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{



    if (self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self collectionView];
    }


    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  
}





-(UICollectionView*)collectionView{
    
    
    if (_collectionView ==nil) {
        
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        
        layout.itemSize=CGSizeMake(self.view.frame.size.width/3, 110);
        layout.minimumLineSpacing=0;
        layout.minimumInteritemSpacing=0;
        layout.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 250) collectionViewLayout:layout];
        self.collectionView.delegate=self;
        self.collectionView.dataSource=self;
        self.collectionView.backgroundColor=[UIColor whiteColor];
        [self.collectionView registerClass:[ShwanWeddCell class] forCellWithReuseIdentifier:@"weddcell"];

        
        [self.view addSubview:_collectionView];
    }
    
    
    return _collectionView;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{


    return 1;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{



    return _imageViewArray.count;

}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{


    ShwanWeddCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"weddcell" forIndexPath:indexPath];
    ShwanModleWeddingdress*modle =_imageViewArray[indexPath.row];
    
    cell.backgroundColor=[UIColor whiteColor];
  [cell.weddingView sd_setImageWithURL:[NSURL URLWithString:modle.image_path]];
  cell.titleLable.text=modle.name;
    return cell;


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
