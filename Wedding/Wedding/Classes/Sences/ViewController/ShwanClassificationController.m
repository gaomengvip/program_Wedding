//
//  ShwanClassificationController.m
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanClassificationController.h"
#import "SHwanModle.h"
#import "ShwanClassificationCell.h"
#import "ShwanViewController.h"
#import "ShwanHandShare.h"


@interface ShwanClassificationController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>



@property(nonatomic,strong)UISearchBar * searchBar;

@property(nonatomic,strong)UILabel * searchLable;
@property(nonatomic,strong)UIButton * CityBUtton;
@property(nonatomic,strong)UITableView * table4button;
@property(nonatomic,strong)UIView * view4Button;
@property(nonatomic,strong)UIButton * cancelButton;
@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * modleArray;


@end


static NSString * URL4LocalService = @"http://www.hunliji.com/p/wedding/index.php/home/APIFrontPage/getClass?cid=0";

static NSString * URL4Marriage     = @"http://www.hunliji.com/p/wedding/index.php/home/APIFrontPage/getClass?cid=1";

@implementation ShwanClassificationController




-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{



    if (self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        [self searchLable];
        [self searchBar];
        [self CityBUtton];
        [self scrollView];
        [self tableView];
       
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
                
#pragma mark---------------------懒加载------------------------------------
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
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 10, self.scrollView.frame.size.width, 600)];
        
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.scrollEnabled=NO;
        [_scrollView addSubview:_tableView];
    }



    return _tableView;
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
    
    
    
    if (indexPath.row==1) {
        
   
        self.number=@"6";
        
        
        [ShwanHandShare share].number=self.number;
    
    
    [self presentViewController:shwan animated:NO completion:nil];


 }


}











#pragma mark------------------ searchBar代理方法---------------------------

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    if ([_searchBar.text isEqualToString:@"商家"]) {
       
        
        NSLog(@"跳转到商家页面");
    }


}



#pragma mark-------------------Button点击事件------------------------------


-(void)cityBUtton4Action:(UIButton*)sender{


  
    [_CityBUtton setImage:[UIImage imageNamed:@"iconfont-shangsanjiao"] forState:UIControlStateNormal];
    
    
    
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
