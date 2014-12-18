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

@interface ClassShowViewController ()
{
    AppDelegate *delegate;
    UIBarButtonItem *filterButton;
    UIBarButtonItem *backButton;
}

@property (nonatomic, strong) AFPopupView *popup;
@property (nonatomic, strong) FiltersClassViewController *filters;

@end

@implementation ClassShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    [flowlayout setSectionInset:UIEdgeInsetsMake(20, 5, 10, 5)];
    [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowlayout setHeaderReferenceSize:CGSizeMake(300, 50)];
    
    [flowlayout setItemSize:CGSizeMake(300, 50)];
    [self.collectionViewClass registerNib:[ClassShowViewCell nib] forCellWithReuseIdentifier:@"classShowCell"];
    
    filterButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"polyline-24"] style:UIBarButtonItemStylePlain target:self action:@selector(openFilters)];
    
    backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"previous-24"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    
    [self.navigationItem setRightBarButtonItem:filterButton animated:YES];
    [self.navigationItem setLeftBarButtonItem:backButton animated:YES];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideFilters) name:@"hideFilters" object:nil];
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    delegate = [AppDelegate sharedInstance];
    [delegate dontOverlay];
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
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier;
    
    cellIdentifier = @"classShowCell";
    
    ClassShowViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell.profileFB setProfileID:@"1630846377"];
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    [cell.layer setCornerRadius:10];
    
    return cell;
}

@end
