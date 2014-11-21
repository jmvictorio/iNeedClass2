//
//  HomeViewController.h
//  iNeedClass
//
//  Created by Jesus Victorio on 10/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *barraVertical;
@property (weak, nonatomic) IBOutlet UIButton *borde1;
@property (weak, nonatomic) IBOutlet UIButton *borde2;
@property (weak, nonatomic) IBOutlet UIButton *borde3;
@property (weak, nonatomic) IBOutlet UIImageView *arrow;
@property (weak, nonatomic) IBOutlet UILabel *tutorial;
@property (weak, nonatomic) IBOutlet UIButton *buttonExchange;
@property (weak, nonatomic) IBOutlet UIButton *buttonClasses;
@property (weak, nonatomic) IBOutlet UIButton *buttonINC;

- (IBAction)actionAbout:(id)sender;
- (IBAction)actionClass:(id)sender;
- (IBAction)actionExchange:(id)sender;

@end
