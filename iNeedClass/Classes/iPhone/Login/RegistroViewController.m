//
//  RegistroViewController.m
//  iNeedClass
//
//  Created by injevm on 21/7/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import "RegistroViewController.h"
#import "ProfileViewController.h"

@interface RegistroViewController ()

@end

@implementation RegistroViewController
@synthesize textFNAC;
@synthesize TextApellidos;
@synthesize textNombre;
@synthesize textEmail;
@synthesize textPass;
@synthesize textRePass;
@synthesize labelTitle;
@synthesize buttonContinuarNombre;
@synthesize buttonContinuarUsuario;
@synthesize scrollview;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [labelTitle setFont:[UIFont fontMontseBold:20]];
    
    //[buttonContinuarUsuario setEnabled:NO];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"previous-24"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    
    [self.navigationItem setLeftBarButtonItem:backButton animated:YES];

}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionNombre:(id)sender {
    ProfileViewController *profile = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:profile animated:YES];
}

- (IBAction)actionUsuario:(id)sender {
    [scrollview setContentOffset:CGPointMake(320, -62) animated:YES];
}

- (IBAction)pasoAtras:(id)sender {
    [scrollview setContentOffset:CGPointMake(0, -62) animated:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField.tag == 6){
        NSInteger longitud = [textField.text length] + [string length];
        if(longitud > 10){
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
