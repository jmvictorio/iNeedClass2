//
//  ExchangeShowViewController.m
//  iNeedClass
//
//  Created by injevm on 17/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "ExchangeShowViewController.h"
#import "AFPopupView.h"
#import "ExchangeShowViewCell.h"
#import "FiltersExchangeViewController.h"
#import "ExchangeViewController.h"
#import "Utils.h"

@interface ExchangeShowViewController ()
{
    AppDelegate *delegate;
    UIBarButtonItem *filterButton;
    UIBarButtonItem *searchItem;
    UIBarButtonItem *backButton;
    
    NSMutableArray *fetchedArray;
    
    NSArray *inboxTeacher;
}

@property (nonatomic, strong) AFPopupView *popup;
@property (nonatomic, strong) FiltersExchangeViewController *filters;

@end

@implementation ExchangeShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    [flowlayout setSectionInset:UIEdgeInsetsMake(20, 5, 10, 5)];
    [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowlayout setHeaderReferenceSize:CGSizeMake(300, 50)];
    
    [flowlayout setItemSize:CGSizeMake(300, 50)];
    [self.collectionViewController registerNib:[ExchangeShowViewCell nib] forCellWithReuseIdentifier:@"exchangeShowCell"];
    
    filterButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"View-List-48"] style:UIBarButtonItemStylePlain target:self action:@selector(openFilters)];
    searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(openSearch)];
    backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"previous-24"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    
    [self.navigationItem setRightBarButtonItems:@[filterButton, searchItem] animated:YES];
    [self.navigationItem setLeftBarButtonItem:backButton animated:YES];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideFilters) name:@"hideFilters2" object:nil];
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];

    self.searchbar = [[UISearchBar alloc] init];
    self.searchbar.showsCancelButton = YES;
    [self.searchbar setPlaceholder:@"Buscar"];
    self.searchbar.delegate = self;

}

- (void)viewWillAppear:(BOOL)animated
{
    delegate = [AppDelegate sharedInstance];
    [delegate dontOverlay];
    
    NSMutableDictionary *newComment1 = [[NSMutableDictionary alloc]init];
    NSString *date1=[Utils buildDateNow];
    [newComment1 setValue:@"1234" forKey:@"teacher"];
    [newComment1 setValue:@"Jesus" forKey:@"name"];
    [newComment1 setValue:@"Introducción a las matemáticas discretas" forKey:@"ofrezco"];
    [newComment1 setValue:date1 forKey:@"creationDate"];
    [newComment1 setValue:@"Programacion iOS" forKey:@"busco"];
    [newComment1 setValue:@"1630846377" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment2 = [[NSMutableDictionary alloc]init];
    NSString *date2=[Utils buildDateNow];
    [newComment2 setValue:@"1345" forKey:@"teacher"];
    [newComment2 setValue:@"Antonio" forKey:@"name"];
    [newComment2 setValue:@"Inglés" forKey:@"ofrezco"];
    [newComment2 setValue:@"Programacion iOS" forKey:@"busco"];
    [newComment2 setValue:date2 forKey:@"creationDate"];
    [newComment2 setValue:@"1571869276" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment3 = [[NSMutableDictionary alloc]init];
    NSString *date3=[Utils buildDateNow];
    [newComment3 setValue:@"9383" forKey:@"teacher"];
    [newComment3 setValue:@"Victor" forKey:@"name"];
    [newComment3 setValue:@"Programación iOS" forKey:@"ofrezco"];
    [newComment3 setValue:@"Programacion iOS" forKey:@"busco"];
    [newComment3 setValue:date3 forKey:@"creationDate"];
    [newComment3 setValue:@"1156597762" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment4 = [[NSMutableDictionary alloc]init];
    NSString *date4=[Utils buildDateNow];
    [newComment4 setValue:@"5555" forKey:@"teacher"];
    [newComment4 setValue:@"Javier" forKey:@"name"];
    [newComment4 setValue:@"Francés" forKey:@"ofrezco"];
    [newComment4 setValue:@"Programacion iOS" forKey:@"busco"];
    [newComment4 setValue:date4 forKey:@"creationDate"];
    [newComment4 setValue:@"1286514520" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment5 = [[NSMutableDictionary alloc]init];
    NSString *date5=[Utils buildDateNow];
    [newComment5 setValue:@"5678" forKey:@"teacher"];
    [newComment5 setValue:@"Fran" forKey:@"name"];
    [newComment5 setValue:@"Programación Android" forKey:@"ofrezco"];
    [newComment5 setValue:@"Programacion iOS" forKey:@"busco"];
    [newComment5 setValue:date5 forKey:@"creationDate"];
    [newComment5 setValue:@"795901925" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment6 = [[NSMutableDictionary alloc]init];
    NSString *date6=[Utils buildDateNow];
    [newComment6 setValue:@"8765" forKey:@"teacher"];
    [newComment6 setValue:@"Paco" forKey:@"name"];
    [newComment6 setValue:@"Bachata Avanzado" forKey:@"ofrezco"];
    [newComment6 setValue:@"Programacion iOS" forKey:@"busco"];
    [newComment6 setValue:date6 forKey:@"creationDate"];
    [newComment6 setValue:@"1552524127" forKey:@"pictureFB"];
    
    NSMutableDictionary *newComment7 = [[NSMutableDictionary alloc]init];
    NSString *date7=[Utils buildDateNow];
    [newComment7 setValue:@"5843" forKey:@"teacher"];
    [newComment7 setValue:@"Manolo" forKey:@"name"];
    [newComment7 setValue:@"Inglés" forKey:@"ofrezco"];
    [newComment7 setValue:@"Programacion iOS" forKey:@"busco"];
    [newComment7 setValue:date7 forKey:@"creationDate"];
    [newComment7 setValue:@"100005013097267" forKey:@"pictureFB"];
    
    inboxTeacher = [[NSArray alloc] initWithObjects:newComment1, newComment2, newComment3, newComment4, newComment5, newComment6, newComment7, nil];
    
    fetchedArray = [[NSMutableArray alloc]initWithArray:inboxTeacher];
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)openFilters
{
    self.filters = [[FiltersExchangeViewController alloc]init];
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
    static NSString *cellIdentifier = @"exchangeShowCell";
    
    ExchangeShowViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSDictionary *datos = [fetchedArray objectAtIndex:indexPath.row];
    
    [cell.profileFB setProfileID:nil];
    [cell.profileFB setProfileID:[datos valueForKey:@"pictureFB"]];
    
    [cell.subjectMeLabel setFont:[UIFont fontMontseRegular:13]];
    [cell.subjectYouLabel setFont:[UIFont fontMontseRegular:13]];
    
    [cell.subjectMeLabel setText:[datos valueForKey:@"ofrezco"]];
    [cell.subjectYouLabel setText:[datos valueForKey:@"busco"]];
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    [cell.layer setCornerRadius:10];

    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ExchangeViewController *exchange = [[ExchangeViewController alloc]init];
    //meter datos en la clase
    [self.navigationController pushViewController:exchange animated:YES];
    
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSString *strippedStr = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    // break up the search terms (separated by spaces)
    /*NSArray *searchItems = nil;
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
        [self.collectionViewController reloadSections:[NSIndexSet indexSetWithIndex:0]];
        
        return;
    }
    
    NSString *attributeMatery1 = @"ofrezco";
    NSString *attributeMatery2 = @"busco";
    NSString *attributeValue = strippedStr;
    
    NSPredicate *predicateMatery = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", attributeMatery1, attributeValue];//keySelected is NSString itself
    NSArray *subjects = [NSMutableArray arrayWithArray:[inboxTeacher filteredArrayUsingPredicate:predicateMatery]];
    
    NSPredicate *predicateMatery2 = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", attributeMatery2, attributeValue];//keySelected is NSString itself
    NSArray *materias2 = [NSMutableArray arrayWithArray:[inboxTeacher filteredArrayUsingPredicate:predicateMatery2]];
    
    fetchedArray = [[NSMutableArray alloc]initWithArray:subjects];
    [fetchedArray addObjectsFromArray:materias2];
    
    [self.collectionViewController reloadSections:[NSIndexSet indexSetWithIndex:0]];
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar setText:@""];
    fetchedArray = [[NSMutableArray alloc]initWithArray:inboxTeacher];
    [self.collectionViewController reloadSections:[NSIndexSet indexSetWithIndex:0]];
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
