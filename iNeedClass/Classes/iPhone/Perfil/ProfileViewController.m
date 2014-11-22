//
//  ProfileViewController.m
//  iNeedClass
//
//  Created by injevm on 21/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "ProfileViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+RGB.h"
#import "AppDelegate.h"

@interface ProfileViewController ()
{
    UIBarButtonItem *menuButton;
    AppDelegate *delegate;
}

@property (nonatomic, strong) FBLoginView *loginView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    delegate = [AppDelegate sharedInstance];

    [[UIBarButtonItem appearance] setTintColor:[UIColor colorINC]];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];
    
    self.loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(0, 0, 320, 5)];
    
    self.loginView.delegate = self;
    
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
    [self.navigationItem setTitle:@"Perfil"];
    
    menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuWhite"]
                                                  style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(menuAction)];
    
    [self.navigationItem setLeftBarButtonItem:menuButton];
    
    [menuButton setEnabled:YES];
    
    [self prepareViews];
    [self prepareLabelAndButtons];
    
}

- (void)menuAction
{
    [delegate switchLateralPanelState];
}

- (void)prepareViews
{
    //Vista general
    
    self.containerProfile.layer.shadowOffset = CGSizeMake(0, 2);
    self.containerProfile.layer.shadowRadius = 2;
    self.containerProfile.layer.shadowOpacity = 0.5;
    
    //TabBar
    
    [self.menuTabOptions.layer setBorderWidth:0.0];
    self.menuTabOptions.clipsToBounds = YES;
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor colorINC]];
    
    self.imageFB.layer.cornerRadius = self.imageFB.frame.size.width / 2;
    self.imageFB.clipsToBounds = YES;
    self.imageFB.layer.borderWidth = 3.0f;
    self.imageFB.layer.borderColor = [UIColor colorINC].CGColor;
    
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2;
    self.imageView.clipsToBounds = YES;
    self.imageView.layer.borderWidth = 3.0f;
    self.imageView.layer.borderColor = [UIColor colorINC].CGColor;

}

#pragma mark - FBLoginViewDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    // first get the buttons set for login mode
    [self.imageFB setHidden:NO];
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    // here we use helper properties of FBGraphUser to dot-through to first_name and
    // id properties of the json response from the server; alternatively we could use
    // NSDictionary methods such as objectForKey to get values from the my json object
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", user.first_name, user.last_name];
    // setting the profileID property of the FBProfilePictureView instance
    // causes the control to fetch and display the profile picture for the user
    self.imageFB.profileID = user.objectID;
    
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // test to see if we can use the share dialog built into the Facebook application
    FBLinkShareParams *p = [[FBLinkShareParams alloc] init];
    p.link = [NSURL URLWithString:@"http://developers.facebook.com/ios"];
    
}

- (void)prepareLabelAndButtons
{
    [self.nameLabel setFont:[UIFont fontWithName:@"Montserrat-Bold" size:16.0]];
    [self.valorationButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:15.0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
