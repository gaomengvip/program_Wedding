//
//  ResignController.h
//  Wedding
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResignController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *lab4username;
@property (weak, nonatomic) IBOutlet UITextField *lab4firstPassword;
@property (weak, nonatomic) IBOutlet UITextField *lab4secoundPassword;
@property (weak, nonatomic) IBOutlet UITextField *lab4email;
@property (weak, nonatomic) IBOutlet UITextField *lab4phone;

- (IBAction)btn4sure:(id)sender;
- (IBAction)btn4cancel:(id)sender;

@end
