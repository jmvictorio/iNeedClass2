//
//  HomeViewController.m
//  iNeedClass
//
//  Created by Jesus Victorio on 10/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"

@interface HomeViewController (){
    // Botones de 'Edicion'
    UIBarButtonItem *menuButton;
    
    AppDelegate *delegate;
}

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self preferredStatusBarStyle];
    
    delegate = [AppDelegate sharedInstance];
    
    menuButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                  style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(menuAction)];
    
    [self.navigationItem setLeftBarButtonItem:menuButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)menuAction
{
    [delegate switchLateralPanelState];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



@end
