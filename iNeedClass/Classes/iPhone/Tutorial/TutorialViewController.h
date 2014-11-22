//
//  TutorialViewController.h
//  iNeedClass
//
//  Created by Jesus Victorio on 22/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate, FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollTutorial;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UIButton *buttonLogin;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@property (weak, nonatomic) IBOutlet UIView *vistaGris;
@property (weak, nonatomic) IBOutlet UIView *viewButtons;

- (IBAction)loginAction:(id)sender;
- (IBAction)dismiss:(id)sender;

@end
