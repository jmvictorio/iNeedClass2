//
//  AddClassTeachViewController.h
//  iNeedClass
//
//  Created by injevm on 20/3/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddClassTeachViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *buttonShow;
@property (weak, nonatomic) IBOutlet UIButton *buttonSave;

@property (weak, nonatomic) IBOutlet UIButton *buttonSelectTime;

@property (weak, nonatomic) IBOutlet UIButton *buttonNoMatery;

- (IBAction)actionShow:(id)sender;
- (IBAction)actionSave:(id)sender;
- (IBAction)menuAction:(id)sender;
@end
