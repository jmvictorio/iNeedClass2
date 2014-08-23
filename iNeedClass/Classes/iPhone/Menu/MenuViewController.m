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
    
    [self.tableView setRowHeight:60.0];
    
    [self.tableView registerNib:[MenuItemCell nib] forCellReuseIdentifier:MenuCellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
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
            menuItemIcon = [UIImage imageNamed:@"ic_inbox"];
            break;
            
        case 1:
            menuItemLabel = @"Añadir Asignatura";
            menuItemIcon = [UIImage imageNamed:@"ic_about"];
            break;
            
        case 2:
            menuItemLabel = @"Añadir Intercambio";
            menuItemIcon = [UIImage imageNamed:@"ic_about"];
            break;
            
        case 3:
            menuItemLabel = @"Configuración";
            menuItemIcon = [UIImage imageNamed:@"setting.png"];
            break;
    }
    
    [cell.iconImage setImage:menuItemIcon];
    [cell.descriptionLabel setText:menuItemLabel];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_delegate didMenuItemSelected:indexPath.row];
}


@end
