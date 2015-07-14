//
//  ClassShowViewController.m
//  iNeedClass
//
//  Created by injevm on 17/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "ClassShowViewController.h"
#import "AFPopupView.h"
#import "FiltersClassViewController.h"
#import "ClassShowViewCell.h"
#import "TeacherViewController.h"
#import "ExchangeViewController.h"
#import "Utils.h"

@interface ClassShowViewController ()
{
    AppDelegate *delegate;
    UIBarButtonItem *filterButton;
    UIBarButtonItem *backButton;
    UIBarButtonItem *searchItem;
    
    NSMutableArray *fetchedArray;
    
    NSArray *inboxTeacher;
}

@property (nonatomic, strong) AFPopupView *popup;
@property (nonatomic, strong) FiltersClassViewController *filters;

@end

@implementation ClassShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    [flowlayout setSectionInset:UIEdgeInsetsMake(20, 5, 10, 5)];
    [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowlayout setHeaderReferenceSize:CGSizeMake(300, 50)];
    
    [flowlayout setItemSize:CGSizeMake(300, 50)];
    [self.collectionViewClass registerNib:[ClassShowViewCell nib] forCellWithReuseIdentifier:@"classShowCell"];
    
    [self.collectionViewClass registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    filterButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"View-List-48"] style:UIBarButtonItemStylePlain target:self action:@selector(openFilters)];
    searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(openSearch)];
    
    backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"previous-24"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    
    [self.navigationItem setRightBarButtonItems:@[filterButton, searchItem] animated:YES];
    [self.navigationItem setLeftBarButtonItem:backButton animated:YES];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideFilters) name:@"hideFilters" object:nil];
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    self.searchbar = [[UISearchBar alloc] init];
    self.searchbar.showsCancelButton = YES;
    [self.searchbar setPlaceholder:@"Buscar"];
    self.searchbar.delegate = self;
}

- (void)openSearch {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.searchbar.alpha = 0.0f;
        
    } completion:^(BOOL finished) {
        
        // remove the search button
        [self.navigationItem setRightBarButtonItems:nil animated:YES];
        // add the search bar (which will start out hidden).
        self.navigationItem.titleView = self.searchbar;
        self.searchbar.alpha = 0.0;
        
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.searchbar.alpha = 1.0;
                         } completion:^(BOOL finished) {
                             [self.searchbar becomeFirstResponder];
                         }];
        
    }];
}


- (void)viewWillAppear:(BOOL)animated
{
    delegate = [AppDelegate sharedInstance];
    [delegate dontOverlay];
    
    NSMutableDictionary *newComment1 = [[NSMutableDictionary alloc]init];
    NSString *date1=[Utils buildDateNow];
    [newComment1 setValue:@"1234" forKey:@"teacher"];
    [newComment1 setValue:@"Jesus" forKey:@"name"];
    [newComment1 setValue:@"Introducción a las matemáticas discretas" forKey:@"materia"];
    [newComment1 setValue:date1 forKey:@"creationDate"];
    [newComment1 setValue:@"8.5" forKey:@"precio"];
    [newComment1 setValue:@"Mañana" forKey:@"horario"];
    [newComment1 setValue:@"1630846377" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment2 = [[NSMutableDictionary alloc]init];
    NSString *date2=[Utils buildDateNow];
    [newComment2 setValue:@"1345" forKey:@"teacher"];
    [newComment2 setValue:@"Antonio" forKey:@"name"];
    [newComment2 setValue:@"Inglés" forKey:@"materia"];
    [newComment2 setValue:date2 forKey:@"creationDate"];
    [newComment2 setValue:@"10.0" forKey:@"precio"];
    [newComment2 setValue:@"Todos" forKey:@"horario"];
    [newComment2 setValue:@"1571869276" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment3 = [[NSMutableDictionary alloc]init];
    NSString *date3=[Utils buildDateNow];
    [newComment3 setValue:@"9383" forKey:@"teacher"];
    [newComment3 setValue:@"Victor" forKey:@"name"];
    [newComment3 setValue:@"Programación iOS" forKey:@"materia"];
    [newComment3 setValue:date3 forKey:@"creationDate"];
    [newComment3 setValue:@"14.0" forKey:@"precio"];
    [newComment3 setValue:@"Tarde" forKey:@"horario"];
    [newComment3 setValue:@"1156597762" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment4 = [[NSMutableDictionary alloc]init];
    NSString *date4=[Utils buildDateNow];
    [newComment4 setValue:@"5555" forKey:@"teacher"];
    [newComment4 setValue:@"Javier" forKey:@"name"];
    [newComment4 setValue:@"Francés" forKey:@"materia"];
    [newComment4 setValue:date4 forKey:@"creationDate"];
    [newComment4 setValue:@"Tarde" forKey:@"horario"];
    [newComment4 setValue:@"7.0" forKey:@"precio"];
    [newComment4 setValue:@"1286514520" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment5 = [[NSMutableDictionary alloc]init];
    NSString *date5=[Utils buildDateNow];
    [newComment5 setValue:@"5678" forKey:@"teacher"];
    [newComment5 setValue:@"Fran" forKey:@"name"];
    [newComment5 setValue:@"Programación Android" forKey:@"materia"];
    [newComment5 setValue:date5 forKey:@"creationDate"];
    [newComment5 setValue:@"9.5" forKey:@"precio"];
    [newComment5 setValue:@"Todos" forKey:@"horario"];
    [newComment5 setValue:@"795901925" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment6 = [[NSMutableDictionary alloc]init];
    NSString *date6=[Utils buildDateNow];
    [newComment6 setValue:@"8765" forKey:@"teacher"];
    [newComment6 setValue:@"Paco" forKey:@"name"];
    [newComment6 setValue:@"Bachata Avanzado" forKey:@"materia"];
    [newComment6 setValue:date6 forKey:@"creationDate"];
    [newComment6 setValue:@"5.5" forKey:@"precio"];
    [newComment6 setValue:@"Mañana" forKey:@"horario"];
    [newComment6 setValue:@"1552524127" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment7 = [[NSMutableDictionary alloc]init];
    NSString *date7=[Utils buildDateNow];
    [newComment7 setValue:@"5843" forKey:@"teacher"];
    [newComment7 setValue:@"Manolo" forKey:@"name"];
    [newComment7 setValue:@"Inglés" forKey:@"materia"];
    [newComment7 setValue:date7 forKey:@"creationDate"];
    [newComment7 setValue:@"11.0" forKey:@"precio"];
    [newComment7 setValue:@"Mañana" forKey:@"horario"];
    [newComment7 setValue:@"100005013097267" forKey:@"pictureFB"];
    
    inboxTeacher = [[NSArray alloc] initWithObjects:newComment1, newComment2, newComment3, newComment4, newComment5, newComment6, newComment7, nil];
    
    fetchedArray = [[NSMutableArray alloc]initWithArray:inboxTeacher];
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openFilters
{
    self.filters = [[FiltersClassViewController alloc]init];
    _popup = [AFPopupView popupWithView:_filters.view];
    [_popup show];
}

-(void)hideFilters
{
    [_popup hide];
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UICOLLECTION DELEGATE

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [fetchedArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier;
    
    cellIdentifier = @"classShowCell";
    
    ClassShowViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSDictionary *datos = [fetchedArray objectAtIndex:indexPath.row];
    
    [cell.profileFB setProfileID:nil];
    [cell.profileFB setProfileID:[datos valueForKey:@"pictureFB"]];
    [cell.subjectLabel setText:[datos valueForKey:@"materia"]];
    [cell.subjectLabel setFont:[UIFont fontMontseRegular:13]];
    [cell.priceLabel setText:[NSString stringWithFormat:@"%@ €/h",[datos valueForKey:@"precio"]]];
    [cell.timeTableLabel setText:[datos valueForKey:@"horario"]];
    [cell.timeTableLabel setFont:[UIFont fontMontseRegular:13]];
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    [cell.layer setCornerRadius:10];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    TeacherViewController *teach = [[TeacherViewController alloc]init];
    //meter datos en la clase
    [self.navigationController pushViewController:teach animated:YES];
    
}
/*
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader)
    {
        UICollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        if (reusableview==nil) {
            reusableview=[[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
        }
        
        [reusableview setBackgroundColor:[UIColor colorINC]];
        
        self.searchbar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
        
        [self.searchbar setDelegate:self];
        
        [self.searchbar setBarTintColor:[UIColor colorINC]];
        
        [self.searchbar.layer setBorderWidth:0.5];
        
        [self.searchbar.layer setBorderColor:[UIColor colorINC].CGColor];
        
        [self.searchbar setPlaceholder:@"Buscar"];
        
        [reusableview addSubview:self.searchbar];
        
        return reusableview;
    }
    return nil;
}
*/

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSString *strippedStr = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    // break up the search terms (separated by spaces)
   /* NSArray *searchItems = nil;
    if (strippedStr.length > 0)
    {
        searchItems = [strippedStr componentsSeparatedByString:@" "];
    }*/
    NSLog(@"TEXTO: %@", searchText);
    
    if([searchText length] == 0)
    {
        [searchBar setShowsCancelButton:NO animated:YES];
        fetchedArray = [[NSMutableArray alloc]initWithArray:inboxTeacher];
        [searchBar resignFirstResponder];
        [self.collectionViewClass reloadSections:[NSIndexSet indexSetWithIndex:0]];
        
        return;
    }
    
    NSString *attributeMatery = @"materia";
    NSString *attributePrice = @"precio";
    NSString *attributeValue = strippedStr;
   
    NSPredicate *predicateMatery = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", attributeMatery, attributeValue];//keySelected is NSString itself
    NSArray *subjects = [NSMutableArray arrayWithArray:[inboxTeacher filteredArrayUsingPredicate:predicateMatery]];
    
    NSPredicate *predicatePrices = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", attributePrice, attributeValue];//keySelected is NSString itself
    NSArray *prices = [NSMutableArray arrayWithArray:[inboxTeacher filteredArrayUsingPredicate:predicatePrices]];
    
    fetchedArray = [[NSMutableArray alloc]initWithArray:subjects];
    [fetchedArray addObjectsFromArray:prices];
    
    [self.collectionViewClass reloadSections:[NSIndexSet indexSetWithIndex:0]];

}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar setText:@""];
    fetchedArray = [[NSMutableArray alloc]initWithArray:inboxTeacher];
    [self.collectionViewClass reloadSections:[NSIndexSet indexSetWithIndex:0]];
    [searchBar resignFirstResponder];
    
    [self hideSearchBar];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"BUSCAAAA");
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    
    [self hideSearchBar];
}

- (void)hideSearchBar
{
    [UIView animateWithDuration:0.5f animations:^{
        self.searchbar.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        self.navigationItem.titleView = nil;
        [self.navigationItem setRightBarButtonItems:@[filterButton, searchItem] animated:YES];
        [self.navigationItem setTitle:@"Profesores"];
        self.searchbar.alpha = 0.0;  // set this *after* adding it back
        [UIView animateWithDuration:0.5f animations:^ {
            self.searchbar.alpha = 1.0;
        }];
    }];
}


@end
