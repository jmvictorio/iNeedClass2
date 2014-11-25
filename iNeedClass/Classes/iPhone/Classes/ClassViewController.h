//
//  ClassViewController.h
//  iNeedClass
//
//  Created by injevm on 25/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) IBOutlet UICollectionView *collection;

+ (ClassViewController *)defaultView:(NSInteger)option;

@end
