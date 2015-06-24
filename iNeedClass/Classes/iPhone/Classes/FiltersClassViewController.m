//
//  FiltersClassViewController.m
//  iNeedClass
//
//  Created by injevm on 17/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "FiltersClassViewController.h"

@interface FiltersClassViewController ()
{
    NSArray *_pickerData;
    NSMutableArray *_dataPoblaciones;
    NSMutableArray *_dataPoblacionesTable;
    
    NSMutableArray *_dataMaterias;
    NSMutableArray *_dataMateriasTable;
}

@end

@implementation FiltersClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.scroll setContentSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+20)];
    
    [self.okButton setHidden:YES];
    
    // Do any additional setup after loading the view from its nib.
    [self.saveButton.titleLabel setFont:[UIFont fontMontseBold:14]];
    [self.noSaveButton.titleLabel setFont:[UIFont fontMontseBold:14]];
    
    //[HTAutocompleteTextField setDefaultAutocompleteDataSource:[HTAutocompleteManager sharedManager]];
    //self.poblacionTextField.autocompleteType = HTAutocompleteTypePoblacion;
    
    _pickerData = @[@"sin orden", @"mas barato", @"mas caro", @"mas nuevo", @"mas antiguo", @"por poblacion", @"por materia"];
    _dataPoblaciones = [[NSMutableArray alloc]init];
    _dataMaterias = [[NSMutableArray alloc]init];
    
    [self setUp];
    
    _dataPoblacionesTable = [[NSMutableArray alloc] initWithArray:_dataPoblaciones];
    _dataMateriasTable = [[NSMutableArray alloc] initWithArray:_dataMaterias];
    
    [self.pickerOrder setDelegate:self];
    [self.pickerOrder setDataSource:self];
    
    [self.pickerOrder selectRow:2 inComponent:0 animated:YES];
    
    // Dismiss the keyboard when the user taps outside of a text field
    //UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    //[self.view addGestureRecognizer:singleTap];
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


- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    [self.materiaTextField resignFirstResponder];
    [self.poblacionTextField resignFirstResponder];
    [self.priceTextLess resignFirstResponder];
    [self.priceTextMore resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAction:(id)sender {
    
}

- (IBAction)noSaveAction:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"hideFilters" object:nil];
}

- (IBAction)cerrarTeclado:(id)sender {
    [self.priceTextLess resignFirstResponder];
    [self.priceTextMore resignFirstResponder];
    [self.okButton setHidden:YES];
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_pickerData count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_pickerData objectAtIndex:row];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if(textField.tag == 1)
    {
        [self.tableSearchPoblaciones setHidden:NO];
        [self.okButton setHidden:YES];
    }
    else if (textField.tag == 2)
    {
        [self.tableSearchMaterias setHidden:NO];
        [self.scroll setContentOffset:CGPointMake(0, textField.frame.origin.y-40) animated:YES];
        [self.okButton setHidden:YES];
    }
    else if (textField.tag == 3 || textField.tag == 4)
    {
        [self.scroll setContentOffset:CGPointMake(0, 20) animated:YES];
        [self.okButton setHidden:NO];
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if(textField.tag == 1)
    {
        [self.tableSearchPoblaciones setHidden:YES];
    }
    else if (textField.tag == 2)
    {
        [self.tableSearchMaterias setHidden:YES];
    }
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string isEqualToString:@"\n"]){
        [textField resignFirstResponder];
        if(textField.tag == 1)
        {
            [self.tableSearchPoblaciones setHidden:YES];
            _dataPoblacionesTable = [[NSMutableArray alloc]initWithArray:_dataPoblaciones];
            [self.tableSearchPoblaciones reloadData];
        }else if (textField.tag == 2)
        {
            [self.tableSearchMaterias setHidden:YES];
            _dataMateriasTable = [[NSMutableArray alloc]initWithArray:_dataMaterias];
            [self.tableSearchMaterias reloadData];
        }
        
        return YES;
    }
    
    NSString *strippedStr = [textField text];
    // break up the search terms (separated by spaces)
    /*NSArray *searchItems = nil;
    if (strippedStr.length > 0)
    {
        searchItems = [strippedStr componentsSeparatedByString:@" "];
    }
    */
    if([textField.text length] == 0 && textField.tag == 1)
    {
        _dataPoblacionesTable = [[NSMutableArray alloc]initWithArray:_dataPoblaciones];
        [self.tableSearchPoblaciones reloadData];
        return YES;
    }
    else if([textField.text length] == 0 && textField.tag == 2)
    {
        _dataMateriasTable = [[NSMutableArray alloc]initWithArray:_dataMaterias];
        [self.tableSearchMaterias reloadData];
        return YES;
    }
    
    if([textField tag] == 1)
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
        
        [self.tableSearchPoblaciones reloadData];
        
       
    }
    else if ([textField tag] == 2)
    {
        NSString *attributeMatery = @"materia";
        NSString *attributeValue = strippedStr;
        
        NSPredicate *predicateMaterias = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", attributeMatery, attributeValue];//keySelected is NSString itself
        NSArray *materias = [NSMutableArray arrayWithArray:[_dataMaterias filteredArrayUsingPredicate:predicateMaterias]];
        
        NSMutableSet *filtroRepetidos = [[NSMutableSet alloc] initWithArray:materias];
        
        _dataMateriasTable = [[NSMutableArray alloc]initWithArray:[filtroRepetidos allObjects]];
        
        [self.tableSearchMaterias reloadData];
    }
    return YES;
}

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
        dataCell = [_dataPoblacionesTable objectAtIndex:indexPath.row];
        [cell.textLabel setText:[NSString stringWithFormat:@"%@, %@",[dataCell valueForKey:@"poblacion"],[dataCell valueForKey:@"provincia"]]];
        [cell.textLabel setFont:[UIFont fontMontseRegular:14]];
    }
    else if (tableView.tag == 2)
    {
        dataCell = [_dataMateriasTable objectAtIndex:indexPath.row];
        [cell.textLabel setText:[dataCell valueForKey:@"materia"]];
        [cell.textLabel setFont:[UIFont fontMontseRegular:14]];
    }
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView.tag == 1)
    {
        return [_dataPoblacionesTable count];
    }
    else{
        return [_dataMateriasTable count];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dataCell = nil;
    if(tableView.tag == 1)
    {
        dataCell = [_dataPoblacionesTable objectAtIndex:indexPath.row];
        [self.poblacionTextField setText:[NSString stringWithFormat:@"%@, %@",[dataCell valueForKey:@"poblacion"],[dataCell valueForKey:@"provincia"]]];
        [self.poblacionTextField resignFirstResponder];
    }
    else if (tableView.tag == 2)
    {
        dataCell = [_dataMateriasTable objectAtIndex:indexPath.row];
        [self.materiaTextField setText:[dataCell valueForKey:@"materia"]];
        [self.materiaTextField resignFirstResponder];
    }
}

@end
