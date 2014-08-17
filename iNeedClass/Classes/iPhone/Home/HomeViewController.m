//
//  HomeViewController.m
//  iNeedClass
//
//  Created by Jesus Victorio on 10/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"

@interface HomeViewController (){
    // Botones de 'Edicion'
    UIBarButtonItem *menuButton;
    
    AppDelegate *delegate;
}

@end

@implementation HomeViewController

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
    
    [self preferredStatusBarStyle];
    
    delegate = [AppDelegate sharedInstance];
    
    [self setUpAnimations];
    
    menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"]
                                                  style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(menuAction)];
    
    [self.navigationItem setLeftBarButtonItem:menuButton];
    
    [self animationBarraVertical];
    
}

- (void)setUpAnimations
{
    [self.barraVertical setFrame:CGRectMake(59, 0, 3, 0)];
    
    [self.borde1 setAlpha:0.0];
    
    [self.borde2 setAlpha:0.0];
    
    [self.borde3 setAlpha:0.0];
    
    
    
}

- (void)animationBarraVertical
{
    [UIView beginAnimations:@"ShowBarraVertical" context:NULL];
    [UIView setAnimationDuration:3];
    [UIView setAnimationDelegate: self];
    
    [self.barraVertical setFrame:CGRectMake(59, 0, 3, self.view.frame.size.height)];
    
    [UIView setAnimationDuration:1];
    [self.borde1 setAlpha:1];
    
    [UIView setAnimationDuration:2];
    [self.borde2 setAlpha:1];
    
    [UIView setAnimationDuration:3];
    [self.borde3 setAlpha:1];
    
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)menuAction
{
    [delegate switchLateralPanelState];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



@end
