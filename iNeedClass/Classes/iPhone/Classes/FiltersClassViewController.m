//
//  FiltersClassViewController.m
//  iNeedClass
//
//  Created by injevm on 17/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "FiltersClassViewController.h"

@interface FiltersClassViewController ()

@end

@implementation FiltersClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.saveButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Bold" size:14]];
    [self.noSaveButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Bold" size:14]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAction:(id)sender {
    
}

- (IBAction)noSaveAction:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"hideFilters" object:nil];
}
@end
