//
//  ShwanHandShare.m
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanHandShare.h"
#import "ShwanpackageModle.h"
#import "ShwanComboModle.h"
#import "Shwanmerchant.h"
#import "ShwanMoreModle.h"
#import "ShwanMoreComoModle.h"

#define URL4Package(number) [NSString stringWithFormat:@"http://www.hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList?per_page=20&first_query_time=2015-10-08T08:27:34Z&sort%5Bkey%5D=default&sort%5Border%5D=desc&city=1&%@",[NSString stringWithFormat:@"property=%ld&commodity_type=1&page=1",number]]


#define URLcombo(number)[NSString stringWithFormat:@"http://hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList/page/1/per_page/20?city=1&commodity_type=0&first_query_time=2015-10-09T03%3A23%3A56Z&property=%ld&sort%5Bkey%5D=default&sort%5Border%5D=desc",number]

#define URL4merchant(number)[NSString stringWithFormat:@"http://hunliji.com/p/wedding/index.php/home/APIMerchant/getMerchant?city=1&page=1&per_page=20&property=%ld",number]


#define URLMore(number)[NSString stringWithFormat:@"http://hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList/page/1/per_page/20?city=1&commodity_type=0&first_query_time=2015-10-10T01%3A54%3A57Z&mark=14&sort%5Bkey%5D=default&sort%5Border%5D=desc",number]


#define URLMoreComo(number)[NSString stringWithFormat:@"http://hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList/page/1/per_page/20?city=1&commodity_type=0&first_query_time=2015-10-10T01%3A54%3A57Z&mark=14&sort%5Bkey%5D=default&sort%5Border%5D=desc",number]


@interface ShwanHandShare ();

@property(nonatomic,assign)NSInteger myNumber;

@end


@implementation ShwanHandShare


+(ShwanHandShare*)share{


    static ShwanHandShare * share =nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share =[ShwanHandShare new];
    });

    return share;

}

-(void)setWithNumber:(NSInteger)number URL:(void (^)())blockURL{
    number=_number;
    NSString *str1 = [NSString stringWithFormat:@"&property=%ld&commodity_type=1&page=1",number];
      NSString *str = [NSString stringWithFormat:@"http://www.hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList?per_page=20&first_query_time=2015-10-08T08:27:34Z&sort%5Bkey%5D=default&sort%5Border%5D=desc&city=1"];
    NSString *url = [str stringByAppendingString:str1];
   
    
    
//    NSLog(@"%ld",number);
//    NSString * url1 =URL4Package(number);
    
   // NSString * url=[NSString stringWithFormat:@"%@%ld",URLLLLLLLL,number];
    
  
   // NSLog(@"%@",url1);
    NSURLRequest * request =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSArray * array =dict[@"works"];
        
       // NSLog(@"%@",array);
        
        _array=[NSMutableArray array];
        for (NSDictionary * dic in array) {
            
            ShwanpackageModle * modle=[ShwanpackageModle new];
            [modle setValuesForKeysWithDictionary:dic];
            [self.array addObject:modle];
            
           // NSLog(@"%@",modle.title);
            
            }
         blockURL();

        
        
        
        
        
    }];
    
}



-(void)setWithComboNumber:(NSInteger)number URL:(void(^)())blockURL{
    
    
    
    
    
    
    
    number=_number;
   
    
    NSString * str=[NSString stringWithFormat:@"&property=%ld",number];
    
    NSString * str1=[NSString stringWithFormat:@"http://hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList/page/1/per_page/20?city=1&commodity_type=1&first_query_time=2015-10-09T03%3A23%3A56Z"];
    
    NSString * str3 =[NSString stringWithFormat:@"&sort%5Bkey%5D=default&sort%5Border%5D=desc"];
    
    NSString*str2=[str1 stringByAppendingString:str];
    
    NSString *url = [str2 stringByAppendingString:str3];
    
    NSURLRequest * request =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
       // NSLog(@"%@",dict);
      
        NSArray * array =dict[@"works"];
        
        _comboArray=[NSMutableArray array];
        for (NSDictionary * dic in array) {
            
            ShwanComboModle * modle=[ShwanComboModle new];
            [modle setValuesForKeysWithDictionary:dic];
            [self.comboArray addObject:modle];
           // NSLog(@"======%@",modle.merchant[@"sign"]);
            NSLog(@"%@",modle.title);
            
        }
        blockURL();

        
        
        
    }];

    
    
    
    
    
    
    
}

-(void)setWithMerchantNumber:(NSInteger)number URL:(void (^)())blockURL{



    number=_number;
    
    NSString * url=URL4merchant(number);






    NSURLRequest * request =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
      //  NSLog(@"%@",dict);
        
        NSDictionary * dic =dict[@"data"];
        NSArray * array =dic[@"merchants"];
        NSLog(@"%@",array);
        
        _merchantArray=[NSMutableArray array];
        for (NSDictionary * dic1 in array) {
            
            Shwanmerchant * modle =[Shwanmerchant new];
            
            [modle setValuesForKeysWithDictionary:dic1];
            
            [self.merchantArray addObject:modle];
            }
        blockURL();
        
    }];


}

-(void)setWithMoreNumber:(NSInteger)number URL:(void (^)())blockURL{
    
    //http://hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList/page/1/per_page/20?city=1&commodity_type=1&first_query_time=2015-10-10T01%3A54%3A57Z&mark=14&sort%5Bkey%5D=default&sort%5Border%5D=desc
    
    //http://hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList/page/1/per_page/20?city=1&commodity_type=1&first_query_time=2015-10-10T01%3A54%3A57Z&mark=14&sort%5Bkey%5D=default&sort%5Border%5D=desc
    number=_Morenumber;
    
   
    
    NSString * str1=[NSString  stringWithFormat:@"&mark=%ld",number];
    NSString* str2 =[NSString stringWithFormat:@"http://hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList/page/1/per_page/20?city=1&commodity_type=1&first_query_time=2015-10-10T01%3A54%3A57Z"];
    NSString* str3 =[NSString stringWithFormat:@"&sort%5Bkey%5D=default&sort%5Border%5D=desc"];
    
    NSString * str4=[str2 stringByAppendingString:str1];
    
    NSString * url =[str4 stringByAppendingString:str3];
    
    NSLog(@"%@",url);
    NSURLRequest * request =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        //  NSLog(@"%@",dict);
        
                
        NSArray * array =dict[@"works"];
        
        _moreArray=[NSMutableArray array];
        for (NSDictionary * dic in array) {
            
            ShwanMoreModle * modle=[ShwanMoreModle new];
            [modle setValuesForKeysWithDictionary:dic];
            [self.moreArray addObject:modle];
            // NSLog(@"======%@",modle.merchant[@"sign"]);
            
            NSLog(@"-------------------------------------------%@",modle.title);
        }
        blockURL();
        
    }];
    
    
}
-(void)setWithMorecomNumber:(NSInteger)number URL:(void (^)())blockURL{
    
    //http://hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList/page/1/per_page/20?city=1&commodity_type=1&first_query_time=2015-10-10T01%3A54%3A57Z&mark=14&sort%5Bkey%5D=default&sort%5Border%5D=desc
    
    number=_Morenumber;
    
    
    
    NSString * str1=[NSString  stringWithFormat:@"&mark=%ld",number];
    NSString* str2 =[NSString stringWithFormat:@"http://hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList/page/1/per_page/20?city=1&commodity_type=0&first_query_time=2015-10-10T01%3A54%3A57Z"];
    NSString* str3 =[NSString stringWithFormat:@"&sort%5Bkey%5D=default&sort%5Border%5D=desc"];
    
    NSString * str4=[str2 stringByAppendingString:str1];
    
    NSString * url =[str4 stringByAppendingString:str3];
    
    NSLog(@"%@",url);
    NSURLRequest * request =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        //  NSLog(@"%@",dict);
        
        
        NSArray * array =dict[@"works"];
        
        _moreComArray=[NSMutableArray array];
        for (NSDictionary * dic in array) {
            
            ShwanMoreComoModle * modle=[ShwanMoreComoModle new];
            [modle setValuesForKeysWithDictionary:dic];
            [self.moreComArray addObject:modle];
            // NSLog(@"======%@",modle.merchant[@"sign"]);
            
            NSLog(@"====================================%@",modle.title);
        }
        blockURL();
        
    }];
    
    
}

@end
