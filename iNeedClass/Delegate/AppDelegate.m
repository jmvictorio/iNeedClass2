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
#import "IntroViewController.h"
#import "LoginViewController.h"
#import "ProfileViewController.h"
#import "UIColor+RGB.h"
#import "SITCoreDataManager.h"
#import "SITUtils.h"
#import "AddClassViewController.h"
#import "AddExchangeViewController.h"
#import <AddressBookUI/AddressBookUI.h>
#import "Constants.h"

NSString *const FBSessionStateChangedNotification = @":FBSessionStateChangedNotification";

@interface AppDelegate()

@property (nonatomic, strong, readwrite) PKRevealController *revealController;

@property (nonatomic, strong) UINavigationController    *navController;
@property (nonatomic, strong) UINavigationController    *navControllerMenu;

@property (nonatomic, strong) IntroViewController       *introViewController;
@property (nonatomic, strong) MenuViewController        *menuViewController;
@property (nonatomic, strong) HomeViewController        *homeViewController;
@property (nonatomic, strong) AddClassViewController    *addClassViewController;
@property (nonatomic, strong) AddExchangeViewController *addExchangeViewController;
@property (nonatomic, strong) UISplitViewController     *splitController;

- (void)appearance;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [SITCoreDataManager sharedInstance];
    self.coreDataDAO = [[CoreDataDAO alloc] init];
    
    NSArray *events = [NSArray arrayWithObjects:CloseRegistro, nil];
    
    [SITNotificator addObserver:self forEvents:events];
    
    [self appearance];
    
    self.introViewController        = [IntroViewController new];
    self.menuViewController         = [MenuViewController new];
    self.homeViewController         = [HomeViewController new];
    self.addClassViewController     = [AddClassViewController new];
    self.addExchangeViewController  = [AddExchangeViewController new];
    
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
        
        //self.revealController.delegate = self;
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
    
    [FBLoginView class];
    
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
   /* NSDictionary *navBarTextAttrs =  [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor], NSForegroundColorAttributeName,
                                      [UIFont fontWithName:@"Montserrat-Regular" size:15.0], NSFontAttributeName,nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTextAttrs];
    */
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    [[UILabel appearance] setFont:[UIFont fontMontseRegular:14.0]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontMontseRegular:10.0f], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    UIFont *font = [UIFont boldSystemFontOfSize:12.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:NSFontAttributeName];
    
    [[UISegmentedControl appearance] setTitleTextAttributes:attributes
                                    forState:UIControlStateNormal];
    
    [[UITextField appearance] setFont:[UIFont fontMontseRegular:14.0]];
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
    
    UIViewController *viewController = nil;
    
    BOOL login = [[NSUserDefaults standardUserDefaults] boolForKey:@"login"];
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorINC]];
    switch (indexMenuItem) {
            
        case 0:
            viewController = self.homeViewController;
            break;
            
        case 1:
            viewController = self.addClassViewController;
            break;
        case 2:
            viewController = self.addExchangeViewController;
            break;
        case 3:
            if(login){
                viewController = [ProfileViewController new];
            }else{
                viewController = [LoginViewController new];
            }
            break;
    }
    
    if([Utils is_iPhoneDevice])
    {
        if(![self.navController.visibleViewController isKindOfClass:[viewController class]]){
            [_navController setViewControllers:[NSArray arrayWithObject:viewController]];
        }
        [self.revealController resignPresentationModeEntirely:YES animated:YES completion:nil];
    }
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

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *) sourceApplication annotation:(id)annotation {
    
    // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    // You can add your app-specific url handling code here if needed
    
    return wasHandled;
}

- (UINavigationController *)getNavigationController
{
    return _navController;
}

- (void)doOverlay
{
    //HACER OVERLAY DE UN NAVIGATIONBAR
    [self.navController.navigationBar setBackgroundImage:[UIImage new]
                                           forBarMetrics:UIBarMetricsDefault];
    self.navController.navigationBar.shadowImage = [UIImage new];
    self.navController.navigationBar.translucent = YES;
    //-----------------
    [self.navController.navigationBar setHidden:YES];

    NSDictionary *navBarTextAttrs =  [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor colorINC], NSForegroundColorAttributeName,
                                      [UIFont fontMontseRegular:15.0], NSFontAttributeName,nil];
    
    [self.navController.navigationBar setTitleTextAttributes:navBarTextAttrs];

}

- (void)dontOverlay
{
    //HACER OVERLAY DE UN NAVIGATIONBAR
    self.navController.navigationBar.translucent = NO;
    [self.navController.navigationBar setBarTintColor:[UIColor colorINC]];
    //self.navController.navigationBar.shadowImage = [UIImage new];
    [self.navController.navigationBar setTintColor:[UIColor whiteColor]];
    //-----------------
    [self.navController.navigationBar setHidden:NO];
    
    NSDictionary *navBarTextAttrs =  [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor], NSForegroundColorAttributeName,
                                      [UIFont fontMontseRegular:15.0], NSFontAttributeName,nil];
    
    [self.navController.navigationBar setTitleTextAttributes:navBarTextAttrs];
    
}

- (void)shareOnWhatsApp {
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions (NULL, nil);
    ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(NULL, nil), ^(bool granted, CFErrorRef error) {
        if (!granted){
            //4
            NSLog(@"Just denied");
            return;
        }
        //5
        NSLog(@"Just authorized");
    });
    ABRecordID ABID = 0;
    
    NSArray *allPeople = (__bridge NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
    NSLog(@"num people to send: %ld", nPeople);
    //NSLog(@"num people in array: %ld", CFArrayGetCount(allPeople));
    for(int i = 0; i < (nPeople); i++) {
        //ABRecordID num = i;
        ABRecordRef person = (__bridge ABRecordRef)([allPeople objectAtIndex:i]);
        //ABRecordRef person = ABAddressBookGetPersonWithRecordID(addressBook, num);
        NSString *first;
        if (!person) {
            continue;
        }
        CFStringRef firstc = (CFStringRef)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        if (firstc) {
                first = [NSString stringWithFormat:@"%@",firstc];
        
        }
        ABID = ABRecordGetRecordID(person);
        NSLog(@"PERSON: %d - %@", ABID, first);
        
    }
    NSString *QR_whatsapp_string = [NSString stringWithFormat:@"whatsapp://send?abid=1265&text=%@;", @""];
    NSURL *whatsappURL = [NSURL URLWithString:QR_whatsapp_string];
    if ([[UIApplication sharedApplication] canOpenURL: whatsappURL]) {
        [[UIApplication sharedApplication] openURL: whatsappURL];
    }
}

- (void)didReceiveNotificationEvent:(NSNotification *)notification
{
      NSString *eventName = [notification name];
     //NSDictionary *eventInfo = notification.userInfo;
     
     if ([eventName isEqualToString:CloseRegistro])
     {
         [self.navController popViewControllerAnimated:NO];
         [self.navController popViewControllerAnimated:NO];
         [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"login"];
         [[NSUserDefaults standardUserDefaults] synchronize];
         [self didMenuItemSelected:3];
     }
}


@end
