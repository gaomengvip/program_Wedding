//
//  LoginController.m
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "LoginController.h"
#import "ResignController.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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


#pragma mark ---- 跳转页面-----
- (IBAction)btn4login:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btn4resign:(id)sender {
    ResignController *resignVC = [[ResignController alloc]init];
    [self.navigationController pushViewController:resignVC animated:YES];
}
@end
