//
//  webViewController.m
//  PersonalProject
//
//  Created by lanou3g on 15/9/21.
//  Copyright (c) 2015年 蓝欧科技. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()<UIWebViewDelegate,MONActivityIndicatorViewDelegate>

@property (nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)UIActivityIndicatorView *activityView;
@property(nonatomic,strong)MONActivityIndicatorView *indicatorView;

@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //活动指示器
    _indicatorView = [[MONActivityIndicatorView alloc] init];
    _indicatorView.numberOfCircles = 6;
    _indicatorView.radius = 20;
    _indicatorView.internalSpacing = 3;
    _indicatorView.center = self.view.center;


    
    
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 65)];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    
    [_webView setBackgroundColor:[UIColor clearColor]];
    [_webView setOpaque:NO];
    _webView.scalesPageToFit = YES;
    _webView.userInteractionEnabled = YES;
    _webView.delegate = self;
    
    UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"T-1.jpg"]];
    img.frame = self.view.frame;
    [self.view addSubview:img];
    img.userInteractionEnabled = YES;
    [img addSubview:_webView];
    
    [img addSubview:_indicatorView];

    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 18, self.view.frame.size.width, 50)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 10, 45, 30);
    [button setImage:[UIImage imageNamed:@"return.ico"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(action4Return) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:button];
    
//    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, self.view.frame.size.width - 140, 30)];
//    lable.backgroundColor = [UIColor purpleColor];
//    lable.text = self.name;
//    lable.font = [UIFont systemFontOfSize:18];
//    [view1 addSubview:lable];

//    view1.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];
    

    
    
    
    // Do any additional setup after loading the view.
}


-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [_indicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_indicatorView stopAnimating];
}

- (void)action4Return{
    [self dismissViewControllerAnimated:YES completion:nil];
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
