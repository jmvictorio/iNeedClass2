//
//  ProfileViewController.m
//  iNeedClass
//
//  Created by injevm on 21/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "ProfileViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AlertViewController.h"
#import "CXCardView.h"
#import "EditProfileViewController.h"
#import "ClassViewController.h"

@interface ProfileViewController ()
{
    UIBarButtonItem *menuButton;
    UIBarButtonItem *settingButton;
    AppDelegate *delegate;
}

@property (nonatomic, strong) FBLoginView *loginView;
@property (nonatomic, strong) ClassViewController *classCollection;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    delegate = [AppDelegate sharedInstance];

    [self.navigationController.navigationBar setTintColor:[UIColor colorINC]];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorINC]];
    
    self.loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(0, 0, 320, 5)];
    
    self.loginView.delegate = self;
    
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends", @"user_birthday"];
    
    [self.navigationItem setTitle:@"Perfil"];
    
    menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuWhite"]
                                                  style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(menuAction)];
    
    [self.navigationItem setLeftBarButtonItem:menuButton];
    
    [menuButton setEnabled:YES];

    settingButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings"]
                                                  style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(settingAction)];
    
    [self.navigationItem setRightBarButtonItem:settingButton];
    
    [settingButton setEnabled:YES];

    [self prepareViews];
    [self prepareLabelAndButtons];
    
}

- (void)menuAction
{
    [delegate switchLateralPanelState];
}

- (void)settingAction
{
    EditProfileViewController *editProfile = [[EditProfileViewController alloc] init];
    
    [self.navigationController presentViewController:editProfile animated:YES completion:nil];
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
    [self.buttonAdd.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:15.0]];
    [self.buttonAdd.layer setCornerRadius:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [self removeSubviews];
    self.classCollection = nil;
    if(self.classItem == item)
    {
        self.classCollection = [ClassViewController defaultView:0];
        [self.containerView addSubview:self.classCollection.view];
    }
    else
    {
        self.classCollection=[ClassViewController defaultView:1];
        [self.containerView addSubview:self.classCollection.view];
    }
}

- (void)removeSubviews
{
    for (UIView *view in  [self.containerView subviews]) {
        [view removeFromSuperview];
    }
}

- (IBAction)actionAdd:(id)sender {
    AlertViewController *alert;
    alert = [AlertViewController defaultView:0 valores:nil];
    
    UILabel *descriptionLabel = [[UILabel alloc] init];
    descriptionLabel.frame = CGRectMake(20, 0, 260, 75);
    descriptionLabel.numberOfLines = 0.;
    descriptionLabel.textAlignment = NSTextAlignmentCenter;
    descriptionLabel.backgroundColor = [UIColor clearColor];
    descriptionLabel.textColor = [UIColor blackColor];
    descriptionLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:14.0f];
    descriptionLabel.text = @"¿Qué desea hacer?";
    [alert addSubview:descriptionLabel];
    
    [alert setDismissHandler:^(AlertViewController *view) {
        // to dismiss current cardView. Also you could call the `dismiss` method.
        [CXCardView dismissCurrent];
    }];
    
    
    [CXCardView showWithView:alert draggable:YES];

}
@end
