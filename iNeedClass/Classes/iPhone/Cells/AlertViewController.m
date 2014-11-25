//
//  AlertViewController.m
//  iNeedClass
//
//  Created by injevm on 24/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()
{
    UIView *_backgroundView;
    UIButton *_dismissButton;
    UIButton *_addOption1;
    UIButton *_addOption2;
    UILabel *_description;
}
@property (nonatomic, strong) NSString *title;

- (void)setup1;
- (void)setup2;
- (void)setup3;
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
            view = [[AlertViewController alloc] init3];
            view.frame = CGRectMake( 0, 0, 300, 150);
            break;
        default:
            break;
    }
    
    return view;
}

#pragma mark -
- (void)setup1
{
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

//Actions
- (void)dismissButtonPressed:(UIButton *)button
{
    if (self.dismissHandler) {
        self.dismissHandler(self);
    }
}
@end
