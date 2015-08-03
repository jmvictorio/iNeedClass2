//
//  IntroViewController.m
//  iNeedClass
//
//  Created by Jesus Victorio on 23/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "IntroViewController.h"
#import "CBZSplashView.h"
#import "SITQueueManager.h"
#import "HomeViewController.h"
#import "GetCitiesAndCountries.h"
#import "UIFont+Montserrat.h"

@interface IntroViewController ()
{
    NSTimer *timer;
    
    AppDelegate *delegate;
}

@end

@implementation IntroViewController

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
    // Do any additional setup after loading the view from its nib.
    timer = [NSTimer scheduledTimerWithTimeInterval:5.0
                                             target:self
                                           selector:@selector(quitarWaitBlue)
                                           userInfo:nil
                                            repeats:NO];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    UIImage *icon = [UIImage imageNamed:@"Business-Situations_05.png"];
    UIColor *color = [UIColor colorWithHexString:@"4bc1d2"];
    
    CBZSplashView *splashView = [[CBZSplashView alloc] initWithIcon:icon backgroundColor:color];
    
    splashView.animationDuration = 5;
    
    [self.view addSubview:splashView];
    
    [splashView startAnimation];
    
    [super viewDidAppear:animated];
}

- (void)quitarWaitBlue
{
    HomeViewController *start = [[HomeViewController alloc]init];
    [self.navigationController pushViewController:start animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
