//
//  UIFont+Montserrat.m
//  iNeedClass
//
//  Created by injevm on 8/1/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import "UIFont+Montserrat.h"

@implementation UIFont(util)

+ (UIFont *)fontMontseRegular:(CGFloat)size
{
    return [UIFont fontWithName:@"Montserrat-Regular" size:size];
}

+ (UIFont *)fontMontseBold:(CGFloat)size
{
    return [UIFont fontWithName:@"Montserrat-Bold" size:size];
}

@end
