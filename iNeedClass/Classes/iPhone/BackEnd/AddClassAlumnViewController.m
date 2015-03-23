//
//  AddClassAlumnViewController.m
//  iNeedClass
//
//  Created by injevm on 20/3/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import "AddClassAlumnViewController.h"
#import "AppDelegate.h"

@interface AddClassAlumnViewController ()
{
    AppDelegate *delegate;
}

@end

@implementation AddClassAlumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    delegate = [AppDelegate sharedInstance];
    
    [self.labelTitle setFont:[UIFont fontMontseBold:22]];
    
    [self.buttonSelectTime.titleLabel setFont:[UIFont fontMontseRegular:13]];
    [self.buttonNoMatery.titleLabel setFont:[UIFont fontMontseRegular:13]];
    
    [self.buttonShow.titleLabel setFont:[UIFont fontMontseBold:15]];
    [self.buttonShow.layer setCornerRadius:15];
    [self.buttonShow.layer setShadowOffset:CGSizeMake(1, 1)];
    [self.buttonShow.layer setShadowRadius:2];
    [self.buttonShow.layer setShadowOpacity:0.5];
    
    [self.buttonSave.titleLabel setFont:[UIFont fontMontseBold:15]];
    [self.buttonSave.layer setCornerRadius:15];
    [self.buttonSave.layer setShadowOffset:CGSizeMake(1, 1)];
    [self.buttonSave.layer setShadowRadius:2];
    [self.buttonSave.layer setShadowOpacity:0.5];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuAction:(id)sender
{
    [delegate switchLateralPanelState];
}

- (IBAction)actionShow:(id)sender {
    
}

- (IBAction)actionSave:(id)sender {
    
}

@end
