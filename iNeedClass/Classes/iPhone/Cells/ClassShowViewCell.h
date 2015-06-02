//
//  ClassShowViewCell.h
//  iNeedClass
//
//  Created by injevm on 18/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassShowViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profileFB;
@property (weak, nonatomic) IBOutlet UIImageView *profileIMG;

@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UILabel *materiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *precioLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeTableLabel;

+ (UINib *)nib;

@end
