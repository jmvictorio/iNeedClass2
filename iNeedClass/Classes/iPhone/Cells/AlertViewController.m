//
//  AlertViewController.m
//  iNeedClass
//
//  Created by injevm on 24/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController () <FBLoginViewDelegate>
{
    UIView *_backgroundView;
    UIButton *_dismissButton;
    UIButton *_addOption1;
    UIButton *_addOption2;
    UILabel *_description;
    
    NSInteger optionPress;
}
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) FBLoginView *loginView;

- (void)setup1;
- (void)setup2;
- (void)setup3;
- (void)setup4;
- (void)setup5;
- (void)setup6;
- (void)setup7;
- (void)dismissButtonPressed:(UIButton *)button;
@end

@implementation AlertViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self setup1];
    }
    return self;
}

- (id)init2
{
    self = [super init];
    if (self) {
        [self setup2];
    }
    return self;
}

- (id)init3
{
    self = [super init];
    if (self) {
        [self setup3];
    }
    return self;
}

- (id)init4
{
    self = [super init];
    if (self) {
        [self setup4];
    }
    return self;
}

- (id)init5
{
    self = [super init];
    if (self) {
        [self setup5];
    }
    return self;
}

- (id)init6
{
    self = [super init];
    if (self) {
        [self setup6];
    }
    return self;
}

- (id)init7
{
    self = [super init];
    if (self) {
        [self setup7];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    _backgroundView.frame = self.bounds;
}
#pragma mark -
+ (AlertViewController *)defaultView:(NSInteger)option
{
    AlertViewController *view;
    
    switch (option) {
        case 0:
            view = [[AlertViewController alloc] init];
            view.frame = CGRectMake( 0, 0, 300, 250);
            break;
        case 1:
            view = [[AlertViewController alloc] init2];
            view.frame = CGRectMake( 0, 0, 300, 150);
            break;
        case 2:
            view = [[AlertViewController alloc] init2];
            view.frame = CGRectMake( 0, 0, 300, 150);
            break;
        case 3:
            view = [[AlertViewController alloc] init3];
            view.frame = CGRectMake( 0, 0, 300, 89);
            break;
        case 4:
            view = [[AlertViewController alloc] init4];
            view.frame = CGRectMake( 0, 0, 300, 89);
            break;
        case 5:
            view = [[AlertViewController alloc] init5];
            view.frame = CGRectMake( 0, 0, 300, 150);
            break;
        case 6:
            view = [[AlertViewController alloc] init6];
            view.frame = CGRectMake( 0, 0, 300, 250);
            break;
        case 7:
            view = [[AlertViewController alloc] init7];
            view.frame = CGRectMake( 0, 0, 300, 250);
            break;
        default:
            break;
    }
    
    return view;
}

#pragma mark -
- (void)setup1
{
    optionPress = 1;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.layer.cornerRadius = 10.0f;
    self.layer.masksToBounds = YES;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(0.0, 1.);
    self.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.layer.shadowRadius = 2.;
    
    _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _backgroundView.alpha = 0.8;
    _backgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backgroundView];
    
    _addOption1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _addOption1.frame = CGRectMake(0, 120 - 44, 300, 44);
    _addOption1.backgroundColor = [UIColor colorINC];
    [_addOption1 addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_addOption1.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [_addOption1 setTitle:@"Añadir Materia" forState:UIControlStateNormal];
    [_addOption1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_addOption1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self addSubview:_addOption1];

    _addOption2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _addOption2.frame = CGRectMake(0, 170 - 44, 300, 44);
    _addOption2.backgroundColor = [UIColor colorINC];
    [_addOption2 addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_addOption2.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [_addOption2 setTitle:@"Añadir Intercambio" forState:UIControlStateNormal];
    [_addOption2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_addOption2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self addSubview:_addOption2];
    
    _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _dismissButton.frame = CGRectMake(0, 250 - 44, 300, 44);
    _dismissButton.backgroundColor = [UIColor colorINC];
    [_dismissButton addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [_dismissButton setTitle:@"Aceptar" forState:UIControlStateNormal];
    [_dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_dismissButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self addSubview:_dismissButton];
}

- (void)setup2
{
    optionPress = 2;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.layer.cornerRadius = 10.0f;
    self.layer.masksToBounds = YES;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(0.0, 1.);
    self.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.layer.shadowRadius = 2.;
    
    _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _backgroundView.alpha = 0.8;
    _backgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backgroundView];
    
    _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _dismissButton.frame = CGRectMake(0, 150 - 44, 300, 44);
    _dismissButton.backgroundColor = [UIColor colorINC];
    [_dismissButton addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton setTitle:@"Añadir" forState:UIControlStateNormal];
    [_dismissButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [_dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_dismissButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self addSubview:_dismissButton];
}

- (void)setup3
{
    optionPress = 3;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.layer.cornerRadius = 10.0f;
    self.layer.masksToBounds = YES;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(0.0, 1.);
    self.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.layer.shadowRadius = 2.;
    
    _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _backgroundView.alpha = 0.8;
    _backgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backgroundView];
    
    self.loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(-5, -1, 320, 5)];
    self.loginView.delegate = self;
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends", @"user_birthday"];
    [self addSubview:self.loginView];
    
    _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _dismissButton.frame = CGRectMake(0, 89 - 45, 300, 45);
    _dismissButton.backgroundColor = [UIColor colorINC];
    [_dismissButton addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton setTitle:@"Cancelar" forState:UIControlStateNormal];
    [_dismissButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [_dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_dismissButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self addSubview:_dismissButton];
}

- (void)setup4
{
    optionPress = 4;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.layer.cornerRadius = 10.0f;
    self.layer.masksToBounds = YES;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(0.0, 1.);
    self.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.layer.shadowRadius = 2.;
    
    _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _backgroundView.alpha = 0.8;
    _backgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backgroundView];
    
    UIButton *loginOut = [UIButton buttonWithType:UIButtonTypeCustom];
    loginOut.frame = CGRectMake(0, 0, 300, 45);
    loginOut.backgroundColor = [UIColor redColor];
    [loginOut addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [loginOut setTitle:@"Cerrar Sesión" forState:UIControlStateNormal];
    [loginOut.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [loginOut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginOut setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self addSubview:loginOut];
    
    _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _dismissButton.frame = CGRectMake(0, 89 - 45, 300, 45);
    _dismissButton.backgroundColor = [UIColor colorINC];
    [_dismissButton addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton setTitle:@"Cancelar" forState:UIControlStateNormal];
    [_dismissButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [_dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_dismissButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self addSubview:_dismissButton];
}

- (void)setup5
{
    optionPress = 5;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.layer.cornerRadius = 10.0f;
    self.layer.masksToBounds = YES;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(0.0, 1.);
    self.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.layer.shadowRadius = 2.;
    
    _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _backgroundView.alpha = 1;
    _backgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backgroundView];
    
    UILabel *passLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 280, 40)];
    [passLabel setText:@"Contraseña"];
    [passLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [passLabel setTextColor:[UIColor darkGrayColor]];
    [self addSubview:passLabel];
    
    UITextField *pass = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 280, 45)];
    //pass.layer.cornerRadius = 5.0f;
    [pass setBorderStyle:UITextBorderStyleLine];
    [pass setSecureTextEntry:YES];
    [pass setBackgroundColor:[UIColor whiteColor]];
    [pass setDelegate:self];
    [self addSubview:pass];
    
    _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _dismissButton.frame = CGRectMake(0, 150 - 44, 300, 44);
    _dismissButton.backgroundColor = [UIColor colorINC];
    [_dismissButton addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton setTitle:@"Aceptar" forState:UIControlStateNormal];
    [_dismissButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [_dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_dismissButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self addSubview:_dismissButton];
}

- (void)setup6
{
    optionPress = 6;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.layer.cornerRadius = 10.0f;
    self.layer.masksToBounds = YES;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(0.0, 1.);
    self.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.layer.shadowRadius = 2.;
    
    _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _backgroundView.alpha = 1;
    _backgroundView.backgroundColor = [UIColor colorWithHexString:@"eaeaea"];
    [self addSubview:_backgroundView];
    
    UIView *fondoView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, 300, 100)];
    [fondoView setBackgroundColor:[UIColor whiteColor]];
    [fondoView.layer setBorderWidth:1];
    [fondoView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    
    UILabel *texto1Label = [[UILabel alloc] initWithFrame:CGRectMake(8, 5, 184, 21)];
    [texto1Label setText:@"Materia"];
    [texto1Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto1Label setTextColor:[UIColor blackColor]];
    
    UILabel *texto2Label = [[UILabel alloc] initWithFrame:CGRectMake(18, 21, 174, 41)];
    [texto2Label setText:@"Introducción a la bachata sensual"];
    [texto2Label setNumberOfLines:0];
    [texto2Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto2Label setTextColor:[UIColor blackColor]];
    
    UILabel *texto3Label = [[UILabel alloc] initWithFrame:CGRectMake(8, 58, 49, 21)];
    [texto3Label setText:@"Precio"];
    [texto3Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto3Label setTextColor:[UIColor blackColor]];
    
    UILabel *texto4Label = [[UILabel alloc] initWithFrame:CGRectMake(18, 74, 174, 21)];
    [texto4Label setText:@"8.5 €/h"];
    [texto4Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto4Label setTextColor:[UIColor blackColor]];
    
    UILabel *texto5Label = [[UILabel alloc] initWithFrame:CGRectMake(104, 59, 88, 19)];
    [texto5Label setText:@"Horario"];
    [texto5Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto5Label setTextColor:[UIColor blackColor]];
    
    UILabel *texto6Label = [[UILabel alloc] initWithFrame:CGRectMake(109, 74, 83, 21)];
    [texto6Label setText:@"Todo el dia"];
    [texto6Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto6Label setTextColor:[UIColor blackColor]];
    
    UIImageView *imagePerfil = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"perfilMustache.png"]];
    [imagePerfil setFrame:CGRectMake(200, 0, 100, 100)];
    [imagePerfil.layer setBorderWidth:1];
    [imagePerfil.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    
    FBProfilePictureView *profileFB = [[FBProfilePictureView alloc] initWithProfileID:@"10203663735067174" pictureCropping:FBProfilePictureCroppingOriginal];
    [profileFB setFrame:CGRectMake(200, 0, 100, 100)];
    
    [fondoView addSubview:texto1Label];
    [fondoView addSubview:texto2Label];
    [fondoView addSubview:texto3Label];
    [fondoView addSubview:texto4Label];
    [fondoView addSubview:texto5Label];
    [fondoView addSubview:texto6Label];
    [fondoView addSubview:imagePerfil];
    [fondoView addSubview:profileFB];
    
    [self addSubview:fondoView];
    
    _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _dismissButton.frame = CGRectMake(0, 230 - 44, 300, 44);
    _dismissButton.backgroundColor = [UIColor colorINC];
    [_dismissButton addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton setTitle:@"Aceptar" forState:UIControlStateNormal];
    [_dismissButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [_dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_dismissButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self addSubview:_dismissButton];
}

- (void)setup7
{
    optionPress = 7;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.layer.cornerRadius = 10.0f;
    self.layer.masksToBounds = YES;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(0.0, 1.);
    self.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.layer.shadowRadius = 2.;
    
    _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _backgroundView.alpha = 1;
    _backgroundView.backgroundColor = [UIColor colorWithHexString:@"eaeaea"];
    [self addSubview:_backgroundView];
    
    UIView *fondoView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, 300, 100)];
    [fondoView setBackgroundColor:[UIColor whiteColor]];
    [fondoView.layer setBorderWidth:1];
    [fondoView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    
    UILabel *texto1Label = [[UILabel alloc] initWithFrame:CGRectMake(8, 5, 184, 21)];
    [texto1Label setText:@"Materia"];
    [texto1Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto1Label setTextColor:[UIColor blackColor]];
    
    UILabel *texto2Label = [[UILabel alloc] initWithFrame:CGRectMake(18, 21, 174, 41)];
    [texto2Label setText:@"Introducción a la bachata sensual"];
    [texto2Label setNumberOfLines:0];
    [texto2Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto2Label setTextColor:[UIColor blackColor]];
    
    UILabel *texto3Label = [[UILabel alloc] initWithFrame:CGRectMake(8, 58, 49, 21)];
    [texto3Label setText:@"Precio"];
    [texto3Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto3Label setTextColor:[UIColor blackColor]];
    
    UILabel *texto4Label = [[UILabel alloc] initWithFrame:CGRectMake(18, 74, 174, 21)];
    [texto4Label setText:@"8.5 €/h"];
    [texto4Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto4Label setTextColor:[UIColor blackColor]];
    
    UILabel *texto5Label = [[UILabel alloc] initWithFrame:CGRectMake(104, 59, 88, 19)];
    [texto5Label setText:@"Horario"];
    [texto5Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto5Label setTextColor:[UIColor blackColor]];
    
    UILabel *texto6Label = [[UILabel alloc] initWithFrame:CGRectMake(109, 74, 83, 21)];
    [texto6Label setText:@"Todo el dia"];
    [texto6Label setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [texto6Label setTextColor:[UIColor blackColor]];
    
    UIImageView *imagePerfil = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"perfilMustache.png"]];
    [imagePerfil setFrame:CGRectMake(200, 0, 100, 100)];
    [imagePerfil.layer setBorderWidth:1];
    [imagePerfil.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    
    FBProfilePictureView *profileFB = [[FBProfilePictureView alloc] initWithProfileID:@"10203663735067174" pictureCropping:FBProfilePictureCroppingOriginal];
    [profileFB setFrame:CGRectMake(200, 0, 100, 100)];
    
    [fondoView addSubview:texto1Label];
    [fondoView addSubview:texto2Label];
    [fondoView addSubview:texto3Label];
    [fondoView addSubview:texto4Label];
    [fondoView addSubview:texto5Label];
    [fondoView addSubview:texto6Label];
    [fondoView addSubview:imagePerfil];
    [fondoView addSubview:profileFB];
    
    [self addSubview:fondoView];
    
    _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _dismissButton.frame = CGRectMake(0, 230 - 44, 300, 44);
    _dismissButton.backgroundColor = [UIColor colorINC];
    [_dismissButton addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton setTitle:@"Aceptar" forState:UIControlStateNormal];
    [_dismissButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14.0f]];
    [_dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_dismissButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self addSubview:_dismissButton];
}


//Actions
- (void)dismissButtonPressed:(UIButton *)button
{
    if(optionPress == 5){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"passNotification" object:@""];
    }
    
    if (self.dismissHandler) {
        self.dismissHandler(self);
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passNotification" object:textField.text];
    
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // test to see if we can use the share dialog built into the Facebook application
    FBLinkShareParams *p = [[FBLinkShareParams alloc] init];
    p.link = [NSURL URLWithString:@"http://developers.facebook.com/ios"];
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"login"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (self.dismissHandler) {
        self.dismissHandler(self);
    }
    
}


@end
