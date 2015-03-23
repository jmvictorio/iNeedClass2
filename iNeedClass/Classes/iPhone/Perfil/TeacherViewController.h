//
//  TeacherViewController.h
//  iNeedClass
//
//  Created by injevm on 22/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface TeacherViewController : UIViewController<FBLoginViewDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, UIActionSheetDelegate>

//Imagen Profile
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profileFB;
@property (weak, nonatomic) IBOutlet UIImageView *profileIMG;

//Nombre y apellidos
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;

//Datos
@property (weak, nonatomic) IBOutlet UILabel *materiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UILabel *precioLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titulacionLabel;
@property (weak, nonatomic) IBOutlet UILabel *degreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactoLabel;
@property (weak, nonatomic) IBOutlet UIButton *emailButton;
@property (weak, nonatomic) IBOutlet UIButton *llamarButton;
@property (weak, nonatomic) IBOutlet UILabel *NotasLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)emailAction:(id)sender;
- (IBAction)callAction:(id)sender;


@end
