//
//  RegistroViewController.m
//  iNeedClass
//
//  Created by injevm on 21/7/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import "RegistroViewController.h"
#import "ProfileViewController.h"
#import "SITNotificator.h"
#import "Constants.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

@interface RegistroViewController (){
    NSInteger index;
}

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
    
    index = -1;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"previous-24"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
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
    [scrollview setContentOffset:CGPointMake(640, -62) animated:YES];
}

- (IBAction)actionUsuario:(id)sender {
    [scrollview setContentOffset:CGPointMake(320, -62) animated:YES];
}

- (IBAction)pasoAtras:(id)sender {
    [scrollview setContentOffset:CGPointMake(0, -62) animated:YES];
}

- (IBAction)actionFinaliza:(id)sender {
    [SITNotificator notifyEvent:CloseRegistro withUserInfo:nil];
    
}

- (IBAction)pasoAtras2:(id)sender {
    [scrollview setContentOffset:CGPointMake(320, -62) animated:YES];
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

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    UIImageView *imagen = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long)(indexPath.row+1)]]];
    UIImageView *imagen2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long)(indexPath.row+1)]]];
    [imagen setFrame:CGRectMake(0, 0, 75, 75)];
    [imagen2 setFrame:CGRectMake(0, 0, 75, 75)];
    
    imagen.layer.cornerRadius = 25.0f;
    imagen.layer.borderWidth = 2.0f;
    imagen.layer.borderColor = [UIColor whiteColor].CGColor;
    imagen.layer.masksToBounds = YES;
    
    imagen2.layer.cornerRadius = 25.0f;
    imagen2.layer.borderWidth = 2.0f;
    imagen2.layer.borderColor = [UIColor redColor].CGColor;
    imagen2.layer.masksToBounds = YES;
    
    [cell setBackgroundView: imagen];
    
    [cell setSelectedBackgroundView: imagen2];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    index = indexPath.row;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}

@end
