//
//  AppDelegate.m
//  iNeedClass
//
//  Created by Jesus Victorio on 10/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "Utils.h"
#import "UIColor+RGB.h"

@interface AppDelegate()

@property (nonatomic, strong) UINavigationController    *navController;
@property (nonatomic, strong) UINavigationController    *navControllerMenu;

@property (nonatomic, strong) HomeViewController        *homeViewController;
@property (nonatomic, strong) UISplitViewController     *splitController;

- (void)appearance;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self appearance];
    
    self.homeViewController    = [HomeViewController new];
    
    if([Utils is_iPhoneDevice])
    {
        self.navController = [[UINavigationController alloc] initWithRootViewController:self.homeViewController];
        
        [self.homeViewController.view setBackgroundColor:[UIColor whiteColor]];
        
        //[self.homeViewController.view setBackgroundColor:[UIColor colorWithHexString:@"4bc1d2"]];
    
        //HACER OVERLAY DE UN NAVIGATIONBAR
        [self.navController.navigationBar setBackgroundImage:[UIImage new]
                                 forBarMetrics:UIBarMetricsDefault];
        self.navController.navigationBar.shadowImage = [UIImage new];
        self.navController.navigationBar.translucent = YES;
        //-----------------
        
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.backgroundColor = [UIColor whiteColor];
        
        self.window.rootViewController = self.navController;
        
        
    }
    //iPad
    /*else
    {
        _detailViewController   = [[DetailiPadViewController alloc] initWithNibName:@"HomeIpadViewController" bundle:nil];
        _navControllerMenu = [[UINavigationController alloc] initWithRootViewController:[self leftViewController]];
        
        _navController = [[UINavigationController alloc]initWithRootViewController:_detailViewController];
        
        self.splitController = [[UISplitViewController alloc] init];
        self.splitController.delegate = _detailViewController;
        
        self.splitController.presentsWithGesture = NO;
        
        self.splitController.viewControllers = @[_navControllerMenu, _navController];
        
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.backgroundColor = [UIColor whiteColor];
        
        self.window.rootViewController = self.splitController;
    }*/
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)appearance
{
    NSDictionary *navBarTextAttrs =  [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor blueColor], NSForegroundColorAttributeName, nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTextAttrs];
    
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
}

@end