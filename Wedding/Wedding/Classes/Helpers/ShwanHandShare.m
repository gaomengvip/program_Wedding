//
//  ShwanHandShare.m
//  Wedding
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ShwanHandShare.h"
#import "ShwanpackageModle.h"

#define URL4Package(nubmer) [NSString stringWithFormat:@"http://www.hunliji.com/p/wedding/index.php/home/APIMerchant/WorkList?per_page=20&first_query_time=2015-10-08T08:27:34Z&sort%5Bkey%5D=default&sort%5Border%5D=desc&city=1&property=%@&commodity_type=1&page=1",number];


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

-(void)setWithNumber:(NSString*)number URL:(void (^)())blockURL{
    
    number=_number;
    NSLog(@"%@",number);
    
    
    NSString * url=URL4Package(number);
    
    NSLog(@"%@",url);
    NSURLRequest * request =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSArray * array =dict[@"works"];
        
        NSLog(@"%@",array);
        
        _array=[NSMutableArray array];
        for (NSDictionary * dic in array) {
            
            ShwanpackageModle * modle=[ShwanpackageModle new];
            [modle setValuesForKeysWithDictionary:dic];
            [self.array addObject:modle];
            
            NSLog(@"%@",modle.title);
            
            }
         blockURL();

        
        
        
        
        
    }];
    
    
    
    
    
    
    
    
    
    
    





}

@end
