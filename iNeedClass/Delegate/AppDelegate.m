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
#import "PKRevealController.h"
#import "IntroViewController.h"
#import "UIColor+RGB.h"

@interface AppDelegate()<PKRevealing>

@property (nonatomic, strong, readwrite) PKRevealController *revealController;

@property (nonatomic, strong) UINavigationController    *navController;
@property (nonatomic, strong) UINavigationController    *navControllerMenu;

@property (nonatomic, strong) IntroViewController       *introViewController;
@property (nonatomic, strong) MenuViewController        *menuViewController;
@property (nonatomic, strong) UISplitViewController     *splitController;

- (void)appearance;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self appearance];
    
    self.introViewController   = [IntroViewController new];
    self.menuViewController    = [MenuViewController new];
    
    if([Utils is_iPhoneDevice])
    {
        self.navController = [[UINavigationController alloc] initWithRootViewController:self.introViewController];
    
        //HACER OVERLAY DE UN NAVIGATIONBAR
        [self.navController.navigationBar setBackgroundImage:[UIImage new]
                                 forBarMetrics:UIBarMetricsDefault];
        self.navController.navigationBar.shadowImage = [UIImage new];
        self.navController.navigationBar.translucent = YES;
        //-----------------
        [self.navController.navigationBar setHidden:YES];
        
        self.revealController = [PKRevealController revealControllerWithFrontViewController: _navController
                                                                         leftViewController: [self leftViewController]
                                                                        rightViewController: nil];
        
        self.revealController.delegate = self;
        self.revealController.animationDuration = 0.25;
        
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.backgroundColor = [UIColor whiteColor];
        
        self.window.rootViewController = self.revealController;
        
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
                                      [UIColor colorWithHexString:@"4bc1d2"], NSForegroundColorAttributeName, nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTextAttrs];
    
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithHexString:@"4bc1d2"]];
    
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
}

#pragma mark - Helpers

- (UIViewController *)leftViewController
{
    
    MenuViewController *leftViewController = [[MenuViewController alloc] initMenuWithDelegate:self];
    
    return leftViewController;
    
    
}

- (void)didMenuItemSelected:(NSUInteger)indexMenuItem
{
    // Cerrar el panel lateral (util solo para iPhone)
    //
    
    //Class requestedViewController;
    //UIViewController *viewController = nil;
    
    /*switch (indexMenuItem) {
            
        case 0:
            requestedViewController = [InboxViewController class];
            viewController = _inboxViewController;
            if(![Utils is_iPhoneDevice]){
                
                [_detailViewController removeViews];
                
                [_navControllerMenu pushViewController:viewController animated:YES];
                
            }
            break;
            
        case 1:
            if([Utils is_iPhoneDevice])
            {
                //TODO: Jesus: El webview consume mucha memoria, liberar
                 if(!_wallViewController)
                 {
                 _wallViewController = [WallViewController new];
                 }
                requestedViewController = [WallViewController class];
                viewController = _wallViewController;
                //_wallViewController = nil;
            }
            else{
                [_detailViewController openView:1];
            }
            break;
            
        case 2:
            if([Utils is_iPhoneDevice])
            {
                requestedViewController = [SettingsViewController class];
                viewController = _settingsViewController;
            }
            else{
                [_detailViewController openView:2];
            }
            break;
            
        case 3:
            if([Utils is_iPhoneDevice])
            {
                requestedViewController = [AboutViewController class];
                viewController = _aboutViewController;
            }
            else{
                [_detailViewController openView:3];
            }
            break;
    }
    
    if([Utils is_iPhoneDevice])
    {
        
        [_navController setViewControllers:[NSArray arrayWithObject:viewController]];
        [self.revealController resignPresentationModeEntirely:YES animated:YES completion:nil];
        
    }
    */
    
}

#pragma mark - Metodos publicos

// Devuelve el delegado de la instancia singleton de la aplicacion
+ (AppDelegate *)sharedInstance
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

/// Conmuta el estado de visibilidad del panel lateral:
/// Si esta esta oculto lo muestra y si esta visible lo oculta.
- (void)switchLateralPanelState
{
    if ([self.revealController isPresentationModeActive])
    {
        [self.revealController resignPresentationModeEntirely:NO animated:YES completion:nil];
    }
    else
    {
        [self.revealController enterPresentationModeAnimated:YES completion:nil];
    }
}


@end
