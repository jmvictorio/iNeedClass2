//
//  RegistroViewController.h
//  iNeedClass
//
//  Created by injevm on 21/7/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistroViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UITextField *textNombre;
@property (weak, nonatomic) IBOutlet UITextField *TextApellidos;
@property (weak, nonatomic) IBOutlet UITextField *textFNAC;

@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (weak, nonatomic) IBOutlet UITextField *textPass;
@property (weak, nonatomic) IBOutlet UITextField *textRePass;

@property (weak, nonatomic) IBOutlet UIButton *buttonContinuarNombre;
@property (weak, nonatomic) IBOutlet UIButton *buttonContinuarUsuario;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

- (IBAction)actionNombre:(id)sender;
- (IBAction)actionUsuario:(id)sender;
- (IBAction)pasoAtras:(id)sender;

@end
