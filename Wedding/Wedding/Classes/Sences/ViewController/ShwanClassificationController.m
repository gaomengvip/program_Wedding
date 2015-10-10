//
//  ShwanClassificationController.m
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanClassificationController.h"
#import "SHwanModle.h"
#import "ShwanModleWeddingdress.h"
#import "ShwanClassificationCell.h"
#import "ShwanViewController.h"
#import "ShwanHandShare.h"
#import "ShwanWeddingCell.h"
#import "ShwanWeddingController.h"
#import "ShwanWeddingMoreController.h"
#import "ShwanThreeController.h"
#import "ShwanMarriageController.h"


@interface ShwanClassificationController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>



@property(nonatomic,strong)UISearchBar * searchBar;

@property(nonatomic,strong)UILabel * searchLable;
@property(nonatomic,strong)UIButton * CityBUtton;
@property(nonatomic,strong)UITableView * table4button;
@property(nonatomic,strong)UIView * view4Button;
@property(nonatomic,strong)UIButton * cancelButton;
@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * modleArray;
@property(nonatomic,strong)NSMutableArray * weddingDressArray;
@property(nonatomic,strong)UICollectionView * buttonView;
@property(nonatomic,strong)UIButton * footer4lable;
@property(nonatomic,strong)NSMutableArray * imageArray;
@property(nonatomic,strong)NSMutableArray * titleArray;
@property(nonatomic,strong)UIButton * button;

@end


static NSString * URL4LocalService = @"http://www.hunliji.com/p/wedding/index.php/home/APIFrontPage/getClass?cid=0";

static NSString * URL4Weddingdress = @"http://hunliji.com/p/wedding/index.php/home/APIFrontPage/getTags";
@implementation ShwanClassificationController




-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{



    if (self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        [self searchLable];
        [self searchBar];
        [self CityBUtton];
        [self scrollView];
        [self tableView];
        [self buttonView];
        [self footer4lable];
        [self button];
       
    }





    return self;

}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.tableView registerClass:[ShwanClassificationCell class] forCellReuseIdentifier:@"cell"];
    
  
   
  
    [self modle];
    [self ShwanModleWeddingdress];
    
    
    
    
}
#pragma mark---------------------解析数据----------------------------------
-(void)modle{

   
dispatch_async(dispatch_get_global_queue(0, 0), ^{
    NSURLRequest * request=[NSURLRequest requestWithURL:[NSURL URLWithString:URL4LocalService]];
    
    NSLog(@"%@",URL4LocalService);
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView reloadData];
        });
        NSArray*array =dict[@"data"];
        _modleArray=[NSMutableArray array];
        for (NSDictionary*dic in array) {
            
            SHwanModle*modle =[SHwanModle new];
            [modle setValuesForKeysWithDictionary:dic];
            
            [self.modleArray addObject:modle];
           
          }
        
        
      }];

 });
    
   
}




-(void)ShwanModleWeddingdress{



    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURLRequest * request=[NSURLRequest requestWithURL:[NSURL URLWithString:URL4Weddingdress]];
        
       [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            
            NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.buttonView reloadData];
            });
            NSArray*array =dict[@"data"];
            _weddingDressArray=[NSMutableArray array];
           _imageArray=[NSMutableArray array];
           _titleArray=[NSMutableArray array];
            for (NSDictionary*dic in array) {
                
                ShwanModleWeddingdress*modle =[ShwanModleWeddingdress new];
                [modle setValuesForKeysWithDictionary:dic];
                
                [self.weddingDressArray addObject:modle];
                [self.imageArray addObject:modle.image_path];
                [self.titleArray addObject:modle.name];
               
            }
            
           
        }];
        
    });






}




#pragma mark---------------------懒加载------------------------------------

-(UIButton*)button{

    if (_button==nil) {
        _button=[[UIButton alloc]initWithFrame:CGRectMake(0, self.tableView.frame.size.height+self.buttonView.frame.size.height+61,self.scrollView.frame.size.width, 40)];
        
        [_button setTitle:@"婚品采购" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(ButtonMarriageisTasted:) forControlEvents:UIControlEventTouchUpInside];
        _button.backgroundColor=[UIColor whiteColor];
        
        [self.scrollView addSubview:_button];
        
    }

    return _button;

}

-(UIControl*)footer4lable{

    if (_footer4lable==nil) {
        _footer4lable=[[UIButton alloc]initWithFrame:CGRectMake(0, self.tableView.frame.size.height+self.buttonView.frame.size.height+21, self.scrollView.frame.size.width, 40)];
        _footer4lable.backgroundColor=[UIColor whiteColor];
        [_footer4lable setTitle:@"更多标签" forState:UIControlStateNormal];
        [_footer4lable setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_footer4lable addTarget:self action:@selector(control4Action:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.scrollView addSubview:_footer4lable];
        
           }
    
   return _footer4lable;

}

-(UICollectionView*)buttonView{


    if (_buttonView ==nil) {
        
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        
        layout.itemSize=CGSizeMake(self.view.frame.size.width/3, 60);
        layout.minimumLineSpacing=0;
        layout.minimumInteritemSpacing=0;
        layout.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
        _buttonView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, self.tableView.frame.size.height+20, self.view.frame.size.width, 120) collectionViewLayout:layout];
        self.buttonView.delegate=self;
        self.buttonView.dataSource=self;
        [self.buttonView registerClass:[ShwanWeddingCell class] forCellWithReuseIdentifier:@"item"];
        
        [self.scrollView addSubview:_buttonView];
    }


    return _buttonView;
}
-(UIScrollView*)scrollView{

    if (_scrollView==nil) {
        _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height)];
   
        _scrollView.contentSize=CGSizeMake(0, 4000);
        _scrollView.bounces=NO;
        _scrollView.alwaysBounceVertical=NO;
        _scrollView.alwaysBounceHorizontal=NO;
        _scrollView.backgroundColor=[UIColor grayColor];
        [self.view addSubview:_scrollView];
    }

    return _scrollView;

}

-(UIButton*)CityBUtton{


    if (_CityBUtton ==nil) {
        _CityBUtton=[[UIButton alloc]initWithFrame:CGRectMake(0, 20, 80, 50)];
        
        [_CityBUtton setTitle:@"全国" forState:UIControlStateNormal];
        [_CityBUtton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_CityBUtton setImage:[UIImage imageNamed:@"iconfont-sanjiao"] forState:UIControlStateNormal];
        [_CityBUtton addTarget:self action:@selector(cityBUtton4Action:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_CityBUtton];
        
    }

    return _CityBUtton;

}


-(UILabel*)searchLable{


    if (_searchLable==nil) {
        
        _searchLable=[[UILabel  alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 50)];
        
        _searchLable.backgroundColor=[UIColor  whiteColor];
        
        [self.view addSubview:_searchLable];
        
    }

    return _searchLable;

}

-(UISearchBar*)searchBar{

  
    if (_searchBar==nil) {
        
        _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(100, 30, 250, 30)];
        
        _searchBar.placeholder=@"搜索商家、套餐、话题";
        _searchBar.backgroundColor=[UIColor grayColor];
        _searchBar.delegate=self;
        
        [self.view addSubview:_searchBar];
        
        
    }
    
    return _searchBar;
    

}
-(UITableView*)tableView{


    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 10, self.scrollView.frame.size.width, 1110)];
        
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.scrollEnabled=NO;
        [_scrollView addSubview:_tableView];
    }



    return _tableView;
}


#pragma mark-----------------CollectionView代理方法------------------------



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{




    return 1;


}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

  
    
    return _weddingDressArray.count;

}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{



  ShwanWeddingCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];

    
    cell.backgroundColor=[UIColor whiteColor];
    
    cell.layer.borderWidth=1;
    //cell.layer.borderColor
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 0, 0.7 });
    [cell.layer setBorderColor:colorref];
    
    //if (indexPath.section==0) {
        
    
    ShwanModleWeddingdress *modle =_weddingDressArray[indexPath.row];
    
    cell.modle=modle;
    
        return cell;
    

}




- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/3, 60);
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{



    ShwanWeddingMoreController * ShwanMore =[ShwanWeddingMoreController new];

    
    
    if (indexPath.row==0) {
        
        self.Morenumber=14;
        [ShwanHandShare share].Morenumber=_Morenumber;
        [self presentViewController:ShwanMore animated:NO completion:nil];
        
    }else if (indexPath.row==1) {
        
        self.Morenumber=18;
        [ShwanHandShare share].Morenumber=_Morenumber;
        [self presentViewController:ShwanMore animated:NO completion:nil];
        
    }else if (indexPath.row==2) {
        
        self.Morenumber=35;
        [ShwanHandShare share].Morenumber=_Morenumber;
        [self presentViewController:ShwanMore animated:NO completion:nil];
        
    }else if (indexPath.row==3) {
        
        self.Morenumber=42;
        [ShwanHandShare share].Morenumber=_Morenumber;
        [self presentViewController:ShwanMore animated:NO completion:nil];
        
    }else if (indexPath.row==4) {
        
        self.Morenumber=73;
        [ShwanHandShare share].Morenumber=_Morenumber;
        [self presentViewController:ShwanMore animated:NO completion:nil];
        
    }else  {
        
        self.Morenumber=71;
        [ShwanHandShare share].Morenumber=_Morenumber;
        [self presentViewController:ShwanMore animated:NO completion:nil];
        
    }
    
}







#pragma mark------------------tableView代理方法----------------------------


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    



    return 1;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        
    return _modleArray.count;
   
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    ShwanClassificationCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    SHwanModle * modle =_modleArray[indexPath.row];
    
    cell.modle=modle;
    
    if (indexPath.section==1) {
        
      
        
        return cell;
        
    }
    
    
     return cell;

}





-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{



    return 120;

}



-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{


   
    if (section==0) {
        NSString * str=@"本地服务";
        
        return str;

    }
   return @" ";
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ShwanViewController * shwan =[ShwanViewController new];
    
    
    
    if (indexPath.row==0) {
        
   
        self.number=2;
        
        
        [ShwanHandShare share].number=self.number;
    
    
    [self presentViewController:shwan animated:NO completion:nil];


    }else if (indexPath.row==1){
    
    
        
        self.number=6;
        
        
        [ShwanHandShare share].number=self.number;
        
        
        [self presentViewController:shwan animated:NO completion:nil];
    
    }else if (indexPath.row==2){
        
        
        
        self.number=7;
        
        
        [ShwanHandShare share].number=self.number;
        
        
        [self presentViewController:shwan animated:NO completion:nil];
        
    }else if (indexPath.row==3){
        
        
        
        self.number=8;
        
        
        [ShwanHandShare share].number=self.number;
        
        
        [self presentViewController:shwan animated:NO completion:nil];
        
    }else if (indexPath.row==4){
        
        
        
        self.number=9;
        
        
        [ShwanHandShare share].number=self.number;
        
        
        [self presentViewController:shwan animated:NO completion:nil];
        
    }else if (indexPath.row==5){
        
        
        
        self.number=11;
        
        
        [ShwanHandShare share].number=self.number;
        
        
        [self presentViewController:shwan animated:NO completion:nil];
        
    }else if (indexPath.row==6){
        
        
        
        self.number=12;
        
        
        [ShwanHandShare share].number=self.number;
        
        
        [self presentViewController:shwan animated:NO completion:nil];
        
    }else if (indexPath.row==7){
        
        
        
        self.number=6;
        
        
        [ShwanHandShare share].number=self.number;
        
        
        [self presentViewController:shwan animated:NO completion:nil];
        
    }else {
        
        
        
        self.number=6;
        
        
        [ShwanHandShare share].number=self.number;
        
        
        [self presentViewController:shwan animated:NO completion:nil];
        
    }


}











#pragma mark------------------ searchBar代理方法---------------------------

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    ShwanThreeController * three=[ShwanThreeController new];
    
    if ([_searchBar.text isEqualToString:@"商家"]) {
       
        
        
        
    }


}



#pragma mark-------------------Button点击事件------------------------------


-(void)ButtonMarriageisTasted:(UIButton*)sender{

    ShwanMarriageController * marriage =[ShwanMarriageController new];
    
    [self presentViewController:marriage animated:NO completion:nil];




}


-(void)control4Action:(UIControl*)sender{

    ShwanWeddingController * wedding =[ShwanWeddingController new];
    
    wedding.imageViewArray=_weddingDressArray;
    wedding.nameArray=_titleArray;
   
    NSLog(@"%@",wedding.nameArray);

    [self presentViewController:wedding animated:NO completion:nil];


}

-(void)cityBUtton4Action:(UIButton*)sender{


  
    [_CityBUtton setImage:[UIImage imageNamed:@"iconfont-shangsanjiao"] forState:UIControlStateNormal];
    
    [_CityBUtton setTitle:@"1" forState:UIControlStateHighlighted];
    
    ShwanClassificationController * shwanView =[ShwanClassificationController new];
    
    self.cancelButton=[[UIButton alloc]initWithFrame:CGRectMake(167.5, 0, 40, 40)];
    _cancelButton.backgroundColor=[UIColor whiteColor];
    
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(cancelButton4Action:) forControlEvents:UIControlEventTouchUpInside];
    _cancelButton.layer.cornerRadius=20;
    
    _cancelButton.layer.masksToBounds=YES;
    
    _cancelButton.layer.borderWidth=1;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 1, 2 });
    
    [_cancelButton.layer setBorderColor:colorref];
    
    self.view4Button =[[UIView  alloc]initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, 200)];
    
    
    
    self.table4button=[[UITableView  alloc]initWithFrame:CGRectMake(0, 40, _view4Button.frame.size.width, 200) style:UITableViewStylePlain];
    _table4button.backgroundColor=[UIColor purpleColor];
    [_view4Button addSubview:_cancelButton];
    [_view4Button  addSubview:_table4button];
    [shwanView.view addSubview:_view4Button];
    
  
    [self presentViewController:shwanView animated:NO completion:nil];
   
    
    
    

}




-(void)cancelButton4Action:(UIButton*)sender{
    
    
    
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    
}





@end
