//
//  Home2ViewController.h
//  iNeedClass
//
//  Created by injevm on 20/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFPaperTabBar.h"

@interface Home2ViewController : UIViewController <UITabBarControllerDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet BFPaperTabBar *tabBar;
@property (weak, nonatomic) IBOutlet UITabBarItem *menuItem;

@end
