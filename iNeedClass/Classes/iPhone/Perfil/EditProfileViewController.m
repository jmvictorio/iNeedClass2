//
//  EditProfileViewController.m
//  iNeedClass
//
//  Created by injevm on 25/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "EditProfileViewController.h"
#import "AlertViewController.h"
#import "CXCardView.h"

@interface EditProfileViewController ()
{
    BOOL loginOK;
}

@property (nonatomic, strong) FBLoginView *loginView;

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUp];
}

- (void)setUp
{
    [self.saveButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Bold" size:14]];
    [self.noSaveButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Bold" size:14]];
    
    [self.exitButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14]];
    
    self.loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(0, 0, 320, 5)];
    
    self.loginView.delegate = self;
    
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends", @"user_birthday"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receivedNotification:)
                                                 name:@"passNotification"
                                               object:nil];
    
    [self.switchNotification addTarget:self action:@selector(setState:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - NSNotificationCenter

- (void)receivedNotification:(NSNotification *)notification
{
    NSString *name = [notification name];
    NSString *eventInfo = [notification object];
    
    if([name isEqualToString:@"passNotification"])
    {
        if(![eventInfo isEqualToString:@""])
        {
            [self.textPass setText:eventInfo];
        }
        [self.textPass resignFirstResponder];
    }
}

- (void)setState:(id)sender
{
    BOOL state = [sender isOn];
    NSString *res = state == YES ? @"YES" : @"NO";
    NSLog(@"%@",res);
}

#pragma mark - FBLoginViewDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    // first get the buttons set for login mode
    [self.imageFB setHidden:NO];
    loginOK = true;
    [self.textPass setEnabled:NO];
    [self.textName setEnabled:NO];
    [self.textLastName setEnabled:NO];
    [self.controlSex setEnabled:NO];
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    // here we use helper properties of FBGraphUser to dot-through to first_name and
    // id properties of the json response from the server; alternatively we could use
    // NSDictionary methods such as objectForKey to get values from the my json object
    self.textName.text = user.first_name;
    self.textLastName.text = user.last_name;
    // setting the profileID property of the FBProfilePictureView instance
    // causes the control to fetch and display the profile picture for the user
    self.imageFB.profileID = user.objectID;
    
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"login"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSString *gender = [user objectForKey:@"gender"];
    
    if([gender isEqualToString:@"male"]){
        [self.controlSex setSelectedSegmentIndex:0];
    }else{
        [self.controlSex setSelectedSegmentIndex:1];
    }
    
    self.imageFB.layer.cornerRadius = self.imageFB.frame.size.width / 2;
    self.imageFB.clipsToBounds = YES;
    self.imageFB.layer.borderWidth = 3.0f;
    self.imageFB.layer.borderColor = [UIColor colorINC].CGColor;
    
    [self.fnacLabel setText:[self getDateFromString:[user objectForKey:@"birthday"]]];
    
    [self.textPass setEnabled:NO];
}

-(NSString *)getDateFromString:(NSString *)string
{
    
    NSString * dateString = [NSString stringWithFormat: @"%@",string];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    NSDate* myDate = [dateFormatter dateFromString:dateString];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"d MMMM, yyyy"];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:(@"es_ES")]];

    NSString *stringFromDate = [formatter stringFromDate:myDate];
    
    return stringFromDate;
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // test to see if we can use the share dialog built into the Facebook application
    FBLinkShareParams *p = [[FBLinkShareParams alloc] init];
    p.link = [NSURL URLWithString:@"http://developers.facebook.com/ios"];
    loginOK = false;
    [self.textPass setEnabled:YES];
    [[AppDelegate sharedInstance] didMenuItemSelected:0];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"login"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"actualizaMenu" object:@""];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changePicture:(id)sender
{
    
}

- (IBAction)closeSession:(id)sender
{
    AlertViewController *alert;
    if(loginOK)
    {
        alert = [AlertViewController defaultView:3 valores:nil];
    }
    else
    {
        alert = [AlertViewController defaultView:4 valores:nil];
    }
    
    [alert setDismissHandler:^(AlertViewController *view) {
        // to dismiss current cardView. Also you could call the `dismiss` method.
        [CXCardView dismissCurrent];
    }];
    [CXCardView showWithView:alert draggable:YES];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField.tag == 2)
    {
        [self.textPass resignFirstResponder];
        AlertViewController *alert= [AlertViewController defaultView:5 valores:nil];
        
        [alert setDismissHandler:^(AlertViewController *view) {
            // to dismiss current cardView. Also you could call the `dismiss` method.
            [CXCardView dismissCurrent];
        }];
        [CXCardView showWithView:alert draggable:YES];
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        if(textField.tag==0){
            
            UIResponder* nextResponder = [self.textLastName viewWithTag:1];
            [textField resignFirstResponder];
            [nextResponder becomeFirstResponder];
        }
        else if(textField.tag==1){
            
            [textField resignFirstResponder];
            
        }
        
        return NO;
    }
    return YES;
}


@end
