//
//  HomePageDetailController.m
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "HomePageDetailController.h"
#import "detailCell.h"
#import "ComboHandle.h"
#import "detailModel.h"

@interface HomePageDetailController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UIScrollView *scrollerView;
//第一个模块的view
@property(nonatomic,strong)UIView *firstView;
//第二个模块
@property(nonatomic,strong)UIView *SecondView;
//第三个模块
@property(nonatomic,strong)UIButton *ComboButton;
@property (nonatomic,strong)UILabel *comboLable;
@property(nonatomic,strong)UIButton *titleLable;
@property(nonatomic,strong)UILabel *detailLable;





//第四个模块

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong)UILabel *lable;




@end

@implementation HomePageDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _scrollerView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    _scrollerView.bounces = NO;
    _scrollerView.alwaysBounceVertical = NO;
    _scrollerView.alwaysBounceHorizontal = NO;
    _scrollerView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview: _scrollerView];
    
    
    
    UIView *TopView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 18)];
    TopView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:TopView];

    
    UIButton *returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.frame = CGRectMake(0, 5, 20, 20);
    [returnButton setImage:[UIImage imageNamed:@"left.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnNext) forControlEvents:UIControlEventTouchUpInside];
    [returnButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    UIButton *collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    collectButton.frame = CGRectMake(self.view.frame.size.width - 80, 3, 25, 25);
    [collectButton setImage:[UIImage imageNamed:@"collect.png"] forState:UIControlStateNormal];
    [collectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(self.view.frame.size.width - 40, 5, 20, 20);
    [shareButton setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 18, self.view.frame.size.width, 35)];
    view.backgroundColor = [UIColor whiteColor];
    [view addSubview:returnButton];
    [view addSubview:collectButton];
    [view addSubview:shareButton];
    
    
    
    _lable = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 40, 190, 40, 20)];
    _lable.font = [UIFont systemFontOfSize:12];
    _lable.tintColor = [UIColor whiteColor];
    
    _flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _flowLayout.minimumInteritemSpacing = 0;
    _flowLayout.minimumLineSpacing = 0;
    _flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, 300);
    _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    /**
     collectionView
     */
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 18, self.view.frame.size.width, 350) collectionViewLayout:_flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
//    _collectionView.scrollEnabled = NO;
    

    [_collectionView registerNib:[UINib nibWithNibName:@"detailCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    //注册
    
    [_scrollerView addSubview:_collectionView];
    [_scrollerView addSubview:_lable];
    [self.view addSubview:view];
//    [_scrollerView addSubview:returnButton];
//    [_scrollerView addSubview:shareButton];
//    [_scrollerView addSubview:collectButton];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
  //第一个模块
    [[ComboHandle shareHandle]requestDateWithId:kDetailURL(_ID) finish:^{
        _comboLable.text = [ComboHandle shareHandle].dictionary[@"describe"];
        _detailLable.text = [ComboHandle shareHandle].dictionary[@"purchase_notes"];

        NSLog(@"%@",_detailLable.text);
        [self.collectionView reloadData];
        [self drawView];
        [_scrollerView addSubview:_firstView];

    }];
  //第二个模块
    [self drawSecondModule];
    //第三个模块
    [self drawThirdModule];
    [self drawFourthModule];
    _scrollerView.contentSize = CGSizeMake(self.view.frame.size.width,  (int)(_detailLable.frame.origin.y + _detailLable.frame.size.height + 50));


    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [ComboHandle shareHandle].dateArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    detailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    detailModel *model = [ComboHandle shareHandle].dateArray[indexPath.row];
    _lable.text = [NSString stringWithFormat:@"%ld/%lu",(indexPath.row + 1), [ComboHandle shareHandle].dateArray.count];
    cell.model = model;
    return cell;
}

- (void)returnNext{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)drawView{
    _firstView = [[UIView alloc]initWithFrame:CGRectMake(0, 218, self.view.frame.size.width, 150)];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(30, 30, 40, 15)];
    lable.textColor = [UIColor redColor];
    lable.textAlignment = kCTJustifiedTextAlignment;
    lable.text = [ComboHandle shareHandle].dictionary[@"kind"];
    lable.font = [UIFont systemFontOfSize:10];
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(75, 15, 280, 50)];
        lable1.font = [UIFont systemFontOfSize:14];
    lable1.text = [ComboHandle shareHandle].dictionary[@"title"];

    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/ 2 - 90, 80, 70, 30)];
    lable2.textColor = [UIColor redColor];
    lable2.text = [NSString stringWithFormat:@"¥ %@",[ComboHandle shareHandle].dictionary[@"actual_price"]];
    UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/ 2 - 10, 80, 70, 30)];
    lable3.font = [UIFont systemFontOfSize:12];
        lable3.text = [NSString stringWithFormat:@"¥ %@",[ComboHandle shareHandle].dictionary[@"market_price"]];
    UILabel *lable4 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/ 2 - 110, 120, 110, 30)];
    lable4.textColor = [UIColor redColor];
    lable4.font = [UIFont systemFontOfSize:13];

    lable4.text = @"☑️ 可支付现金";
    UILabel *lable5 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2 , 120, 140, 30)];
    lable5.textColor = [UIColor redColor];
    lable5.font = [UIFont systemFontOfSize:13];
    lable5.text = @"☑️ 全额支付享优惠";
    
    UILabel *lable6 = [[UILabel alloc]initWithFrame:CGRectMake(0, lable4.frame.origin.y - 5, self.view.frame.size.width, 1)];
    lable6.backgroundColor = [UIColor blackColor];
    
    _firstView.backgroundColor = [UIColor whiteColor];
    [_firstView addSubview:lable];
    [_firstView addSubview:lable1];
    [_firstView addSubview:lable2];
    [_firstView addSubview:lable3];
    [_firstView addSubview:lable4];
    [_firstView addSubview:lable6];
    [_firstView addSubview:lable5];
}

//第二个模块

- (void)drawSecondModule
{
    _SecondView = [[UIView alloc]initWithFrame:CGRectMake(0, 380, self.view.frame.size.width, 110)];
    _SecondView.backgroundColor = [UIColor whiteColor];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    lable.text = @"   ☑️  包含的服务";
    lable.backgroundColor = [UIColor whiteColor];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(5, lable.frame.origin.y + 40, self.view.frame.size.width - 10, 1)];
    lab.backgroundColor = [UIColor grayColor];
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 160) / 8, lab.frame.origin.y + 11, 40,40)];
    imgView.image = [UIImage imageNamed:@"camera.png"];
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 160) / 8, lab.frame.origin.y + 51, 40, 20)];
    lable1.text = @"摄影师";
    lable1.font = [UIFont systemFontOfSize:13];
    
    
    
    
    
    UIImageView *imgView2 = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 160) / 4 +imgView.frame.origin.x +40, lab.frame.origin.y + 11, 40,40)];
    imgView2.image = [UIImage imageNamed:@"video.png"];
    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 160) / 4 +imgView.frame.origin.x +40, lab.frame.origin.y + 51, 40, 20)];
    lable2.text = @"摄像师";
    lable2.font = [UIFont systemFontOfSize:13];
    
    
    
    UIImageView *imgView3 = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 160) / 4 +imgView2.frame.origin.x + 40, lab.frame.origin.y + 11, 40,40)];
    imgView3.image = [UIImage imageNamed:@"1.png"];
    UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 160) / 4 +imgView2.frame.origin.x + 40, lab.frame.origin.y + 51, 40, 20)];
    lable3.text = @"主持人";
    lable3.font = [UIFont systemFontOfSize:13];
    
    
    UIImageView *imgView4 = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 160) / 4 +imgView3.frame.origin.x +40, lab.frame.origin.y + 11, 40,40)];
    imgView4.image = [UIImage imageNamed:@"iconfont-e625.png"];
    UILabel *lable4 = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 160) / 4 +imgView3.frame.origin.x +40, lab.frame.origin.y + 51, 40, 20)];
    lable4.text = @"化妆师";
    lable4.font = [UIFont systemFontOfSize:13];
    
    
    [_SecondView addSubview:lable];
    [_SecondView addSubview:lab];
    [_SecondView addSubview:imgView];
    [_SecondView addSubview:lable1];
    [_SecondView addSubview:imgView2];
    [_SecondView addSubview:lable2];
    [_SecondView addSubview:imgView3];
    [_SecondView addSubview:lable3];
    [_SecondView addSubview:imgView4];
    [_SecondView addSubview:lable4];
    [_scrollerView addSubview:_SecondView];
}

//第三个模块
- (void)drawThirdModule{
    
    
    _ComboButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _ComboButton.frame = CGRectMake(0, _SecondView.frame.origin.y + _SecondView.frame.size.height + 10, self.view.frame.size.width, 30);
    [_ComboButton setImage:[UIImage imageNamed:@"combo.png"] forState:UIControlStateNormal];
    [_ComboButton setTitle:@"套餐描述︾" forState:UIControlStateNormal];
    [_ComboButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _ComboButton.backgroundColor = [UIColor whiteColor];
    _comboLable = [[UILabel alloc]initWithFrame:CGRectMake(0, _ComboButton.frame.origin.y + _ComboButton.frame.size.height, self.view.frame.size.width, 1)];
    _comboLable.backgroundColor = [UIColor orangeColor];
//

    


    
    [_ComboButton addTarget:self action:@selector(chick4Combo) forControlEvents:UIControlEventTouchUpInside];
    [_scrollerView addSubview:_ComboButton];
//    [_scrollerView addSubview:_detailLable];

}





#pragma -----------button点击事件-------------
//套餐描述
- (void)chick4Combo{
    
    if ([_ComboButton.titleLabel.text isEqualToString:@"套餐描述︾"]) {
        [_ComboButton setTitle:@"套餐描述︽" forState:UIControlStateNormal];
        
        _comboLable.font = [UIFont systemFontOfSize:15];
        _comboLable.numberOfLines = 0;
        _comboLable.backgroundColor = [UIColor whiteColor];
        _comboLable.frame = CGRectMake(0, _ComboButton.frame.origin.y + _ComboButton.frame.size.height + 10, self.view.frame.size.width, [self returnTextHight:_comboLable.text]);
        _comboLable.layer.borderColor = [[UIColor whiteColor] CGColor];
        _comboLable.layer.borderWidth = 1;
        _titleLable.frame = CGRectMake(0, _comboLable.frame.origin.y + _comboLable.frame.size.height + 10, self.view.frame.size.width, 30);
        _detailLable.frame = CGRectMake(0, _titleLable.frame.origin.y + _titleLable.frame.size.height + 10, self.view.frame.size.width, 100);
            _scrollerView.contentSize = CGSizeMake(self.view.frame.size.width,  (int)(_detailLable.frame.origin.y + _detailLable.frame.size.height + 50));
        [_scrollerView addSubview:_comboLable];
    }else{
        [_ComboButton setTitle:@"套餐描述︾" forState:UIControlStateNormal];
                _titleLable.frame = CGRectMake(0, _ComboButton.frame.origin.y + _ComboButton.frame.size.height + 10, self.view.frame.size.width, 30);
                _detailLable.frame = CGRectMake(0, _titleLable.frame.origin.y + _titleLable.frame.size.height + 10, self.view.frame.size.width, 100);
            _scrollerView.contentSize = CGSizeMake(self.view.frame.size.width,  (int)(_detailLable.frame.origin.y + _detailLable.frame.size.height + 50));
        [_comboLable removeFromSuperview];
    }

}

//
- (void)drawFourthModule{
    
    
    _titleLable = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleLable.frame = CGRectMake(0, _comboLable.frame.origin.y + _comboLable.frame.size.height + 10, self.view.frame.size.width, 28);
    [_titleLable setTitle:@"购买须知︾" forState:UIControlStateNormal];
    _titleLable.backgroundColor = [UIColor whiteColor];
    [_titleLable setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_titleLable addTarget:self action:@selector(chick4last) forControlEvents:UIControlEventTouchUpInside];
    
    
    _detailLable = [[UILabel alloc]init];
    
    _detailLable.font = [UIFont systemFontOfSize:15];
    _detailLable.frame = CGRectMake(0, _titleLable.frame.origin.y + _titleLable.frame.size.height + 10, self.view.frame.size.width,1);
    _detailLable.numberOfLines = 0;
    _detailLable.backgroundColor = [UIColor blackColor];

    

    
    [_scrollerView addSubview:_titleLable];
//    [_scrollerView addSubview:_detailLable];
    
}

- (void)chick4last{
    if ([_titleLable.titleLabel.text isEqualToString:@"购买须知︾"]) {
        [_titleLable setTitle:@"购买须知︽" forState:UIControlStateNormal];
        
        _detailLable.font = [UIFont systemFontOfSize:15];
        _detailLable.numberOfLines = 0;
        _detailLable.backgroundColor = [UIColor whiteColor];
        _detailLable.frame = CGRectMake(0, _titleLable.frame.origin.y + _titleLable.frame.size.height + 10, self.view.frame.size.width, [self returnTextHight:_detailLable.text]);
            _scrollerView.contentSize = CGSizeMake(self.view.frame.size.width,  (int)(_detailLable.frame.origin.y + _detailLable.frame.size.height + 50));
        [_scrollerView addSubview:_detailLable];
    }else{
        [_titleLable setTitle:@"购买须知︾" forState:UIControlStateNormal];
            _scrollerView.contentSize = CGSizeMake(self.view.frame.size.width,  (int)(_detailLable.frame.origin.y + _detailLable.frame.size.height + 50));
        [_detailLable removeFromSuperview];
    }

}
















//lable 自适应高度
- (CGFloat)returnTextHight:(NSString *)string
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(self.view.frame.size.width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    return rect.size.height;
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
