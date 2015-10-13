//
//  button.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "button.h"

@implementation button

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //在init 方法中使用绘图方法,在对象被初始化的时候,自动执行绘制方法
        [self setUp];
        
    }
    return self;
}

-(void)setUp{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 75)];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, 5, self.frame.size.width / 4, 30);
    [button1 setTitle:@"精选" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button1];
    [button1 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(button1.frame.size.width, 5, self.frame.size.width / 4, 30);
    [button2 setTitle:@"婚礼策划" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button2];
    [button2 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    button3.frame = CGRectMake(2 * button1.frame.size.width, 5, self.frame.size.width / 4, 30);
    [button3 setTitle:@"婚纱摄影" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button3];
    [button3 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
    button4.frame = CGRectMake(3 * button1.frame.size.width, 5, self.frame.size.width / 4, 30);
    [button4 setTitle:@"摄影师" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button4];
    [button4 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeSystem];
    button5.frame = CGRectMake(0, 5 + button1.frame.size.height, self.frame.size.width / 4, 30);
    [button5 setTitle:@"摄像师" forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button5];
    [button5 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeSystem];
    button6.frame = CGRectMake(button1.frame.size.width, 5 + button1.frame.size.height , self.frame.size.width / 4, 30);
    [button6 setTitle:@"化妆师" forState:UIControlStateNormal];
    [button6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button6];
    [button6 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeSystem];
    button7.frame = CGRectMake(2 * button1.frame.size.width, 5 + button1.frame.size.height, self.frame.size.width / 4, 30);
    [button7 setTitle:@"主持人" forState:UIControlStateNormal];
    [button7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button7];
    [button7 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeSystem];
    button8.frame = CGRectMake(3 * button1.frame.size.width, 5 + button1.frame.size.height, self.frame.size.width / 4, 30);
    [button8 setTitle:@"婚纱礼服" forState:UIControlStateNormal];
    [button8 setTitle:@"婚纱礼服" forState:UIControlStateHighlighted];
    [button8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button8 addTarget:self action:@selector(chickButton:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button8];
    [self addSubview:view];
}
//点击事件
- (void)chickButton:(UIButton *)action{
    UIButton *button = (UIButton *)action;
    NSString *buttonTitle = button.titleLabel.text;
//    NSLog(@"====");
}




@end
