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
@property (weak, nonatomic) IBOutlet UIImageView *borde1;
@property (weak, nonatomic) IBOutlet UIImageView *borde2;
@property (weak, nonatomic) IBOutlet UIImageView *borde3;
@property (weak, nonatomic) IBOutlet UIButton *mustache;
@property (weak, nonatomic) IBOutlet UIImageView *arrow;
@property (weak, nonatomic) IBOutlet UILabel *tutorial;

- (IBAction)actionHelp:(id)sender;
- (IBAction)actionAbout:(id)sender;
- (IBAction)actionClass:(id)sender;
- (IBAction)actionExchange:(id)sender;

@end
