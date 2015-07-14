//
//  AddClassViewController.h
//  iNeedClass
//
//  Created by injevm on 20/3/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddClassViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *addTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UIImageView *imgDR;

@property (weak, nonatomic) IBOutlet UILabel *buttonInfo;

@property (weak, nonatomic) IBOutlet UIButton *buttonBuscar;
@property (weak, nonatomic) IBOutlet UIButton *buttonImpartir;

- (IBAction)actionBuscar:(id)sender;
- (IBAction)actionImpartir:(id)sender;



@end
