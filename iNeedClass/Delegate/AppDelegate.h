//
//  AppDelegate.h
//  iNeedClass
//
//  Created by Jesus Victorio on 10/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
#import "CoreDataDAO.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, MenuDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CoreDataDAO *coreDataDAO;

// Devuelve el delegado de la instancia singleton de la aplicacion
+ (AppDelegate *)sharedInstance;

/// Conmuta el estado de visibilidad del panel lateral:
/// Si esta esta oculto lo muestra y si esta visible lo oculta.
- (void)switchLateralPanelState;

- (UINavigationController *)getNavigationController;

@end
