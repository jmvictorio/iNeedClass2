//
//  TutorialViewController.m
//  iNeedClass
//
//  Created by Jesus Victorio on 22/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "TutorialViewController.h"
#import "ProfileViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface TutorialViewController ()
{
    UIBarButtonItem *menuButton;
    AppDelegate *delegate;
    
    UIPanGestureRecognizer *panGesture;
    
    UIView *tuto1;
    UIView *tuto2;
    UIView *tuto3;
    UIView *tuto4;
    
    UIImageView *bocadilloLogado;
    UILabel *bocadilloLogin;
    
    NSInteger actual;
    NSInteger pageActual;
    
    BOOL loginOK;
}

@property (nonatomic, strong) FBLoginView *loginView;

@end

@implementation TutorialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    delegate = [AppDelegate sharedInstance];
    
    loginOK = false;
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
     menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"]
                                                  style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(menuAction)];
    
    [self.navigationItem setLeftBarButtonItem:menuButton];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self.scrollTutorial setFrame:CGRectMake(0, 20, 1280, 488)];
    [self.scrollTutorial setContentSize:CGSizeMake(1280, 488)];
    
    [self.pageControl setNumberOfPages:4];
    [self.pageControl setCurrentPage:0];
    [self.pageControl addTarget:self action:@selector(moveTo:) forControlEvents:UIControlEventValueChanged];
    
    [self.navigationController.navigationBar setHidden:YES];
    
    [self loadFonts];
    
    [self loadGesture];
    
    [self loadTutorial4];
    [self loadTutorial1];
    [self loadTutorial2];
    [self loadTutorial3];
    
    actual = 0;
    pageActual = 0;
}

- (void)menuAction
{
    //[delegate switchLateralPanelState];
}

- (void)loadGesture
{
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [self.scrollTutorial addGestureRecognizer:panRecognizer];
}

- (void)loadFonts
{
    [self.buttonLogin.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:20]];
    [self.dismissButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:20]];
    
    [self.buttonLogin setHidden:YES];
    [self.vistaGris setHidden:YES];
}

- (void)loadTutorial1
{
    UILabel *titleWelcome = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 46)];
    UILabel *bocadillo = [[UILabel alloc]initWithFrame:CGRectMake(81,75,196,98)];
    UILabel *descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(20,360,280,107)];
    
    [titleWelcome setFont:[UIFont fontWithName:@"Montserrat-Bold" size:25]];
    [bocadillo setFont:[UIFont fontWithName:@"Montserrat-Regular" size:13.5f]];
    [descriptionLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:18]];
    
    [titleWelcome setText:@"BIENVENIDOS"];
    [bocadillo setText:@"Hola, soy el Dr. Mustache. Estoy aqui para ayudarte en todo lo que pueda. jijiji"];
    [descriptionLabel setText:@"iNeedClass proporciona un espacio gratuito donde podrás publicar tus clases particulares e intercambios de materias."];
    
    [titleWelcome setTextColor:[UIColor whiteColor]];
    [bocadillo setTextColor:[UIColor blackColor]];
    [descriptionLabel setTextColor:[UIColor whiteColor]];
    
    [bocadillo setNumberOfLines:3];
    [descriptionLabel setNumberOfLines:4];
    
    [bocadillo setTextAlignment:NSTextAlignmentCenter];
    [descriptionLabel setTextAlignment:NSTextAlignmentCenter];
    [titleWelcome setTextAlignment:NSTextAlignmentCenter];
    
    UIImageView *mustache = [[UIImageView alloc]initWithFrame:CGRectMake(0, 45, 320, 320)];
    [mustache setImage:[UIImage imageNamed:@"drtuto1"]];
    [mustache setContentMode:UIViewContentModeScaleAspectFit];
    
    tuto1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 488)];
    
    [tuto1 addSubview:titleWelcome];
    [tuto1 addSubview:mustache];
    [tuto1 addSubview:bocadillo];
    [tuto1 addSubview:descriptionLabel];
    
    [self.scrollTutorial addSubview:tuto1];
    
    
    
}

- (void)loadTutorial2
{
    UILabel *titleTeacher = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 46)];
    UILabel *bocadillo = [[UILabel alloc]initWithFrame:CGRectMake(58,85,196,98)];
    UILabel *moc1 = [[UILabel alloc]initWithFrame:CGRectMake(20,320,280,107)];
    UILabel *moc2 = [[UILabel alloc]initWithFrame:CGRectMake(90,350,280,107)];
    UILabel *moc3 = [[UILabel alloc]initWithFrame:CGRectMake(50,380,280,107)];
    
    [titleTeacher setFont:[UIFont fontWithName:@"Montserrat-Bold" size:23]];
    [bocadillo setFont:[UIFont fontWithName:@"Montserrat-Regular" size:15]];
    [moc1 setFont:[UIFont fontWithName:@"Montserrat-Regular" size:18]];
    [moc2 setFont:[UIFont fontWithName:@"Montserrat-Regular" size:18]];
    [moc3 setFont:[UIFont fontWithName:@"Montserrat-Regular" size:18]];
    
    [titleTeacher setText:@"CLASES PARTICULARES"];
    [bocadillo setText:@"En esta sección encontrarás los precios por hora de cada profesor."];
    [moc1 setText:@"Todos los niveles..."];
    [moc2 setText:@"Todas las materias..."];
    [moc3 setText:@"Todos los tipos..."];
    
    [titleTeacher setTextColor:[UIColor whiteColor]];
    [bocadillo setTextColor:[UIColor blackColor]];
    [moc1 setTextColor:[UIColor whiteColor]];
    [moc2 setTextColor:[UIColor whiteColor]];
    [moc3 setTextColor:[UIColor whiteColor]];
    
    [bocadillo setNumberOfLines:4];
    
    [titleTeacher setTextAlignment:NSTextAlignmentCenter];
    [bocadillo setTextAlignment:NSTextAlignmentCenter];
    
    UIImageView *mustache = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, 320, 320)];
    [mustache setImage:[UIImage imageNamed:@"drtuto2"]];
    [mustache setContentMode:UIViewContentModeScaleAspectFit];
    
    tuto2 = [[UIView alloc]initWithFrame:CGRectMake(320, 0, 320, 488)];
    
    [tuto2 addSubview:titleTeacher];
    [tuto2 addSubview:mustache];
    [tuto2 addSubview:bocadillo];
    [tuto2 addSubview:moc1];
    [tuto2 addSubview:moc2];
    [tuto2 addSubview:moc3];
    
    [self.scrollTutorial addSubview:tuto2];
}

- (void)loadTutorial3
{
    UILabel *titleExchange = [[UILabel alloc]initWithFrame:CGRectMake(75, 0, 300, 46)];
    UILabel *bocadillo = [[UILabel alloc]initWithFrame:CGRectMake(40,120,150,100)];
    UILabel *learnSocialLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,320,320,107)];
    UILabel *moc1 = [[UILabel alloc]initWithFrame:CGRectMake(30,360,280,107)];
    UILabel *moc2 = [[UILabel alloc]initWithFrame:CGRectMake(200,375,280,107)];
    UILabel *moc3 = [[UILabel alloc]initWithFrame:CGRectMake(70,400,280,107)];
    
    [titleExchange setFont:[UIFont fontWithName:@"Montserrat-Bold" size:23]];
    [bocadillo setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14]];
    [learnSocialLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:22]];
    [moc1 setFont:[UIFont fontWithName:@"Montserrat-Regular" size:16]];
    [moc2 setFont:[UIFont fontWithName:@"Montserrat-Regular" size:16]];
    [moc3 setFont:[UIFont fontWithName:@"Montserrat-Regular" size:16]];
    
    [titleExchange setText:@"INTERCAMBIOS"];
    [bocadillo setText:@"Comparte tus conocimientos con otras personas. Así puedes conocer a otros jijii"];
    [learnSocialLabel setText:@"Aprende socializandote!"];
    [moc1 setText:@"Matemáticas!"];
    [moc2 setText:@"Bailes!"];
    [moc3 setText:@"Programación!"];
    
    [titleExchange setTextColor:[UIColor whiteColor]];
    [bocadillo setTextColor:[UIColor blackColor]];
    [learnSocialLabel setTextColor:[UIColor whiteColor]];
    [moc1 setTextColor:[UIColor whiteColor]];
    [moc2 setTextColor:[UIColor whiteColor]];
    [moc3 setTextColor:[UIColor whiteColor]];
    
    [bocadillo setNumberOfLines:5];
    
    [bocadillo setTextAlignment:NSTextAlignmentCenter];
    [learnSocialLabel setTextAlignment:NSTextAlignmentCenter];
    
    UIImageView *mustache = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, 320, 320)];
    [mustache setImage:[UIImage imageNamed:@"drtuto3"]];
    [mustache setContentMode:UIViewContentModeScaleAspectFit];
    
    tuto3 = [[UIView alloc]initWithFrame:CGRectMake(640, 0, 320, 488)];
    
    [tuto3 addSubview:titleExchange];
    [tuto3 addSubview:mustache];
    [tuto3 addSubview:bocadillo];
    [tuto3 addSubview:learnSocialLabel];
    [tuto3 addSubview:moc1];
    [tuto3 addSubview:moc2];
    [tuto3 addSubview:moc3];
    
    [self.scrollTutorial addSubview:tuto3];

}

- (void)loadTutorial4
{
    UILabel *titleExchange = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 46)];
    
    [titleExchange setFont:[UIFont fontWithName:@"Montserrat-Bold" size:23]];
    
    [titleExchange setText:@"TE ANIMAS A PROBAR??"];
    
    [titleExchange setTextColor:[UIColor whiteColor]];
    
    [titleExchange setTextAlignment:NSTextAlignmentCenter];
    
    UIImageView *mustache = [[UIImageView alloc]initWithFrame:CGRectMake(35, 120, 250, 250)];
    [mustache setImage:[UIImage imageNamed:@"drtuto4"]];
    [mustache setContentMode:UIViewContentModeScaleAspectFit];
    
    self.loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(0, 350, 320, 5)];
    
    self.loginView.delegate = self;
    
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
    tuto4 = [[UIView alloc]initWithFrame:CGRectMake(960, 0, 320, 488)];
    
    [tuto4 addSubview:titleExchange];
    [tuto4 addSubview:mustache];
    [tuto4 addSubview:self.loginView];

    
    [self.scrollTutorial addSubview:tuto4];
}

#pragma mark - FBLoginViewDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    // first get the buttons set for login mode
    NSLog(@"LOGADO");
    [self.buttonLogin.titleLabel setText:@"Ve al Perfil"];
    if(pageActual == 3)
    {
        [self.buttonLogin setHidden:NO];
        [self.vistaGris setHidden:NO];
        [self.dismissButton setHidden:YES];
    }
    loginOK = true;
    /* self.buttonPostPhoto.enabled = YES;
    self.buttonPostStatus.enabled = YES;
    self.buttonPickFriends.enabled = YES;
    self.buttonPickPlace.enabled = YES;
    
    // "Post Status" available when logged on and potentially when logged off.  Differentiate in the label.
    [self.buttonPostStatus setTitle:@"Post Status Update (Logged On)" forState:self.buttonPostStatus.state];*/
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    // here we use helper properties of FBGraphUser to dot-through to first_name and
    // id properties of the json response from the server; alternatively we could use
    // NSDictionary methods such as objectForKey to get values from the my json object
    
    bocadilloLogado = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bocadillo-white"]];
    [bocadilloLogado setFrame:CGRectMake(30, 50, 250, 120)];
    [bocadilloLogado setAlpha:0.0];
    [self.buttonLogin.titleLabel setText:@"Ve al Perfil"];
    bocadilloLogin = [[UILabel alloc]initWithFrame:CGRectMake(75,50,150,100)];
    [bocadilloLogin setFont:[UIFont fontWithName:@"Montserrat-Regular" size:14]];
    [bocadilloLogin setText:[NSString stringWithFormat:@"Buenas %@ \nYa estas dentro! :D", user.first_name]];
    [bocadilloLogin setNumberOfLines:2];
    [bocadilloLogin setTextAlignment:NSTextAlignmentCenter];
    
    [bocadilloLogin setTextColor:[UIColor blackColor]];
    [bocadilloLogin setAlpha:0.0];
    
    [tuto4 addSubview:bocadilloLogado];
    [tuto4 addSubview:bocadilloLogin];
    
    [UIView beginAnimations:@"Login" context:NULL];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelegate: self];
    
    [bocadilloLogado setAlpha:1];
    [bocadilloLogin setAlpha:1];
    if(pageActual == 3)
    {
        [self.buttonLogin setHidden:NO];
        [self.vistaGris setHidden:NO];
        [self.dismissButton setHidden:YES];
    }else{
        [self.buttonLogin setHidden:YES];
        [self.vistaGris setHidden:YES];
        [self.dismissButton setHidden:NO];
    }
    
    
    
    [UIView commitAnimations];
    
    loginOK = true;
    //self.labelFirstName.text = [NSString stringWithFormat:@"Hello %@!", user.first_name];
    // setting the profileID property of the FBProfilePictureView instance
    // causes the control to fetch and display the profile picture for the user
    //self.profilePic.profileID = user.objectID;
    //self.loggedInUser = user;
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // test to see if we can use the share dialog built into the Facebook application
    FBLinkShareParams *p = [[FBLinkShareParams alloc] init];
    p.link = [NSURL URLWithString:@"http://developers.facebook.com/ios"];
    //BOOL canShareFB = [FBDialogs canPresentShareDialogWithParams:p];
    //BOOL canShareiOS6 = [FBDialogs canPresentOSIntegratedShareDialogWithSession:nil];
    //BOOL canShareFBPhoto = [FBDialogs canPresentShareDialogWithPhotos];
    [self.buttonLogin.titleLabel setText:@"Ingresar"];
    [UIView beginAnimations:@"LoggedOut" context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate: self];
    
    [bocadilloLogado setAlpha:0];
    [bocadilloLogin setAlpha:0];
    [bocadilloLogado removeFromSuperview];
    [bocadilloLogin removeFromSuperview];
    /*if(pageActual == 3)
    {
        [self.buttonLogin setHidden:NO];
        [self.vistaGris setHidden:NO];
        [self.dismissButton setHidden:YES];

    }
    */
    [UIView commitAnimations];
    loginOK = false;
    
    /*self.buttonPostStatus.enabled = canShareFB || canShareiOS6;
    self.buttonPostPhoto.enabled = canShareFBPhoto;
    self.buttonPickFriends.enabled = NO;
    self.buttonPickPlace.enabled = NO;
    
    // "Post Status" available when logged on and potentially when logged off.  Differentiate in the label.
    [self.buttonPostStatus setTitle:@"Post Status Update (Logged Off)" forState:self.buttonPostStatus.state];
    
    self.profilePic.profileID = nil;
    self.labelFirstName.text = nil;
    self.loggedInUser = nil;*/
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    // see https://developers.facebook.com/docs/reference/api/errors/ for general guidance on error handling for Facebook API
    // our policy here is to let the login view handle errors, but to log the results
    NSLog(@"FBLoginView encountered an error=%@", error);
}


-(void)move:(id)sender {
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
    CGFloat firstX = 0.0;
    
    
    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan)
    {
        firstX = translatedPoint.x;
    }
    
    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded)
    {
        
        CGFloat finalX = translatedPoint.x;
        if(firstX+50 < finalX)
        {
            [self moveTo:FALSE];
        }else if(firstX-50>finalX){
            [self moveTo:TRUE];
        }
    }
}

- (void)moveTo:(BOOL)rigth
{
    if(rigth)
    {
        if(actual == 960)
        {
        }
        else
        {
            actual+=320;
            pageActual++;
            [self.pageControl setCurrentPage:pageActual];
            [self.scrollTutorial setContentOffset:CGPointMake(actual, 0) animated:YES];
        }
    }
    else
    {
        if(actual == 0)
        {
        }
        else
        {
            actual-=320;
            pageActual--;
            [self.pageControl setCurrentPage:pageActual];
            [self.scrollTutorial setContentOffset:CGPointMake(actual, 0) animated:YES];
        }
    }
    if(pageActual == 3)
    {
        [self.buttonLogin setHidden:NO];
        [self.vistaGris setHidden:NO];
        [self.dismissButton setHidden:YES];
    }
    else
    {
        [self.buttonLogin setHidden:YES];
        [self.vistaGris setHidden:YES];
        [self.dismissButton setHidden:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
    if(loginOK){
        ProfileViewController *profile = [[ProfileViewController alloc]init];
        [self.navigationController pushViewController:profile animated:YES];
    }else{
        LoginViewController *login = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    }
}

- (IBAction)dismiss:(id)sender {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)signAction:(id)sender {
}
@end
