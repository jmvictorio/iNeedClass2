//
//  MenuItemCell.m
//  iNeedClass
//
//  Created by Jesus Victorio on 23/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "MenuItemCell.h"
#import "UIColor+RGB.h"


@implementation MenuItemCell

@synthesize descriptionLabel;
@synthesize iconImage;

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"MenuItemCell" bundle:nil];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
}

@end
