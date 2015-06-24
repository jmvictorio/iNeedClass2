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
    NSArray *_pickerData;
}

@end

@implementation AddClassTeachViewController
@synthesize pickerHorario;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    delegate = [AppDelegate sharedInstance];
    
    [delegate doOverlay];
    
    _pickerData = @[ @"Todo el día", @"Mañana", @"Tarde"];
    
    [self.buttonMenu setImage:[UIImage imageNamed:@"previous-24"] forState:UIControlStateNormal];
    
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+20)];
    
    [self.labelTitle setFont:[UIFont fontMontseBold:22]];
    
    [pickerHorario setHidden:YES];
    
    [self.buttonSelectTime.titleLabel setFont:[UIFont fontMontseRegular:13]];
    [self.buttonSelectTime.titleLabel setTextAlignment:NSTextAlignmentCenter];
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
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)selectTime:(id)sender {
    [pickerHorario setHidden:NO];
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
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
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
        //[self.scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y-40) animated:YES];
        //[self.okButton setHidden:YES];
    }else if (textField.tag == 3)
    {
        //[self.tableSearchMaterias setHidden:NO];
        [self.scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y-150) animated:YES];
        //[self.okButton setHidden:YES];
    }
    else if (textField.tag == 4)
    {
        [self.scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y-150) animated:YES];
        //[self.okButton setHidden:NO];
    }
    
    return YES;
}

#pragma mark - TableView Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

#pragma mark - UIPickerView Delegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_pickerData count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self.buttonSelectTime.titleLabel setText:[_pickerData objectAtIndex:row]];
    [pickerView setHidden:YES];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_pickerData objectAtIndex:row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"PRUEBA");
    [self.pickerHorario setHidden:YES];
    
}

@end
