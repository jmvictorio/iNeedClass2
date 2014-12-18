//
//  FiltersClassViewController.h
//  iNeedClass
//
//  Created by injevm on 17/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiltersClassViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *noSaveButton;

- (IBAction)saveAction:(id)sender;
- (IBAction)noSaveAction:(id)sender;

@end
