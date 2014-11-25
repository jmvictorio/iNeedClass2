//
//  EditProfileViewController.m
//  iNeedClass
//
//  Created by injevm on 25/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

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
    
    [self.exitButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
