//
//  MenuViewController.m
//  iNeedClass
//
//  Created by Jesus Victorio on 16/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "MenuViewController.h"
#import "UIColor+RGB.h"
#import "MenuItemCell.h"


static NSString * const MenuCellIdentifier = @"MenuItemCell";


@interface MenuViewController ()

@property (weak, nonatomic) id<MenuDelegate>delegate;
@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePic;
@property (nonatomic, strong) FBLoginView *loginView;

@end


@implementation MenuViewController

- (IBAction)openProfile:(id)sender {
    [_delegate didMenuItemSelected:5];
}

- (id)initMenuWithDelegate:(id<MenuDelegate>)delegate
{
    if ( self = [super init] ) {
        _delegate = delegate;
        [self.view setBackgroundColor:[UIColor colorWithHexString:@"4bc1d2"]];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView setRowHeight:62.0];
    
    [self.tableView registerNib:[MenuItemCell nib] forCellReuseIdentifier:MenuCellIdentifier];
    
    [self.labelName setTextAlignment:NSTextAlignmentCenter];
    [self.labelName setTextColor:[UIColor whiteColor]];
    self.labelName.backgroundColor = [UIColor colorWithHexString:@"4bc1d2"];
    self.labelName.layer.cornerRadius = 15;
    [self.labelName setFont:[UIFont fontWithName:@"Montserrat-Bold" size:17]];
    [self.labelName setText:@"Dr Mustache"];
    
    self.loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(0, 0, 320, 5)];
    
    self.loginView.delegate = self;
    
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
    //self.labelName.layer.borderColor = [UIColor redColor].CGColor;
    //originaltagLbl.layer.borderWidth = 1;
    //[scrollView addSubview:originaltagLbl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:MenuCellIdentifier];
    
    NSString *menuItemLabel = nil;
    UIImage *menuItemIcon = nil;
    
    switch (indexPath.row)
    {
        case 0:
            menuItemLabel = @"Home";
            menuItemIcon = [UIImage imageNamed:@"home-50White"];
            break;
            
        case 1:
            menuItemLabel = @"Añadir Asignatura";
            menuItemIcon = [UIImage imageNamed:@"iconoTeacher"];
            break;
            
        case 2:
            menuItemLabel = @"Añadir Intercambio";
            menuItemIcon = [UIImage imageNamed:@"data_in_both_directions-50White"];
            break;
            
        case 3:
            menuItemLabel = @"Configuración";
            menuItemIcon = [UIImage imageNamed:@"settingsWhite"];
            break;
        case 4:
            menuItemLabel = @"Login";
            menuItemIcon = [UIImage imageNamed:@"enter-50White"];
            break;
    }
    
    [cell.iconImage setImage:menuItemIcon];
    [cell.descriptionLabel setText:menuItemLabel];
    [cell.descriptionLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:18]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_delegate didMenuItemSelected:indexPath.row];
}

#pragma mark - FBLoginViewDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    // first get the buttons set for login mode
    [self.profilePic setHidden:NO];
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    // here we use helper properties of FBGraphUser to dot-through to first_name and
    // id properties of the json response from the server; alternatively we could use
    // NSDictionary methods such as objectForKey to get values from the my json object
    self.labelName.text = [NSString stringWithFormat:@"%@", user.first_name];
    // setting the profileID property of the FBProfilePictureView instance
    // causes the control to fetch and display the profile picture for the user
    self.profilePic.profileID = user.objectID;

}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // test to see if we can use the share dialog built into the Facebook application
    FBLinkShareParams *p = [[FBLinkShareParams alloc] init];
    p.link = [NSURL URLWithString:@"http://developers.facebook.com/ios"];
    
    self.profilePic.profileID = nil;
    [self.profilePic setHidden:YES];
    self.labelName.text = @"Dr Mustache";
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    // see https://developers.facebook.com/docs/reference/api/errors/ for general guidance on error handling for Facebook API
    // our policy here is to let the login view handle errors, but to log the results
    NSLog(@"FBLoginView encountered an error=%@", error);
}



@end
