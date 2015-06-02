//
//  ExchangeShowViewCell.h
//  iNeedClass
//
//  Created by injevm on 18/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExchangeShowViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet FBProfilePictureView *profileFB;
@property (weak, nonatomic) IBOutlet UIImageView *profileIMG;
@property (weak, nonatomic) IBOutlet UILabel *subjectMeLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectYouLabel;

+ (UINib *)nib;

@end
