//
//  HomePageViewController.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "HomePageViewController.h"
#import "OneSectionCollectionCell.h"
#import "BannerCell.h"
#import "ThreeSectionCell.h"
#import "Model4SetMeal.h"
#import "LastCollectionCell.h"
#import "button.h"
#import "webViewController.h"
#import "lastTopCollectionCell.h"
#import "HomePageDetailController.h"
#import "CarouselFingure.h"
#import "AllComboCollection.h"
#import "LBCollectionCell.h"
#import "MoewcomboController.h"
#import "MoewCaseController.h"
#import "HLCLController.h"
#import "MoreShopController.h"

#define kurl_Image1 @"http://marry.qiniudn.com/o_19t7s4hbfec5jnm11vlvnvs7ob.png"
#define kurl_Image2 @"http://qnm.hunliji.com/o_19rre1udj1idu1r251ocj19kooqvb.png"
#define kurl_Image3 @"http://marry.qiniudn.com/o_19t7s62lr1ekk1ti3174b1jv71s60b.png"
#define kurl_Image4 @"http://marry.qiniudn.com/o_19t7s6kvp155m6771hc1de19oeb.png"
@interface HomePageViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CarouselFingureDelegate>



@property (nonatomic,strong)UIScrollView *scrollerView;
@property(nonatomic,strong)Model4HomePage *model;
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;

@property(nonatomic,strong)UICollectionView *collectionView1;
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout1;

@property(nonatomic,strong)UICollectionView *collectionView2;
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout2;

@property (nonatomic,strong)UIButton *button;

@property (nonatomic,strong)UIScrollView *lastScrollView;

@property (nonatomic,strong)NSMutableArray *array;
@property (nonatomic,strong)NSMutableArray *array1;
@property (nonatomic,strong)NSMutableArray *setMealArray;
@property (nonatomic,strong)NSMutableArray *array2;
@property (nonatomic,strong)NSMutableArray *array3;
@property (nonatomic,strong)NSMutableArray *array4;
@property (nonatomic,strong)NSMutableArray *array5;
@property (nonatomic,strong)NSMutableArray *mealArray;
@property (nonatomic,strong)NSMutableArray *caseArray;
//接收一个字符串 (拼接到更多套餐,案例里面)
@property(nonatomic,strong)NSString *moreString;

@property(nonatomic,strong)NSString *titleKindString;




@end

@implementation HomePageViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleKindString = @"精选";
    
    _scrollerView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    _scrollerView.bounces = NO;
    _scrollerView.alwaysBounceVertical = NO;
    _scrollerView.alwaysBounceHorizontal = NO;
    _scrollerView.backgroundColor = [UIColor grayColor];
    _collectionView1.userInteractionEnabled = YES;
    [self setUp];
    [self setUpWithButton];
    [self setUpImage];
    [self setUpTableView];
    [self setUpRecommend];
    [self titleKind];
    [self lastSecton];

    
    _scrollerView.contentSize = CGSizeMake(self.view.frame.size.width, (int)_collectionView1.frame.origin.y + _collectionView1.frame.size.height);
    //注册
    [_collectionView registerNib:[UINib nibWithNibName:@"OneSectionCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"firstSection"];
    [_collectionView1 registerNib:[UINib nibWithNibName:@"lastTopCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"lastTopCell"];
    [_collectionView2 registerNib:[UINib nibWithNibName:@"LBCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"LBcell"];
    //区头(2) 注册集合视图 自定义头的视图(xib 专用注册)
    //注册头
    [_collectionView1 registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    //注册尾
    [_collectionView1 registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
    self.collectionView1.tag=1000;
    [self.view addSubview:_scrollerView];
    
    
    // Do any additional setup after loading the view.
}



#pragma mark--collectionView--
/**
 *  返回item的个数
 *
 *  @param section        分区
 *
 *  @return item个数
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if ([collectionView isKindOfClass:[_collectionView1 class]]) {
        return 2;
    }else{
        return 1;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([collectionView isKindOfClass:[_collectionView1 class]]) {
        return 4;
    }else if (collectionView.tag == 1001){
        return self.array2.count;
    }else{
        return self.array.count;
    }

}

//item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    if (collectionView.tag==1000) {
        if (indexPath.section == 0) {
            LastCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"lastSection1" forIndexPath:indexPath];
            
            Model4SetMeal *model = self.mealArray[indexPath.row];
            cell.model = model;
            return cell;
        }else{
            lastTopCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"lastTopCell" forIndexPath:indexPath];
            Model4SetMeal *model = self.caseArray[indexPath.row];
            cell.model = model;
            return cell;
        }
        
    }else if (collectionView.tag == 1001){
     
        LBCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LBcell" forIndexPath:indexPath];
        [cell.picture sd_setImageWithURL:[NSURL URLWithString:self.array2[indexPath.row]]];
        cell.txt4Title.text = self.array3[indexPath.row];
        return cell;
    }else{
        OneSectionCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"firstSection" forIndexPath:indexPath];
        Model4HomePage *model = self.array[indexPath.row];
        cell.model = model;
        return cell;
    }
    return nil;
}
#pragma mark======collectionView 点击事件========
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == 1000) {
        Model4SetMeal *model = self.setMealArray[indexPath.row];
        HomePageDetailController *detailVC = [HomePageDetailController new];
        detailVC.ID = model.ID;
        [self presentViewController:detailVC animated:YES completion:nil];
        
        
    }else if (collectionView.tag == 1001){
        webViewController *webView = [webViewController new];
        webView.url = kStoreUrl(self.array5[indexPath.row]);
        NSLog(@"%@",webView.url);
        [self presentViewController:webView animated:YES completion:nil];
    }else{
            Model4HomePage *model = self.array[indexPath.row];
            if (model.target_url.length > 0) {
                webViewController *webView = [webViewController new];
                webView.url = model.target_url;
                NSLog(@"%@",webView.url);
                [self presentViewController:webView animated:YES completion:nil];
            }else if (indexPath.row == 0){
                Model4SetMeal *model = self.setMealArray[indexPath.row];
                HomePageDetailController *detailVC = [HomePageDetailController new];
                detailVC.ID = model.ID;
                [self presentViewController:detailVC animated:YES completion:nil];
            }
            
        }
    
}

//返回头和尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //先从集合视图中获取这个位置上对应的标示符为header 的头 然后返回
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        header.backgroundColor = [UIColor whiteColor];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, self.view.frame.size.width, 30);
        [button setTitle:@"-----热门套餐-----" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setFont:[UIFont systemFontOfSize:12]];
        if (indexPath.section == 1) {
            [button setTitle:@"-----精选案例-----" forState:UIControlStateNormal];
            
        }
        //区头视图复用
        for (UIView *view in header.subviews) {
            [view removeFromSuperview];
        }
        [header addSubview:button];
        return header;
    }else{
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor whiteColor];
        if (indexPath.section == 0) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
            [button setTitle:@"更多套餐" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [button setFont:[UIFont systemFontOfSize:15]];
            [button addTarget:self action:@selector(chickWithMoreCombo) forControlEvents:(UIControlEventTouchUpInside)];
            for (UIView *view in footer.subviews) {
                [view removeFromSuperview];
            }
            [footer addSubview:button];
            return footer;
        }else {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
            [button setTitle:@"更多案例" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [button setFont:[UIFont systemFontOfSize:15]];
            [button addTarget:self action:@selector(chickWithMoreCase) forControlEvents:(UIControlEventTouchUpInside)];
            for (UIView *view in footer.subviews) {
                [view removeFromSuperview];
            }
            [footer addSubview:button];
            return footer;
        }
    }
    
}




#pragma mark=======更多套餐========
- (void)chickWithMoreCombo{
     MoewcomboController *moreCombo = [MoewcomboController new];
    UINavigationController *navMoreComboVC = [[UINavigationController alloc]initWithRootViewController:moreCombo];
    moreCombo.moreString = self.moreString;
    [self presentViewController:navMoreComboVC animated:YES completion:nil];
}
#pragma mark=====更多案例======
- (void)chickWithMoreCase{
    MoewCaseController *moreCase = [MoewCaseController new];
    moreCase.moreString = self.moreString;
    UINavigationController *navMoreCaseVC = [[UINavigationController alloc]initWithRootViewController:moreCase];
    [self presentViewController:navMoreCaseVC animated:YES completion:nil];
}

#pragma mark====商家推荐====

- (void)shickWithShopRecommend{
    MoreShopController *HLCHVc = [MoreShopController new];
    UINavigationController *navHLCHVC = [[UINavigationController alloc]initWithRootViewController:HLCHVc];
    [self presentViewController:navHLCHVC animated:YES completion:nil];
}



/**
 *  tableView
 *
 *  @param tableView 超值套餐
 *
 *  @return ThreeSectionCell
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.setMealArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ThreeSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeSectionCell" forIndexPath:indexPath];
    Model4SetMeal *model = self.setMealArray[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *string = @"超值套餐";
    return string;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, self.view.frame.size.width, 35);
    [button setTitle:@"更多超值折扣" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(action4All) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    view.userInteractionEnabled = YES;
    return view;
}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Model4SetMeal *model = self.setMealArray[indexPath.row];
    HomePageDetailController *detailVC = [HomePageDetailController new];
    detailVC.ID = model.ID;
    [self presentViewController:detailVC animated:YES completion:nil];
    
}






#pragma mark------画图------



//button
- (void)titleKind{
    UIView *view = [[button alloc]initWithFrame:CGRectMake(0, _collectionView2.frame.origin.y + _collectionView2.frame.size.height + 10, self.view.frame.size.width, 75)];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, 5, self.view.frame.size.width / 4, 30);
    [button1 setTitle:@"精选" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button1];
    [button1 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(button1.frame.size.width, 5, self.view.frame.size.width / 4, 30);
    [button2 setTitle:@"婚礼策划" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button2];
    [button2 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    button3.frame = CGRectMake(2 * button1.frame.size.width, 5, self.view.frame.size.width / 4, 30);
    [button3 setTitle:@"婚纱摄影" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button3];
    [button3 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
    button4.frame = CGRectMake(3 * button1.frame.size.width, 5, self.view.frame.size.width / 4, 30);
    [button4 setTitle:@"摄影师" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button4];
    [button4 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeSystem];
    button5.frame = CGRectMake(0, 5 + button1.frame.size.height, self.view.frame.size.width / 4, 30);
    [button5 setTitle:@"摄像师" forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button5];
    [button5 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeSystem];
    button6.frame = CGRectMake(button1.frame.size.width, 5 + button1.frame.size.height , self.view.frame.size.width / 4, 30);
    [button6 setTitle:@"化妆师" forState:UIControlStateNormal];
    [button6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button6];
    [button6 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeSystem];
    button7.frame = CGRectMake(2 * button1.frame.size.width, 5 + button1.frame.size.height, self.view.frame.size.width / 4, 30);
    [button7 setTitle:@"主持人" forState:UIControlStateNormal];
    [button7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button7];
    [button7 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeSystem];
    button8.frame = CGRectMake(3 * button1.frame.size.width, 5 + button1.frame.size.height, self.view.frame.size.width / 4, 30);
    [button8 setTitle:@"婚纱礼服" forState:UIControlStateNormal];
    [button8 setTitle:@"婚纱礼服" forState:UIControlStateHighlighted];
    [button8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button8 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button8];
    [_scrollerView addSubview:view];
}


#pragma mark------------八个按钮--------------
- (void)lastSecton{
    
    _flowLayout1 =[[UICollectionViewFlowLayout alloc]init];
    _flowLayout1.minimumInteritemSpacing = 0;
    _flowLayout1.minimumLineSpacing = 0;
    _flowLayout1.itemSize = CGSizeMake(self.view.frame.size.width / 2, 130);
    _flowLayout1.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _flowLayout1.headerReferenceSize = CGSizeMake(10, 30);
    _flowLayout1.footerReferenceSize = CGSizeMake(10, 30);
    /**
     collectionView
     */
    _collectionView1 = [[UICollectionView alloc]initWithFrame:CGRectMake(0, _collectionView2.frame.origin.y + _collectionView2.frame.size.height + 85, self.view.frame.size.width, 640) collectionViewLayout:_flowLayout1];
    [self requestDateForEgihtButton];
    _collectionView1.delegate = self;
    _collectionView1.dataSource = self;
    _collectionView1.scrollEnabled = NO;
    
    [_collectionView1 registerNib:[UINib nibWithNibName:@"LastCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"lastSection1"];


    [_scrollerView addSubview:_collectionView1];
    
}




//商家推荐
- (void)setUpRecommend{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL_Shangjia]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSDictionary *mutDictionary = dictionary[@"data"];
    for (NSDictionary *dic in mutDictionary) {
        NSString *str = dic[@"logo_path"];
        NSString *namestr = dic[@"name"];
        NSString *ID = dic[@"id"];
        [self.array2 addObject:str];
        [self.array3 addObject:namestr];
        [self.array5 addObject:ID];

    }
    
    _flowLayout2 = [[UICollectionViewFlowLayout alloc]init];
    _flowLayout2.minimumInteritemSpacing = 0;
    _flowLayout2.minimumLineSpacing = 0;
    _flowLayout2.itemSize = CGSizeMake(self.view.frame.size.width / 3, 110);
    _flowLayout2.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _flowLayout2.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    /**
     collectionView
     */
    _collectionView2 = [[UICollectionView alloc]initWithFrame:CGRectMake(0, _tableView.frame.origin.y + _tableView.frame.size.height + 30, self.view.frame.size.width, 110) collectionViewLayout:_flowLayout2];
    _collectionView2.delegate = self;
    _collectionView2.dataSource = self;
    _collectionView2.pagingEnabled = YES;
    _collectionView2.tag = 1001;
    _collectionView2.showsHorizontalScrollIndicator = YES;

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, _tableView.frame.origin.y + _tableView.frame.size.height + 10, self.view.frame.size.width, 15);
    [button setTitle:@"商家推荐" forState:UIControlStateNormal];
    [button setFont:[UIFont systemFontOfSize:14]];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0,-self.view.frame.size.width / 2, 0, 120)];
    [button addTarget:self action:@selector(shickWithShopRecommend) forControlEvents:UIControlEventTouchUpInside];
    [_scrollerView addSubview:button];
    [_scrollerView addSubview:_collectionView2];
    

}


//添加tableView
- (void)setUpTableView{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kTaocan]];
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
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, _button.frame.origin.y + _button.frame.size.height + 10, self.view.frame.size.width, 385) style:UITableViewStyleGrouped];
    [self.tableView registerNib:[UINib nibWithNibName:@"ThreeSectionCell" bundle:nil] forCellReuseIdentifier:@"threeSectionCell"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    [_scrollerView addSubview:_tableView];
}





//横幅
- (void)setUpImage{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kUrl_HomePage]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSDictionary *mutDictionary = dictionary[@"data"];
    NSArray *sitesArray = mutDictionary[@"sites"];
    for (NSDictionary *dic in sitesArray) {
        
        if ([dic[@"id" ] isEqualToString:@"9"]) {
            NSArray *postersArray = dic[@"posters"];
            for (NSDictionary * postersDictionary in postersArray) {
                Model4HomePage *model = [Model4HomePage new];
                [model setValuesForKeysWithDictionary:postersDictionary];
                [self.array1 addObject:model];
            }
        }
    }

    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(0, _collectionView.frame.origin.y + _collectionView.frame.size.height + 10, self.view.frame.size.width, 70);
    Model4HomePage *model = [Model4HomePage new];
    model = self.array1[0];
   [_button setBackgroundImage:[self requestImageWithUrl:[NSString stringWithFormat:@"%@",model.image_path]] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(banner) forControlEvents:UIControlEventTouchUpInside];
    [_scrollerView addSubview:_button];
    
}

//8个按钮
-(void)setUpWithButton{
    /**
     *  数据解析
     */
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kUrl_HomePage]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSDictionary *mutDictionary = dictionary[@"data"];
    NSArray *sitesArray = mutDictionary[@"sites"];
    for (NSDictionary *dic in sitesArray) {
        
        if ([dic[@"id" ] isEqualToString:@"11"]) {
            NSArray *postersArray = dic[@"posters"];
            for (NSDictionary * postersDictionary in postersArray) {
                Model4HomePage *model = [Model4HomePage new];
                [model setValuesForKeysWithDictionary:postersDictionary];
                [self.array addObject:model];
            }
        }
    }
    /**
     约束条件
     */
    _flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _flowLayout.minimumInteritemSpacing = 0;
    _flowLayout.minimumLineSpacing = 0;
    _flowLayout.itemSize = CGSizeMake(self.view.frame.size.width / 2, 70);
    _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    /**
     collectionView
     */
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 235, self.view.frame.size.width, self.array.count / 2 * 70) collectionViewLayout:_flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.scrollEnabled = NO;
    //注册

    [_scrollerView addSubview:_collectionView];
    
}

//添加轮播图
-(void)setUp{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 225)];
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.userInteractionEnabled = YES;

#pragma mark--headerView添加轮播图--
    
    NSMutableArray *imagesArray = [[NSMutableArray alloc]initWithCapacity:5];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kUrl_HomePage]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSDictionary *mutDictionary = dictionary[@"data"];
    NSArray *sitesArray = mutDictionary[@"sites"];
    for (NSDictionary *dic in sitesArray) {
        if ([dic[@"id" ] isEqualToString:@"1"]) {
            NSArray *postersArray = dic[@"posters"];
            
            for (NSDictionary * postersDictionary in postersArray) {
                _model = [Model4HomePage new];
                [_model setValuesForKeysWithDictionary:postersDictionary];
                UIImage *img = [self requestImageWithUrl:_model.image_path];
                [imagesArray addObject:img];
            }
            
        }
    }
    
    CarouselFingure *cView = [[CarouselFingure alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 155)];
    // cView.backgroundColor = [UIColor redColor];
    cView.imagesArray = imagesArray;
    NSLog(@"%ld",imagesArray.count);
    cView.duration=2;
    cView.delegate = self;
    
    [headerView addSubview:cView];
#pragma mark--headerView添加button--
    UIButton *button1 = [[UIButton alloc]init];
    button1.frame = CGRectMake(0, 160, self.view.frame.size.width / 4, 60);
    [button1 setTitle:@"找商家" forState:UIControlStateNormal];
    //button图片
    [button1 setImage:[self requestImageWithUrl:kurl_Image1] forState:UIControlStateNormal];
    //button Title
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //title 字体
    [button1 setFont:[UIFont systemFontOfSize:15]];
    //偏移量
    button1.titleEdgeInsets = UIEdgeInsetsMake(40, -162, 0, button1.titleLabel.bounds.size.width);
    [button1 addTarget:self action:@selector(findShop) forControlEvents:UIControlEventTouchUpInside];
    
    
    button1.imageEdgeInsets = UIEdgeInsetsMake(0,25,20,25);
    [headerView addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.frame = CGRectMake(self.view.frame.size.width / 4, 160, self.view.frame.size.width / 4, 60);
    [button2 setTitle:@"婚车租赁" forState:UIControlStateNormal];
    //button图片
    [button2 setImage:[self requestImageWithUrl:kurl_Image2] forState:UIControlStateNormal];
    //button Title
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //title 字体
    [button2 setFont:[UIFont systemFontOfSize:15]];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //偏移量
    button2.titleEdgeInsets = UIEdgeInsetsMake(40, -162, 0, button1.titleLabel.bounds.size.width);
    button2.imageEdgeInsets = UIEdgeInsetsMake(0,25,20,25);
    [button2 addTarget:self action:@selector(WeddingCar) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc]init];
    button3.frame = CGRectMake(2 * self.view.frame.size.width / 4, 160, self.view.frame.size.width / 4, 60);
    [button3 setTitle:@"淘婚品" forState:UIControlStateNormal];
    //button图片
    [button3 setImage:[self requestImageWithUrl:kurl_Image3] forState:UIControlStateNormal];
    //button Title
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //title 字体
    [button3 setFont:[UIFont systemFontOfSize:15]];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //偏移量
    button3.titleEdgeInsets = UIEdgeInsetsMake(40, -162, 0, button1.titleLabel.bounds.size.width);
    button3.imageEdgeInsets = UIEdgeInsetsMake(0,25,20,25);
    [headerView addSubview:button3];
    
    UIButton *button4 = [[UIButton alloc]init];
    button4.frame = CGRectMake(3 * self.view.frame.size.width / 4, 160, self.view.frame.size.width / 4, 60);
    [button4 setTitle:@"微信请帖" forState:UIControlStateNormal];
    //button图片
    [button4 setImage:[self requestImageWithUrl:kurl_Image4] forState:UIControlStateNormal];
    //button Title
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //title 字体
    [button4 setFont:[UIFont systemFontOfSize:15]];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //偏移量
    button4.titleEdgeInsets = UIEdgeInsetsMake(40, -162, 0, button1.titleLabel.bounds.size.width);
    button4.imageEdgeInsets = UIEdgeInsetsMake(0,25,20,25);
    [headerView addSubview:button4];
    [_scrollerView addSubview:headerView];
    
}
//获取图片
-(UIImage *)requestImageWithUrl:(NSString *)url
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    UIImage *img = [UIImage imageWithData:data];
    return img;
}

#pragma ----懒加载----
- (NSMutableArray *)array{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}
-(NSMutableArray *)setMealArray{
    if (_setMealArray == nil) {
        _setMealArray = [NSMutableArray array];
    }
    return _setMealArray;
}
- (NSMutableArray *)array1{
    if (_array1 == nil) {
        _array1 = [NSMutableArray array];
    }
    return _array1;
}

- (NSMutableArray *)array2{
    if (_array2 == nil) {
        _array2 = [NSMutableArray array];
    }
    return _array2;
}

- (NSMutableArray *)array3{
    if (_array3 == nil) {
        _array3 = [NSMutableArray array];
    }
    return _array3;
}

- (NSMutableArray *)array4{
    if (_array4 == nil) {
        _array4 = [NSMutableArray array];
    }
    return _array4;
}
- (NSMutableArray *)mealArray
{
    if (_mealArray == nil) {
        _mealArray = [NSMutableArray array];
    }
    return _mealArray;
}
- (NSMutableArray *)array5{
    if (_array5 == nil) {
        _array5 = [NSMutableArray array];
    }
    return _array5;
}


-(NSMutableArray *)caseArray{
    if (_caseArray == nil) {
        _caseArray = [NSMutableArray array];
    }
    return _caseArray;
}

#pragma maek--buttton  点击事件--
//四个按钮
- (void)WeddingCar{
    NSString *string = @"http://www.hunliji.com/p/wedding/index.php/home/Activities/ShowIndex/id/34?is_app=true";
    webViewController *webView = [webViewController new];
    webView.url = string;
    [self presentViewController:webView animated:YES completion:nil];
}
//横幅
- (void)banner{
    Model4HomePage *model = [Model4HomePage new];
    model = self.array1[0];
    webViewController *webView = [webViewController new];
    webView.url = model.target_url;
    [self presentViewController:webView animated:YES completion:nil];
}
//titleKind
- (void)chickButton:(UIButton *)action{
    UIButton *button = (UIButton *)action;
    NSString *buttonTitle = button.titleLabel.text;
    _titleKindString = buttonTitle;
    [self requestDateForEgihtButton];
}
- (void)action4All{
    AllComboCollection *comboVC = [AllComboCollection new];
    UINavigationController *navComboVC = [[UINavigationController alloc]initWithRootViewController:comboVC];
    [self presentViewController:navComboVC animated:YES completion:nil];
}

- (void)findShop{
    MoreShopController *HLCHVc = [MoreShopController new];
    UINavigationController *navHLCHVC = [[UINavigationController alloc]initWithRootViewController:HLCHVc];
    [self presentViewController:navHLCHVC animated:YES completion:nil];
}







#pragma ---八个按钮请求数据---
- (void)requestDateForEgihtButton{
    
    if (self.caseArray.count > 0) {
        [self.caseArray removeAllObjects];
    }
    if (self.mealArray.count > 0) {
        [self.mealArray removeAllObjects];
    }
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kSelect]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *dataArray = dictionary[@"data"];
    for (NSDictionary *dataDictionary in dataArray) {
        if ([dataDictionary[@"name" ] isEqualToString:[NSString stringWithFormat:@"%@",_titleKindString]]) {
            _moreString = dataDictionary[@"id"];
            NSDictionary *mealDictionary = dataDictionary[@"meal"];
            NSArray *mealArray = mealDictionary[@"data"];
            NSDictionary *caseDictionary = dataDictionary[@"case"];
            NSArray *caseArray = caseDictionary[@"data"];
            for (NSDictionary *dic in mealArray) {
                Model4SetMeal *model = [Model4SetMeal new];
                [model setValuesForKeysWithDictionary:dic];
                [self.mealArray addObject:model];
            }
            for (NSDictionary *dic in caseArray) {
                Model4SetMeal *model = [Model4SetMeal new];
                [model setValuesForKeysWithDictionary:dic];
                [self.caseArray addObject:model];
            }
        }
        [_collectionView1 reloadData];
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
