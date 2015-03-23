//
//  ClassShowViewController.h
//  iNeedClass
//
//  Created by injevm on 17/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassShowViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewClass;
@property (strong, nonatomic) UISearchBar *searchbar;

@end
