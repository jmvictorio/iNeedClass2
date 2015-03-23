//
//  AddClassTeachViewController.m
//  iNeedClass
//
//  Created by injevm on 20/3/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import "AddClassTeachViewController.h"
#import "AppDelegate.h"
#import "AlertViewController.h"
#import "CXCardView.h"

@interface AddClassTeachViewController ()
{
    AppDelegate *delegate;
}

@end

@implementation AddClassTeachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    delegate = [AppDelegate sharedInstance];
    
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+20)];
    
    [self.labelTitle setFont:[UIFont fontMontseBold:22]];
    
    [self.buttonSelectTime.titleLabel setFont:[UIFont fontMontseRegular:13]];
    [self.buttonNoMatery.titleLabel setFont:[UIFont fontMontseRegular:13]];
    
    [self.buttonShow.titleLabel setFont:[UIFont fontMontseBold:15]];
    [self.buttonShow.layer setCornerRadius:15];
    [self.buttonShow.layer setShadowOffset:CGSizeMake(1, 1)];
    [self.buttonShow.layer setShadowRadius:2];
    [self.buttonShow.layer setShadowOpacity:0.5];
    
    [self.buttonSave.titleLabel setFont:[UIFont fontMontseBold:15]];
    [self.buttonSave.layer setCornerRadius:15];
    [self.buttonSave.layer setShadowOffset:CGSizeMake(1, 1)];
    [self.buttonSave.layer setShadowRadius:2];
    [self.buttonSave.layer setShadowOpacity:0.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuAction:(id)sender
{
    [delegate switchLateralPanelState];
}

- (IBAction)actionShow:(id)sender {
    AlertViewController *alert = [AlertViewController defaultView:6];
    [alert setDismissHandler:^(AlertViewController *view) {
        // to dismiss current cardView. Also you could call the `dismiss` method.
        [CXCardView dismissCurrent];
    }];
    [CXCardView showWithView:alert draggable:YES];
}

- (IBAction)actionSave:(id)sender {

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if(textField.tag == 1)
    {
        //[self.tableSearchPoblaciones setHidden:NO];
        //[self.okButton setHidden:YES];
    }
    else if (textField.tag == 2)
    {
        //[self.tableSearchMaterias setHidden:NO];
        [self.scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y-40) animated:YES];
        //[self.okButton setHidden:YES];
    }
    else if (textField.tag == 3 || textField.tag == 4)
    {
        [self.scrollView setContentOffset:CGPointMake(0, 20) animated:YES];
        //[self.okButton setHidden:NO];
    }
    return YES;
}
@end
