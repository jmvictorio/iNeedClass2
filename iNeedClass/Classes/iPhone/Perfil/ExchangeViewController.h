//
//  ExchangeViewController.h
//  iNeedClass
//
//  Created by injevm on 22/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface ExchangeViewController : UIViewController<FBLoginViewDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollExchange;

//Nombre y Apellidos
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *fbProfile;
@property (weak, nonatomic) IBOutlet UIImageView *imagenProfile;

//Datos
@property (weak, nonatomic) IBOutlet UILabel *ofrezco;
@property (weak, nonatomic) IBOutlet UILabel *busco;
@property (weak, nonatomic) IBOutlet UILabel *titulacion;
@property (weak, nonatomic) IBOutlet UIButton *buttonEscribir;
@property (weak, nonatomic) IBOutlet UIButton *buttonLlamar;
@property (weak, nonatomic) IBOutlet UILabel *descripcionLabel;

- (IBAction)accionLLamar:(id)sender;
- (IBAction)accionEscribir:(id)sender;


@end
