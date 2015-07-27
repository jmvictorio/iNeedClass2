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
    
    NSMutableArray *_dataMaterias;
    NSMutableArray *_dataMateriasTable;
    
    NSMutableArray *_dataPoblaciones;
    NSMutableArray *_dataPoblacionesTable;
}

@end

@implementation AddClassTeachViewController
@synthesize pickerHorario;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    delegate = [AppDelegate sharedInstance];
    
    [delegate doOverlay];
    
    [self.buttonOKPrice setHidden:YES];
    
    _pickerData = @[ @"Todo el día", @"Mañana", @"Tarde"];
    
    [self.buttonMenu setImage:[UIImage imageNamed:@"previous-24"] forState:UIControlStateNormal];
    
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+100)];
    
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
    
    _dataPoblaciones = [[NSMutableArray alloc]init];
    _dataMaterias = [[NSMutableArray alloc]init];
    
    [self setUp];
    
    _dataPoblacionesTable = [[NSMutableArray alloc] initWithArray:_dataPoblaciones];
    _dataMateriasTable = [[NSMutableArray alloc] initWithArray:_dataMaterias];
}

- (void)setUp
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Sevilla" forKey:@"provincia"];
    [dic setValue:@"Écija" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Sevilla" forKey:@"provincia"];
    [dic setValue:@"Sevilla" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Sevilla" forKey:@"provincia"];
    [dic setValue:@"Dos Hermanas" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Sevilla" forKey:@"provincia"];
    [dic setValue:@"Mairena del Alcor" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Sevilla" forKey:@"provincia"];
    [dic setValue:@"Mairena del Aznaljarafe" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Cádiz" forKey:@"provincia"];
    [dic setValue:@"San Fernando" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Cádiz" forKey:@"provincia"];
    [dic setValue:@"Cádiz" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Cádiz" forKey:@"provincia"];
    [dic setValue:@"Puerto de Santa Maria" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Huelva" forKey:@"provincia"];
    [dic setValue:@"Huelva" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Granada" forKey:@"provincia"];
    [dic setValue:@"Granada" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Granada" forKey:@"provincia"];
    [dic setValue:@"Sierra Nevada" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Granada" forKey:@"provincia"];
    [dic setValue:@"Motril" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Malaga" forKey:@"provincia"];
    [dic setValue:@"Torremolinos" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"Malaga" forKey:@"provincia"];
    [dic setValue:@"Fuengirola" forKey:@"poblacion"];
    [_dataPoblaciones addObject:dic];
    
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Inglés" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Francés" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Introducción Matemáticas Discretas" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Programación iOS" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Programación Java" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Excel Avanzado" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Excel Profesional" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Diseño Gráfico" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Bachata Inicio" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Bachata Avanzado" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Salsa Avanzado" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Bachata Profesional" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Kizomba Inicio" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"Kizomba Intermedio" forKey:@"materia"];
    [_dataMaterias addObject:dic2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)downKeyBoard:(id)sender {
    [self.textPrice resignFirstResponder];
    [self.buttonOKPrice setHidden:YES];

}

- (IBAction)selectTime:(id)sender {
    [pickerHorario setHidden:NO];
    [self.textPrice resignFirstResponder];
}

- (IBAction)actionShow:(id)sender {
    
    NSInteger countTextCiudad   = [self.textCiudad.text length];
    NSInteger countTextMaterias = [self.textMaterias.text length];
    NSInteger countTextPrice    = [self.textPrice.text length];
    
    if(countTextCiudad != 0 && countTextMaterias != 0 && countTextPrice != 0){
        
        NSMutableDictionary *valores = [[NSMutableDictionary alloc]init];
        [valores setValue:self.textMaterias.text forKey:@"materia"];
        [valores setValue:[_pickerData objectAtIndex:self.buttonSelectTime.tag] forKey:@"horario"];
        [valores setValue:self.textPrice.text forKey:@"precio"];
        
        AlertViewController *alert = [AlertViewController defaultView:6 valores:valores];
        [alert setDismissHandler:^(AlertViewController *view) {
            // to dismiss current cardView. Also you could call the `dismiss` method.
            [CXCardView dismissCurrent];
        }];
        [CXCardView showWithView:alert draggable:YES];
        
    }else{
        AlertViewController *alert = [AlertViewController defaultView:8 valores:nil];
        [alert setDismissHandler:^(AlertViewController *view) {
            // to dismiss current cardView. Also you could call the `dismiss` method.
            [CXCardView dismissCurrent];
        }];
        [CXCardView showWithView:alert draggable:YES];
        
    }
}

- (IBAction)actionSave:(id)sender {
    NSInteger countTextCiudad   = [self.textCiudad.text length];
    NSInteger countTextMaterias = [self.textMaterias.text length];
    NSInteger countTextPrice    = [self.textPrice.text length];
    if(countTextCiudad != 0 && countTextMaterias != 0 && countTextPrice != 0){
        
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        AlertViewController *alert = [AlertViewController defaultView:8 valores:nil];
        [alert setDismissHandler:^(AlertViewController *view) {
            // to dismiss current cardView. Also you could call the `dismiss` method.
            [CXCardView dismissCurrent];
        }];
        [CXCardView showWithView:alert draggable:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if(textField.tag == 1)
    {
        [self.tableViewMaterias setHidden:NO];
        //[self.okButton setHidden:YES];
        [self.tableViewCiudades setHidden:YES];
    }
    else if (textField.tag == 3)
    {
        //[self.tableSearchMaterias setHidden:NO];
        [self.scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y-150) animated:YES];
        [self.buttonOKPrice setHidden:NO];
        
        [self.tableViewCiudades setHidden:YES];
        [self.tableViewMaterias setHidden:YES];
        //[self.okButton setHidden:YES];
    }
    else if (textField.tag == 4)
    {
        [self.tableViewCiudades setHidden:NO];
        [self.scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y-150) animated:YES];
        [self.scrollView setFrame:CGRectMake(0, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height+150)];
        //[self.okButton setHidden:NO];
        [self.tableViewMaterias setHidden:YES];
    }
    
    return YES;
}

#pragma mark - tableView methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSDictionary *dataCell = nil;
    if(tableView.tag == 1)
    {
        dataCell = [_dataMateriasTable objectAtIndex:indexPath.row];
        [cell.textLabel setText:[dataCell valueForKey:@"materia"]];
        [cell.textLabel setFont:[UIFont fontMontseRegular:14]];
    }
    else if (tableView.tag == 4)
    {
        dataCell = [_dataPoblacionesTable objectAtIndex:indexPath.row];
        [cell.textLabel setText:[NSString stringWithFormat:@"%@, %@",[dataCell valueForKey:@"poblacion"],[dataCell valueForKey:@"provincia"]]];
        [cell.textLabel setFont:[UIFont fontMontseRegular:14]];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView.tag == 1)
    {
        return [_dataMateriasTable count];
    }
    else{
        return [_dataPoblacionesTable count];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dataCell = nil;
    if(tableView.tag == 1)
    {
        dataCell = [_dataMateriasTable objectAtIndex:indexPath.row];
        [self.textMaterias setText:[dataCell valueForKey:@"materia"]];
        [self.textMaterias resignFirstResponder];
        
    }
    else if (tableView.tag == 4)
    {
        dataCell = [_dataPoblacionesTable objectAtIndex:indexPath.row];
        [self.textCiudad setText:[NSString stringWithFormat:@"%@, %@",[dataCell valueForKey:@"poblacion"],[dataCell valueForKey:@"provincia"]]];
        [self.textCiudad resignFirstResponder];
        [self.scrollView setContentOffset:CGPointMake(0, tableView.frame.size.height+100) animated:YES];
        
    }
    [tableView setHidden:YES];
}


#pragma mark - UIPickerView Delegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_pickerData count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self.buttonSelectTime.titleLabel setText:[_pickerData objectAtIndex:row]];
    [self.buttonSelectTime setTag:row];
    [pickerView setHidden:YES];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_pickerData objectAtIndex:row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.pickerHorario setHidden:YES];
    if([self.textDescription.text length] > 0){
        [self.textDescription resignFirstResponder];
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self.scrollView setContentOffset:CGPointMake(0, textView.frame.size.height+100) animated:YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
}

@end
