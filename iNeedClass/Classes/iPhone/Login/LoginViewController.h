//
//  LoginViewController.h
//  iNeedClass
//
//  Created by injevm on 01/09/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<FBLoginViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *viewButtons;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogin;
@property (weak, nonatomic) IBOutlet UIButton *buttonRegister;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPass;
@property (weak, nonatomic) IBOutlet UILabel *labelOR;

- (IBAction)loginUser:(id)sender;
- (IBAction)RegisterUser:(id)sender;

@end
