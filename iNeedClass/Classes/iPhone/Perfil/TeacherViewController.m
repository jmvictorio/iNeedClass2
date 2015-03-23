    //
//  TeacherViewController.m
//  iNeedClass
//
//  Created by injevm on 22/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "TeacherViewController.h"

#define LATERAL_MARGIN              20
#define MIN_HEIGHT_DEVELOPMENT      44

@interface TeacherViewController ()
{
    UIBarButtonItem *backButton;
}

@property (nonatomic, strong) FBLoginView *loginView;

@end

@implementation TeacherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(0, 0, 320, 5)];
    
    self.loginView.delegate = self;
    
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends", @"user_birthday"];
    
    [self updateNotes];
    
    [self setTitle:@"Jesus Victorio"];
    
    backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"previous-24"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    
    [self.navigationItem setLeftBarButtonItem:backButton animated:YES];
    
    [self.emailButton.titleLabel setFont:[UIFont fontMontseBold:15]];
    [self.emailButton.layer setCornerRadius:15];
    
    [self.llamarButton.titleLabel setFont:[UIFont fontMontseBold:15]];
    [self.llamarButton.layer setCornerRadius:15];
    
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - métodos privados

// Funcion que calcula la altura de un label en funcion de su contenido y del tamanyo de fuente.
-(CGFloat)getLabelHeightWithText:(NSString *)textDevelop
{
    //Al tamaño de la pantalla se le quita dos veces el borde que es 20.
    float sizeWidth= [UIScreen mainScreen].bounds.size.width - LATERAL_MARGIN*2;
    CGSize maximumSize = CGSizeMake(sizeWidth, 10000);
    
    UIFont *font = [UIFont fontMontseRegular:15];
    
    CGRect textRect = [textDevelop boundingRectWithSize:maximumSize
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:font}
                                                context:nil];
    
    CGSize labelHeighSize = textRect.size;
    
    float result;
    
    // Si el alto es menor que el minimo para el label de development, lo pongo al minimo para q las celdas tengan el mismo aspecto siempre.
    
    if (labelHeighSize.height < MIN_HEIGHT_DEVELOPMENT) {
        result = MIN_HEIGHT_DEVELOPMENT;
    } else {
        result = labelHeighSize.height;
    }
    
    return result;
}


- (void)updateNotes
{
    NSString *descripcion = @"prueba larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga larga";
    
    [self.noteLabel setText:descripcion];
    
    [self.noteLabel setTextAlignment:NSTextAlignmentJustified];
    
    float size = [self getLabelHeightWithText:[self.noteLabel text]];
    
    [self.noteLabel setFrame:CGRectMake(self.noteLabel.frame.origin.x, self.noteLabel.frame.origin.y, self.noteLabel.bounds.size.width, size)];
    
    NSInteger height = self.scrollView.bounds.size.height + size - 36;
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.bounds.size.width, height)];
    
    [self.scrollView setScrollEnabled:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FBLoginViewDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    // first get the buttons set for login mode
    [self.profileFB setHidden:NO];
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    // here we use helper properties of FBGraphUser to dot-through to first_name and
    // id properties of the json response from the server; alternatively we could use
    // NSDictionary methods such as objectForKey to get values from the my json object
    self.nameLabel.text = user.first_name;
    self.lastNameLabel.text = user.last_name;
    // setting the profileID property of the FBProfilePictureView instance
    // causes the control to fetch and display the profile picture for the user
    self.profileFB.profileID = user.objectID;
    
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"login"];
    
    self.profileFB.layer.cornerRadius = self.profileFB.frame.size.width / 2;
    self.profileFB.clipsToBounds = YES;
    self.profileFB.layer.borderWidth = 3.0f;
    self.profileFB.layer.borderColor = [UIColor colorINC].CGColor;
    
    
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // test to see if we can use the share dialog built into the Facebook application
    FBLinkShareParams *p = [[FBLinkShareParams alloc] init];
    p.link = [NSURL URLWithString:@"http://developers.facebook.com/ios"];
}

- (IBAction)emailAction:(id)sender {
    
    BOOL message = false;
    BOOL mail = false;
    
    if([MFMessageComposeViewController canSendText])
    {
        message = true;
    }
    if([MFMailComposeViewController canSendMail])
    {
        mail = true;
    }
    
    UIActionSheet *popupQuery;
    
    if(message && mail)
    {
        popupQuery = [[UIActionSheet alloc] initWithTitle:@"Escribir" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Mensaje de Texto", @"Mail", nil];
    }
    else if(message && !mail)
    {
        popupQuery = [[UIActionSheet alloc] initWithTitle:@"Escribir" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Mensaje de Texto", nil];
    }
    else if (!message && mail)
    {
        popupQuery = [[UIActionSheet alloc] initWithTitle:@"Escribir" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Mail", nil];
    }
    
    popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [popupQuery showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
   
     switch (buttonIndex) {
         case 0:
             if([MFMessageComposeViewController canSendText])
             {
                 MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
                 controller.body = @"Cuerpo del Mensaje";
                 controller.recipients = @[@"605993892"];
                 controller.messageComposeDelegate = self;
                 [self presentViewController:controller animated:YES completion:nil];
             }
             break;
         case 1:
             if([MFMailComposeViewController canSendMail]){
                 // Email Subject
                 NSString *emailTitle = @"Titulo del Email";
                 // Email Content
                 NSString *messageBody = @"Cuerpo del Email";
                 // To address
                 NSArray *toRecipents = [NSArray arrayWithObject:@"jesusvicmar@gmail.com"];
                 
                 MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
                 mc.mailComposeDelegate = self;
                 [mc setSubject:emailTitle];
                 [mc setMessageBody:messageBody isHTML:NO];
                 [mc setToRecipients:toRecipents];
                 
                 [mc.navigationBar setTintColor:[UIColor whiteColor]];
                 NSDictionary *navBarTextAttrs =  [NSDictionary dictionaryWithObjectsAndKeys:
                                                   [UIColor colorINC], NSForegroundColorAttributeName,
                                                   [UIFont fontMontseRegular:15.0], NSFontAttributeName,nil];
                 
                 [mc.navigationController.navigationBar setTitleTextAttributes:navBarTextAttrs];
                 [mc.navigationBar setTitleTextAttributes:navBarTextAttrs];
                 [mc.navigationController.view setTintColor:[UIColor colorINC]];
                 [mc.navigationController.view setBackgroundColor:[UIColor colorINC]];
                 [mc.navigationController.navigationBar setBarTintColor:[UIColor colorINC]];
                 
                 // Present mail view controller on screen
                 [self presentViewController:mc animated:YES completion:NULL];
             }else{
                 NSLog(@"NO PUE SEEEEEE");
             }
             break;
         case 2:
             NSLog(@"Boton Cancelar");
             break;
     }
    
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result)
    {
        case MessageComposeResultCancelled:
        {
            [self dismissViewControllerAnimated:YES completion:nil];
            NSLog(@"Mensaje cancelado");
            break;
        }
        case MessageComposeResultFailed:
        {
            [self dismissViewControllerAnimated:YES completion:nil];
            NSLog(@"Mensaje fallido");
            break;
        }
        case MessageComposeResultSent:
        {
            NSLog(@"Mensaje enviado");
        }
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelado");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail guardado");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail enviado");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail envio fallido: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)callAction:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:605993892"]];
}
@end
