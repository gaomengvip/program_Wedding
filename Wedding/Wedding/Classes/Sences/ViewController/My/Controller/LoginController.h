//
//  LoginController.h
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txt4username;
@property (weak, nonatomic) IBOutlet UITextField *txt4password;

- (IBAction)btn4login:(id)sender;

- (IBAction)btn4resign:(id)sender;
@end
