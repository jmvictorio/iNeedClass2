//
//  EditProfileViewController.h
//  iNeedClass
//
//  Created by injevm on 25/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textLastName;

@property (weak, nonatomic) IBOutlet UISegmentedControl *controlSex;

@property (weak, nonatomic) IBOutlet UILabel *fnacLabel;

@property (weak, nonatomic) IBOutlet UITextField *textPass;
@property (weak, nonatomic) IBOutlet UISwitch *switchNotification;

@property (weak, nonatomic) IBOutlet UIButton *exitButton;
@property (weak, nonatomic) IBOutlet UIView *viewSwitch;

@property (weak, nonatomic) IBOutlet UIButton *noSaveButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)save:(id)sender;
- (IBAction)dismiss:(id)sender;

@end
