//
//  ClassViewController.m
//  iNeedClass
//
//  Created by injevm on 25/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "ClassViewController.h"
#import "ClassViewCell.h"
#import "ExchangeViewCell.h"
#import "AlertViewController.h"
#import "CXCardView.h"

@interface ClassViewController ()

@property (nonatomic) NSInteger options;

@end

@implementation ClassViewController

- (id)init1
{
    self = [super init];
    if (self) {
        self.options = 0;
    }
    return self;
}

- (id)init2
{
    self = [super init];
    if (self) {
        self.options = 1;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    [flowlayout setSectionInset:UIEdgeInsetsMake(20, 5, 10, 5)];
    [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowlayout setHeaderReferenceSize:CGSizeMake(300, 50)];

    if(self.options == 0)
    {
        [flowlayout setItemSize:CGSizeMake(300, 50)];
        [self.collection registerNib:[ClassViewCell nib] forCellWithReuseIdentifier:@"classCell"];
    }
    else
    {
        [flowlayout setItemSize:CGSizeMake(300, 80)];
        [self.collection registerNib:[ExchangeViewCell nib] forCellWithReuseIdentifier:@"exchangeCell"];
    }
    
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];

    [self.collection setCollectionViewLayout:flowlayout];
}

+ (ClassViewController *)defaultView:(NSInteger)option
{
    ClassViewController *view;
    
    switch (option) {
        case 0:
            view = [[ClassViewController alloc] init1];
            break;
        case 1:
            view = [[ClassViewController alloc] init2];
            break;
        case 2:
            break;
        default:
            break;
    }
    
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier;
    
    if(self.options == 0)
    {
        cellIdentifier = @"classCell";
    }
    else
    {
        cellIdentifier = @"exchangeCell";
    }

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell.layer setCornerRadius:10];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader)
    {
        UICollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        if (reusableview==nil) {
            reusableview=[[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
        }
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"Añadir Nueva" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor colorINC]];
        [button setTintColor:[UIColor whiteColor]];
        button.frame = CGRectMake(10, 10, 300, 50);
        [button.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:15.0]];
        [button.layer setCornerRadius:10];

        [reusableview addSubview:button];
        
        
        return reusableview;
    }
    return nil;
}

- (void)add
{
    AlertViewController *alert;
    UILabel *descriptionLabel = [[UILabel alloc] init];
    descriptionLabel.frame = CGRectMake(20, 0, 260, 75);
    descriptionLabel.numberOfLines = 0.;
    descriptionLabel.textAlignment = NSTextAlignmentCenter;
    descriptionLabel.backgroundColor = [UIColor clearColor];
    descriptionLabel.textColor = [UIColor blackColor];
    descriptionLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:14.0f];
    if(self.options == 0)
    {
        alert = [AlertViewController defaultView:1 valores:nil];
        descriptionLabel.text = @"Desea añadir una nueva Materia?";
    }
    else
    {
        alert = [AlertViewController defaultView:2 valores:nil];
        descriptionLabel.text = @"Desea añadir un nuevo Intercambio?";
        
    }
    [alert addSubview:descriptionLabel];
    
    [alert setDismissHandler:^(AlertViewController *view) {
        // to dismiss current cardView. Also you could call the `dismiss` method.
        [CXCardView dismissCurrent];
    }];
    
    
    [CXCardView showWithView:alert draggable:YES];
}

@end
