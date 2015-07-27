//
//  AddExchangeViewController.h
//  iNeedClass
//
//  Created by injevm on 14/7/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddExchangeViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *buttonShow;
@property (weak, nonatomic) IBOutlet UIButton *buttonSave;

@property (weak, nonatomic) IBOutlet UIButton *buttonNoMatery;
@property (weak, nonatomic) IBOutlet UIButton *buttonMenu;

@property (weak, nonatomic) IBOutlet UIButton *buttonSelectTime;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerHorario;

@property (weak, nonatomic) IBOutlet UITextField *textMateriasBusco;
@property (weak, nonatomic) IBOutlet UITextField *textMateriasOfrezco;
@property (weak, nonatomic) IBOutlet UITextField *textCiudad;
@property (weak, nonatomic) IBOutlet UITextView *textDescription;

//TABLAS
@property (weak, nonatomic) IBOutlet UITableView *tableViewMateriasBusco;
@property (weak, nonatomic) IBOutlet UITableView *tableViewMateriasOfrezco;
@property (weak, nonatomic) IBOutlet UITableView *tableViewCiudades;

- (IBAction)selectTime:(id)sender;
- (IBAction)actionShow:(id)sender;
- (IBAction)actionSave:(id)sender;
- (IBAction)menuAction:(id)sender;

@end
