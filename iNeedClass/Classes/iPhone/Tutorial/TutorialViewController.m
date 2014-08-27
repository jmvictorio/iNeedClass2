//
//  TutorialViewController.m
//  iNeedClass
//
//  Created by Jesus Victorio on 22/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "TutorialViewController.h"
#import "AppDelegate.h"

@interface TutorialViewController ()
{
    UIBarButtonItem *menuButton;
    AppDelegate *delegate;
}

@end

@implementation TutorialViewController

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
    // Do any additional setup after loading the view from its nib.
    delegate = [AppDelegate sharedInstance];
    
    menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"]
                                                  style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(menuAction)];
    
    [self.navigationItem setLeftBarButtonItem:menuButton];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self loadFonts];
}

- (void)menuAction
{
    [delegate switchLateralPanelState];
}

- (void)loadFonts
{
    [self.butonSign.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:20]];
    [self.buttonLogin.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:20]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
}

- (IBAction)signAction:(id)sender {
}
@end
