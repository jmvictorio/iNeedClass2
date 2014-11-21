//
//  AboutViewController.m
//  iNeedClass
//
//  Created by Jesus Victorio on 22/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    
    [self.navigationController.navigationBar setHidden:YES];
    
    [self loadFont];
    
    [self.PrincipalView.layer setShadowOffset:CGSizeMake(5, 5)];
    [self.PrincipalView.layer setShadowOpacity:0.5];
    [self.PrincipalView.layer setShadowRadius:2.0];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadFont
{
    [self.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:35]];
    [self.designFreepik setFont:[UIFont fontWithName:@"Montserrat-Regular" size:6]];
    [self.tituloFreepik setFont:[UIFont fontWithName:@"Montserrat-Regular" size:10]];
    [self.byME setFont:[UIFont fontWithName:@"Montserrat-Regular" size:15]];
    [self.agrees setFont:[UIFont fontWithName:@"Montserrat-Regular" size:11]];
    [self.appFriend setFont:[UIFont fontWithName:@"Montserrat-Bold" size:12]];
    [self.appFriendDescription setFont:[UIFont fontWithName:@"Montserrat-Regular" size:12]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backToHome:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
