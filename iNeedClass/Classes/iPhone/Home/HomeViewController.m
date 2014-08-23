//
//  HomeViewController.m
//  iNeedClass
//
//  Created by Jesus Victorio on 10/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "UIColor+RGB.h"
#import "AboutViewController.h"

@interface HomeViewController (){
    // Botones de 'Edicion'
    UIBarButtonItem *menuButton;
    
    UIButton *mustache;
    
    AppDelegate *delegate;
    
    UIView *tutorialGray;
    
    NSTimer *timer;
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
    
    mustache = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [mustache addTarget:self
                 action:@selector(actionHelp)
       forControlEvents:UIControlEventTouchUpInside];
    
    [mustache setImage:[UIImage imageNamed:@"Doctor100.png"] forState:UIControlStateNormal];
    mustache.frame = CGRectMake(242, 20, 65, 65);
    
    //[self initWithButtons];
    
    [self.navigationItem setLeftBarButtonItem:menuButton];
    
    [menuButton setEnabled:YES];
    
    [self.navigationController.navigationBar setHidden:NO];
    
    [self animationBarraVertical];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *firstTime = [defaults objectForKey:@"firstTime"];
    
    if(![firstTime isEqualToString:@"1"]){
        [self loadFirstTime];
        [defaults setObject:@"1" forKey:@"firstTime"];
        [defaults synchronize];
    }else{
        [self.navigationController.navigationBar setHidden:NO];
        
        [mustache setHidden:NO];
        
        [self.navigationController.view addSubview:mustache];
        
        [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"4bc1d2"]];
    }
    
}

- (void)loadFirstTime
{
    tutorialGray = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [tutorialGray setBackgroundColor:[UIColor blackColor]];
    
    [tutorialGray setAlpha:0.8];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(doSingleTap)];
    singleTap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:singleTap];
    
    [tutorialGray addGestureRecognizer:singleTap];
    
    [self.view addSubview:tutorialGray];
    //poner en primer plano al doctor y un mensaje para explicar q es el tutorial.
    //almacenar si es la primera vez que se entra en la app.
    //deshabilitar el icono del menu
    
    [self.navigationController.view addSubview:mustache];
    
    [self.tutorial setHidden:NO];
    [self.arrow setHidden:NO];
    [menuButton setEnabled:NO];
    
    
    [self.view addSubview:self.tutorial];
    
    [self.view addSubview:self.arrow];
    
}

- (void)finishFirstTime
{
    [self.arrow removeFromSuperview];
    [self.tutorial removeFromSuperview];
    [tutorialGray removeFromSuperview];
    [menuButton setEnabled:YES];
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
    [UIView setAnimationDuration:4];
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

- (void)doSingleTap
{
    [self finishFirstTime];
}

- (IBAction)actionHelp{
    
    NSLog(@"DALE");
    
}

- (IBAction)actionAbout:(id)sender {
    [mustache removeFromSuperview];
    AboutViewController *about = [[AboutViewController alloc]init];
    [self.navigationController pushViewController:about animated:YES];
}

- (IBAction)actionClass:(id)sender {
}

- (IBAction)actionExchange:(id)sender {
}
@end
