//
//  FiltersClassViewController.h
//  iNeedClass
//
//  Created by injevm on 17/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTAutocompleteTextField.h"
#import "HTAutocompleteManager.h"

@interface FiltersClassViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *noSaveButton;

@property (weak, nonatomic) IBOutlet UITextField *poblacionTextField;
@property (weak, nonatomic) IBOutlet UITextField *materiaTextField;

@property (weak, nonatomic) IBOutlet UITextField *priceTextLess;
@property (weak, nonatomic) IBOutlet UITextField *priceTextMore;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerOrder;

@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UITableView *tableSearchPoblaciones;
@property (weak, nonatomic) IBOutlet UITableView *tableSearchMaterias;

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

- (IBAction)saveAction:(id)sender;
- (IBAction)noSaveAction:(id)sender;
- (IBAction)cerrarTeclado:(id)sender;

@end
