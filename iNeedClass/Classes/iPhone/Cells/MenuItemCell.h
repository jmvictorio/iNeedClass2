//
//  MenuItemCell.h
//  iNeedClass
//
//  Created by Jesus Victorio on 23/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

+ (UINib *)nib;
@end
