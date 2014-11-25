//
//  LoginViewController.m
//  iNeedClass
//
//  Created by injevm on 01/09/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "LoginViewController.h"
#import "ProfileViewController.h"


@interface LoginViewController ()
{
    UIBarButtonItem *menuButton;
    AppDelegate *delegate;
}

@property (nonatomic, strong) FBLoginView *loginView;
@end

@implementation LoginViewController

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
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];
    
    [self.buttonLogin.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:17]];
    [self.buttonRegister.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:17]];
    [self.labelOR setFont:[UIFont fontWithName:@"Montserrat-Regular" size:15]];
    [self.textFieldEmail setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14]];
    [self.textFieldPass setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14]];
    
    [self.buttonPassOK.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:16]];
    [self.buttonPassOK.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.buttonPassOK.titleLabel setNumberOfLines:5];
    
    delegate = [AppDelegate sharedInstance];
    
    [self.viewButtons setBackgroundColor:[UIColor colorWithHexString:@"3b5998"]];
    
    menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuWhite"]
                                                  style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(menuAction)];
    
    [self.navigationItem setLeftBarButtonItem:menuButton];
    
    [menuButton setEnabled:YES];
    
    self.loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(0, 0, 320, 5)];
    
    self.loginView.delegate = self;
    
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
    [self.viewButtons addSubview:self.loginView];
}

#pragma mark - FBLoginViewDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    // first get the buttons set for login mode
    NSLog(@"LOGADO, DEBE DE IR DIRECTAMENTE A PERFIL");
    [self.buttonPassOK setHidden:NO];
    /* self.buttonPostPhoto.enabled = YES;
     self.buttonPostStatus.enabled = YES;
     self.buttonPickFriends.enabled = YES;
     self.buttonPickPlace.enabled = YES;
     
     // "Post Status" available when logged on and potentially when logged off.  Differentiate in the label.
     [self.buttonPostStatus setTitle:@"Post Status Update (Logged On)" forState:self.buttonPostStatus.state];*/
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    
    NSLog(@"RECOGIDA DE DATOS DE USUARIO DE FB");
    // here we use helper properties of FBGraphUser to dot-through to first_name and
    // id properties of the json response from the server; alternatively we could use
    // NSDictionary methods such as objectForKey to get values from the my json object
    
    
    //self.labelFirstName.text = [NSString stringWithFormat:@"Hello %@!", user.first_name];
    // setting the profileID property of the FBProfilePictureView instance
    // causes the control to fetch and display the profile picture for the user
    //self.profilePic.profileID = user.objectID;
    //self.loggedInUser = user;
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // test to see if we can use the share dialog built into the Facebook application
    FBLinkShareParams *p = [[FBLinkShareParams alloc] init];
    p.link = [NSURL URLWithString:@"http://developers.facebook.com/ios"];
    [self.buttonPassOK setHidden:YES];
    //BOOL canShareFB = [FBDialogs canPresentShareDialogWithParams:p];
    //BOOL canShareiOS6 = [FBDialogs canPresentOSIntegratedShareDialogWithSession:nil];
    //BOOL canShareFBPhoto = [FBDialogs canPresentShareDialogWithPhotos];
    
    /*self.buttonPostStatus.enabled = canShareFB || canShareiOS6;
     self.buttonPostPhoto.enabled = canShareFBPhoto;
     self.buttonPickFriends.enabled = NO;
     self.buttonPickPlace.enabled = NO;
     
     // "Post Status" available when logged on and potentially when logged off.  Differentiate in the label.
     [self.buttonPostStatus setTitle:@"Post Status Update (Logged Off)" forState:self.buttonPostStatus.state];
     
     self.profilePic.profileID = nil;
     self.labelFirstName.text = nil;
     self.loggedInUser = nil;*/
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    // see https://developers.facebook.com/docs/reference/api/errors/ for general guidance on error handling for Facebook API
    // our policy here is to let the login view handle errors, but to log the results
    NSLog(@"FBLoginView encountered an error=%@", error);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginUser:(id)sender {
    NSLog(@"LOGARSE");
}

- (IBAction)RegisterUser:(id)sender {
    NSLog(@"REGISTRATE");
}

- (IBAction)passOK:(id)sender {
    
    ProfileViewController *profileView = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:profileView animated:YES];
}

- (void)menuAction
{
    [delegate switchLateralPanelState];
}
@end
