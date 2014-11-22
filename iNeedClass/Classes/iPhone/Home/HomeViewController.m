//
//  HomeViewController.m
//  iNeedClass
//
//  Created by Jesus Victorio on 10/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "HomeViewController.h"
#import "AboutViewController.h"
#import "TutorialViewController.h"
#import <QuartzCore/QuartzCore.h>

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

- (void)viewWillDisappear:(BOOL)animated
{
    [mustache removeFromSuperview];
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
    
    [self loadFonts];
    
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

- (void)loadFonts
{
    [self.buttonINC.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:25]];
    [self.tutorial setFont:[UIFont fontWithName:@"Montserrat-Regular" size:25]];
    [self.buttonClasses.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:25]];
    [self.buttonExchange.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:25]];
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
    
    self.borde1.layer.cornerRadius = 50;//half of the width
    self.borde1.layer.borderColor=[UIColor colorWithHexString:@"4bc1d2"].CGColor;
    self.borde1.layer.borderWidth=2.0f;
    
    self.borde2.layer.cornerRadius = 50;//half of the width
    self.borde2.layer.borderColor=[UIColor colorWithHexString:@"4bc1d2"].CGColor;
    self.borde2.layer.borderWidth=2.0f;
    
    self.borde3.layer.cornerRadius = 50;//half of the width
    self.borde3.layer.borderColor=[UIColor colorWithHexString:@"4bc1d2"].CGColor;
    self.borde3.layer.borderWidth=2.0f;
    
    [self.borde1 setAlpha:0.0];
    
    [self.borde2 setAlpha:0.0];
    
    [self.borde3 setAlpha:0.0];
    
}

- (void)animationBarraVertical
{
    
    [UIView beginAnimations:@"ShowBarraVertical" context:NULL];
    [UIView setAnimationDuration:4];
    [UIView setAnimationDelegate: self];
    //[UIView setAnimationDidStopSelector: @selector(animation1)];
    
    [self.barraVertical setFrame:CGRectMake(59, 0, 3, self.view.frame.size.height)];
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"ShowBarraVertical1" context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:0];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDidStopSelector:@selector(animation1)];
    
    [self.borde1 setAlpha:1];
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"ShowBarraVertical2" context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:1];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDidStopSelector:@selector(animation2)];
    
    [self.borde2 setAlpha:1];
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"ShowBarraVertical3" context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:3];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationWillStartSelector:@selector(animation3)];
    
    [self.borde3 setAlpha:1];
    
    [UIView commitAnimations];

}

- (void)animation1
{
    [self borderColor:self.borde1];
}

- (void)animation2
{
    [self borderColor:self.borde2];
}

- (void)animation3
{
    [self borderColor:self.borde3];
}

- (void)borderColor:(id)sender
{
    UIColor *stroke = [UIColor colorINC];
    UIView *view = sender;
    NSUInteger borderWidth = 2;
    
    view.layer.borderColor = stroke.CGColor;
    
    CABasicAnimation *borderAnimation = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    borderAnimation.fromValue = (id)[UIColor clearColor].CGColor;
    borderAnimation.toValue = (id)stroke.CGColor;
    borderAnimation.duration = 0.5f;
    [view.layer addAnimation:borderAnimation forKey:nil];
    
    
    CGRect pathFrame = CGRectMake(-CGRectGetMidX(view.bounds), -CGRectGetMidY(view.bounds), view.bounds.size.width, view.bounds.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:pathFrame cornerRadius:view.layer.cornerRadius];
    
    // accounts for left/right offset and contentOffset of scroll view
    CGPoint shapePosition = [self.view convertPoint:view.center fromView:self.view];
    
    CAShapeLayer *circleShape = [CAShapeLayer layer];
    circleShape.path = path.CGPath;
    circleShape.position = shapePosition;
    circleShape.fillColor = [UIColor clearColor].CGColor;
    circleShape.opacity = 0;
    circleShape.strokeColor = stroke.CGColor;
    circleShape.lineWidth = borderWidth;
    
    [self.view.layer addSublayer:circleShape];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.5, 2.5, 1)];
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1;
    alphaAnimation.toValue = @0;
    
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    animation.animations = @[scaleAnimation, alphaAnimation];
    animation.duration = 0.5f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [circleShape addAnimation:animation forKey:nil];
    
    
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
    [mustache removeFromSuperview];
    TutorialViewController *tuto = [[TutorialViewController alloc]init];
    [self.navigationController pushViewController:tuto animated:YES];
    
}

- (IBAction)actionAbout:(id)sender {
    [self animation1];
    
    [mustache removeFromSuperview];
    AboutViewController *about = [[AboutViewController alloc]init];
    [self.navigationController pushViewController:about animated:YES];
}

- (IBAction)actionClass:(id)sender {
    [self animation2];
}

- (IBAction)actionExchange:(id)sender {
    [self animation3];
}
@end
