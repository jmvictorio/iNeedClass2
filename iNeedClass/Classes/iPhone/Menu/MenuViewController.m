//
//  MenuViewController.m
//  iNeedClass
//
//  Created by Jesus Victorio on 16/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "MenuViewController.h"
#import "UIColor+RGB.h"


static NSString * const MenuCellIdentifier = @"MenuCell";


@interface MenuViewController (){
    NSString *noReads;
}

@property (weak, nonatomic) id<MenuDelegate>delegate;

@end


@implementation MenuViewController

- (id)initMenuWithDelegate:(id<MenuDelegate>)delegate
{
    if ( self = [super init] ) {
        _delegate = delegate;
        [self.view setBackgroundColor:[UIColor colorWithHexString:@"4bc1d2"]];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
