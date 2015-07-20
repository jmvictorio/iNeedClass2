//
//  AddExchangeViewController.m
//  iNeedClass
//
//  Created by injevm on 14/7/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import "AddExchangeViewController.h"
#import "AppDelegate.h"
#import "AlertViewController.h"
#import "CXCardView.h"

@interface AddExchangeViewController (){
    AppDelegate *delegate;
    NSArray *_pickerData;
    
    NSMutableArray *_dataMaterias;
    NSMutableArray *_dataMateriasTable;
    
    NSMutableArray *_dataPoblaciones;
    NSMutableArray *_dataPoblacionesTable;
    
    UIBarButtonItem *menuButton;
}

@end

@implementation AddExchangeViewController
@synthesize pickerHorario;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuWhite.png"]
                                                  style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(menuAction:)];
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    
    [self.navigationItem setLeftBarButtonItem:menuButton];
    
    [menuButton setEnabled:YES];

    _pickerData = @[ @"Todo el día", @"Mañana", @"Tarde"];
    
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
    
    _dataPoblaciones = [[NSMutableArray alloc]init];
    _dataMaterias = [[NSMutableArray alloc]init];
    
    [self setUp];
    
    _dataPoblacionesTable = [[NSMutableArray alloc] initWithArray:_dataPoblaciones];
    _dataMateriasTable = [[NSMutableArray alloc] initWithArray:_dataMaterias];
}

- (void)viewWillAppear:(BOOL)animated{
    
    delegate = [AppDelegate sharedInstance];
    
    [delegate doOverlay];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setHidden:NO];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    [[UIButton appearance] setTintColor:[UIColor whiteColor]];
    
    [self.scrollView setContentOffset:CGPointMake(0, 58) animated:YES];
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
    [delegate switchLateralPanelState];
}

- (IBAction)selectTime:(id)sender {
    [pickerHorario setHidden:NO];
}

- (IBAction)actionShow:(id)sender {
    
    NSInteger countTextCiudad       = [self.textCiudad.text length];
    NSInteger countTextMateriasB    = [self.textMateriasBusco.text length];
    NSInteger countTextMateriasO    = [self.textMateriasOfrezco.text length];
    
    if(countTextCiudad != 0 && countTextMateriasB != 0 && countTextMateriasO != 0){
        
        NSMutableDictionary *valores = [[NSMutableDictionary alloc]init];
        [valores setValue:self.textMateriasBusco.text forKey:@"materia1"];
        [valores setValue:[_pickerData objectAtIndex:self.buttonSelectTime.tag] forKey:@"horario"];
        [valores setValue:self.textMateriasOfrezco.text forKey:@"materia2"];
        
        AlertViewController *alert = [AlertViewController defaultView:7 valores:valores];
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
    
    NSInteger countTextCiudad       = [self.textCiudad.text length];
    NSInteger countTextMateriasB    = [self.textMateriasBusco.text length];
    NSInteger countTextMateriasO    = [self.textMateriasOfrezco.text length];
    
    if(countTextCiudad != 0 && countTextMateriasB != 0 && countTextMateriasO != 0){
        
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
    
    if(textField.tag == 2)
    {
        [self.tableViewMateriasBusco setHidden:NO];
        [self.tableViewMateriasOfrezco setHidden:YES];
        [self.tableViewCiudades setHidden:YES];
    }
    else if (textField.tag == 1)
    {
        [self.tableViewMateriasBusco setHidden:YES];
        [self.tableViewMateriasOfrezco setHidden:NO];
        [self.tableViewCiudades setHidden:YES];
    }
    else if (textField.tag == 4)
    {
        [self.tableViewCiudades setHidden:NO];
        [self.scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y-150) animated:YES];
        [self.scrollView setFrame:CGRectMake(0, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height+150)];
        //[self.okButton setHidden:NO];
        [self.tableViewMateriasBusco setHidden:YES];
        [self.tableViewMateriasOfrezco setHidden:YES];
    }
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string isEqualToString:@"\n"]){
        [textField setText:@""];
        [textField resignFirstResponder];
        if(textField.tag == 4)
        {
            [self.tableViewCiudades setHidden:YES];
            _dataPoblacionesTable = [[NSMutableArray alloc]initWithArray:_dataPoblaciones];
            [self.tableViewCiudades reloadData];
        }else if (textField.tag == 1)
        {
            [self.tableViewMateriasOfrezco setHidden:YES];
            _dataMateriasTable = [[NSMutableArray alloc]initWithArray:_dataMaterias];
            [self.tableViewMateriasOfrezco reloadData];
            
        }else if (textField.tag == 2)
        {
            [self.tableViewMateriasBusco setHidden:YES];
            _dataMateriasTable = [[NSMutableArray alloc]initWithArray:_dataMaterias];
            [self.tableViewMateriasBusco reloadData];
        }
        
        return YES;
    }
    
    NSString *strippedStr = [NSString stringWithFormat:@"%@%@",[textField text], string];;

    if([textField.text length] == 0 && textField.tag == 4)
    {
        _dataPoblacionesTable = [[NSMutableArray alloc]initWithArray:_dataPoblaciones];
        [self.tableViewCiudades reloadData];
        return YES;
    }
    else if([textField.text length] == 0 && textField.tag == 1)
    {
        _dataMateriasTable = [[NSMutableArray alloc]initWithArray:_dataMaterias];
        [self.tableViewMateriasOfrezco reloadData];
        return YES;
    }
    else if([textField.text length] == 0 && textField.tag == 2)
    {
        _dataMateriasTable = [[NSMutableArray alloc]initWithArray:_dataMaterias];
        [self.tableViewMateriasBusco reloadData];
        return YES;
    }
    
    if([textField tag] == 4)
    {
        NSString *attributeProvincia = @"provincia";
        NSString *attributePoblacion = @"poblacion";
        NSString *attributeValue = strippedStr;
        
        NSPredicate *predicatePoblacion = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", attributeProvincia, attributeValue];//keySelected is NSString itself
        NSArray *poblaciones = [NSMutableArray arrayWithArray:[_dataPoblaciones filteredArrayUsingPredicate:predicatePoblacion]];
        
        NSPredicate *predicateProvincia = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", attributePoblacion, attributeValue];//keySelected is NSString itself
        NSArray *provincias = [NSMutableArray arrayWithArray:[_dataPoblaciones filteredArrayUsingPredicate:predicateProvincia]];
        
        NSMutableSet *filtroRepetidos = [[NSMutableSet alloc] initWithArray:poblaciones];
        [filtroRepetidos addObjectsFromArray:provincias];
        
        _dataPoblacionesTable = [[NSMutableArray alloc]initWithArray:[filtroRepetidos allObjects]];
        
        [self.tableViewCiudades reloadData];
        
        
    }else if ([textField tag] == 2)
    {
        NSString *attributeMatery = @"materia";
        NSString *attributeValue = strippedStr;
        
        NSPredicate *predicateMaterias = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", attributeMatery, attributeValue];//keySelected is NSString itself
        NSArray *materias = [NSMutableArray arrayWithArray:[_dataMaterias filteredArrayUsingPredicate:predicateMaterias]];
        
        NSMutableSet *filtroRepetidos = [[NSMutableSet alloc] initWithArray:materias];
        
        _dataMateriasTable = [[NSMutableArray alloc]initWithArray:[filtroRepetidos allObjects]];
        
        [self.tableViewMateriasBusco reloadData];
    }
    else if ([textField tag] == 1)
    {
        NSString *attributeMatery = @"materia";
        NSString *attributeValue = strippedStr;
        
        NSPredicate *predicateMaterias = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", attributeMatery, attributeValue];//keySelected is NSString itself
        NSArray *materias = [NSMutableArray arrayWithArray:[_dataMaterias filteredArrayUsingPredicate:predicateMaterias]];
        
        NSMutableSet *filtroRepetidos = [[NSMutableSet alloc] initWithArray:materias];
        
        _dataMateriasTable = [[NSMutableArray alloc]initWithArray:[filtroRepetidos allObjects]];
        
        [self.tableViewMateriasOfrezco reloadData];
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
    if((tableView.tag == 1)||(tableView.tag == 2))
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
    if((tableView.tag == 1)||(tableView.tag == 2))
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
    if(tableView.tag == 2)
    {
        dataCell = [_dataMateriasTable objectAtIndex:indexPath.row];
        [self.textMateriasBusco setText:[dataCell valueForKey:@"materia"]];
        [self.textMateriasBusco resignFirstResponder];
        
    }
    else if (tableView.tag == 1){
        dataCell = [_dataMateriasTable objectAtIndex:indexPath.row];
        [self.textMateriasOfrezco setText:[dataCell valueForKey:@"materia"]];
        [self.textMateriasOfrezco resignFirstResponder];
    }
    else if (tableView.tag == 4)
    {
        dataCell = [_dataPoblacionesTable objectAtIndex:indexPath.row];
        [self.textCiudad setText:[NSString stringWithFormat:@"%@, %@",[dataCell valueForKey:@"poblacion"],[dataCell valueForKey:@"provincia"]]];
        [self.textCiudad resignFirstResponder];
        [self.scrollView setFrame:CGRectMake(0, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height-150)];
        
    }
    [tableView setHidden:YES];
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
    [self.pickerHorario setHidden:YES];
}


@end
