//
//  FiltersExchangeViewController.h
//  iNeedClass
//
//  Created by injevm on 18/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiltersExchangeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textCiudades;
@property (weak, nonatomic) IBOutlet UITextField *textMateriasBusco;
@property (weak, nonatomic) IBOutlet UITextField *textMateriasOfrezco;

@property (weak, nonatomic) IBOutlet UITableView *tableViewCiudades;
@property (weak, nonatomic) IBOutlet UITableView *tableViewMateriasBusco;
@property (weak, nonatomic) IBOutlet UITableView *tableViewMateriasOfrezco;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerOrder;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *noSaveButton;

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

- (IBAction)saveAction:(id)sender;
- (IBAction)noSaveAction:(id)sender;

@end
