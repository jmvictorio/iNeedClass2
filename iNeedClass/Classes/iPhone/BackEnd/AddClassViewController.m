//
//  AddClassViewController.m
//  iNeedClass
//
//  Created by injevm on 20/3/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import "AddClassViewController.h"
#import "AddClassTeachViewController.h"
#import "AddClassAlumnViewController.h"

@interface AddClassViewController ()
{
    UIBarButtonItem *menuButton;
    AppDelegate *delegate;
}

@end

@implementation AddClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    delegate = [AppDelegate sharedInstance];
    
    [delegate doOverlay];
    
    [self.addTitleLabel setFont:[UIFont fontMontseBold:20]];
    
    [self.buttonInfo setFont:[UIFont fontMontseRegular:18]];
    
    [self.buttonBuscar.titleLabel setFont:[UIFont fontMontseBold:15]];
    [self.buttonBuscar.layer setCornerRadius:15];
    [self.buttonBuscar.layer setShadowOffset:CGSizeMake(1, 1)];
    [self.buttonBuscar.layer setShadowRadius:2];
    [self.buttonBuscar.layer setShadowOpacity:0.5];
    
    [self.buttonImpartir.titleLabel setFont:[UIFont fontMontseBold:15]];
    [self.buttonImpartir.layer setCornerRadius:15];
    [self.buttonImpartir.layer setShadowOffset:CGSizeMake(1, 1)];
    [self.buttonImpartir.layer setShadowRadius:2];
    [self.buttonImpartir.layer setShadowOpacity:0.5];
    
}

- (IBAction)menuAction:(id)sender
{
    [delegate switchLateralPanelState];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionBuscar:(id)sender {
    AddClassAlumnViewController *alumn = [[AddClassAlumnViewController alloc]init];
    [self.navigationController pushViewController:alumn animated:YES];
}

- (IBAction)actionImpartir:(id)sender {
    AddClassTeachViewController *teach = [[AddClassTeachViewController alloc]init];
    [self.navigationController pushViewController:teach animated:YES];
}

@end
