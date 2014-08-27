//
//  MenuViewController.m
//  iNeedClass
//
//  Created by Jesus Victorio on 16/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "MenuViewController.h"
#import "UIColor+RGB.h"
#import "MenuItemCell.h"


static NSString * const MenuCellIdentifier = @"MenuItemCell";


@interface MenuViewController ()

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
    
    [self.tableView setRowHeight:62.0];
    
    [self.tableView registerNib:[MenuItemCell nib] forCellReuseIdentifier:MenuCellIdentifier];
    
    [self.labelName setTextAlignment:NSTextAlignmentCenter];
    [self.labelName setTextColor:[UIColor whiteColor]];
    self.labelName.backgroundColor = [UIColor colorWithHexString:@"4bc1d2"];
    self.labelName.layer.cornerRadius = 15;
    [self.labelName setFont:[UIFont fontWithName:@"Montserrat-Bold" size:17]];
    [self.labelName setText:@"Dr Mustache"];
    //self.labelName.layer.borderColor = [UIColor redColor].CGColor;
    //originaltagLbl.layer.borderWidth = 1;
    //[scrollView addSubview:originaltagLbl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:MenuCellIdentifier];
    
    NSString *menuItemLabel = nil;
    UIImage *menuItemIcon = nil;
    
    switch (indexPath.row)
    {
        case 0:
            menuItemLabel = @"Home";
            menuItemIcon = [UIImage imageNamed:@"home-50"];
            break;
            
        case 1:
            menuItemLabel = @"Añadir Asignatura";
            menuItemIcon = [UIImage imageNamed:@"school-50"];
            break;
            
        case 2:
            menuItemLabel = @"Añadir Intercambio";
            menuItemIcon = [UIImage imageNamed:@"data_in_both_directions-50"];
            break;
            
        case 3:
            menuItemLabel = @"Configuración";
            menuItemIcon = [UIImage imageNamed:@"settings"];
            break;
        case 4:
            menuItemLabel = @"Login";
            menuItemIcon = [UIImage imageNamed:@"enter-50"];
            break;
    }
    
    [cell.iconImage setImage:menuItemIcon];
    [cell.descriptionLabel setText:menuItemLabel];
    [cell.descriptionLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:18]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_delegate didMenuItemSelected:indexPath.row];
}


@end
