//
//  Tutorial2ViewController.m
//  iNeedClass
//
//  Created by injevm on 18/6/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import "Tutorial2ViewController.h"

@interface Tutorial2ViewController ()

@end

@implementation Tutorial2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor colorINC]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [self buildIntro];
    [super viewDidAppear:animated];
}

#pragma mark - Build MYBlurIntroductionView

-(void)buildIntro{
    //Create Stock Panel with header
    //UIView *headerView = [[NSBundle mainBundle] loadNibNamed:@"TestHeader" owner:nil options:nil][0];
    MYIntroductionPanel *panel1 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"iNeedClass" description:@"Aquí podrás encontrar todo lo que necesitas para impartir, buscar o incluso intercambiar clases particulares! Te lo vamos a explicar ahora :D" image:[UIImage imageNamed:@"drtuto1tuto2.png"]];// header:headerView];
    
    //Create Stock Panel With Image
    MYIntroductionPanel *panel2 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Profesores" description:@"Ahora lo teneis muy facil, solo teneis que inscribiros en iNeedClass o solo con logaros con Facebook podreis entrar para introducir las asignaturas que querais impartir" image:[UIImage imageNamed:@"drtuto2tuto2.png"]];
    
    //Create Stock Panel With Image
    MYIntroductionPanel *panel3 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Alumnos" description:@"Como alumno puedes poner un anuncio para buscar clases de lo que necesites. Algun profe te ayudara! ;)" image:[UIImage imageNamed:@"drtuto3tuto2.png"]];
    

    //Create Stock Panel With Image
    MYIntroductionPanel *panel4 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Intercambios" description:@"Además puedes intercambiar tus conocimientos por otros. Solo tienes que poner tu anuncio o ver los intercambios ya existentes entre materías." image:[UIImage imageNamed:@"drtuto4tuto2.png"]];
    

    //Create Stock Panel With Image
    MYIntroductionPanel *panel5 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Listo para empezar!!" description:@"Ha sido facil no? Pues a currar! Ahora solo tienes que añadir tus asignaturas que quieres impartir o buscar las que necesites!" image:[UIImage imageNamed:@"drtuto5tuto2.png"]];
    

    //Create Panel From Nib
    //MYIntroductionPanel *panel3 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"TestPanel3"];
    
    //Add panels to an array
    NSArray *panels = @[panel1, panel2, panel3, panel4, panel5];
    
    //Create the introduction view and set its delegate
    MYBlurIntroductionView *introductionView = [[MYBlurIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    introductionView.delegate = self;
    //introductionView.BackgroundImageView.image = [UIImage imageNamed:@"Toronto, ON.jpg"];
    introductionView.backgroundColor = [UIColor colorINC];
    [introductionView setBackgroundColor:[UIColor colorINC]];
    //introductionView.LanguageDirection = MYLanguageDirectionRightToLeft;
    
    //Build the introduction with desired panels
    [introductionView buildIntroductionWithPanels:panels];
    
    //Add the introduction to your view
    [self.view addSubview:introductionView];
}

#pragma mark - MYIntroduction Delegate

-(void)introduction:(MYBlurIntroductionView *)introductionView didChangeToPanel:(MYIntroductionPanel *)panel withIndex:(NSInteger)panelIndex{
    //You can edit introduction view properties right from the delegate method!
    //If it is the first panel, change the color to green!
    if (panelIndex == 0) {
        [introductionView setBackgroundColor:[UIColor colorINC]];
    }//a63c30
    //If it is the second panel, change the color to blue!
    else if (panelIndex == 1){
        [introductionView setBackgroundColor:[UIColor colorINC]];//[UIColor colorWithHexString:@"#a63c30"]];
    }
    else if (panelIndex == 2){
        [introductionView setBackgroundColor:[UIColor colorINC]];//[UIColor colorWithRed:50.0f/255.0f green:79.0f/255.0f blue:133.0f/255.0f alpha:0.65]];
    }
    else if (panelIndex == 3){
        [introductionView setBackgroundColor:[UIColor colorINC]];//[UIColor colorWithRed:50.0f/255.0f green:79.0f/255.0f blue:133.0f/255.0f alpha:0.65]];
    }
    else if (panelIndex == 4){
        [introductionView setBackgroundColor:[UIColor colorINC]];//[UIColor colorWithRed:50.0f/255.0f green:79.0f/255.0f blue:133.0f/255.0f alpha:0.65]];
    }
}

-(void)introduction:(MYBlurIntroductionView *)introductionView didFinishWithType:(MYFinishType)finishType {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
