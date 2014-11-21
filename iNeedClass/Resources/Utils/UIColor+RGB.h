//
//  UIColor+RGB.h
//  Accion Comercial
//
//  Created by Diego Palomar on 11/02/14.
//  Copyright (c) 2014 ABENGOA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (util)
+ (UIColor *)colorWithHexString:(NSString *)hex;
+ (UIColor *)colorWithHexValue:(NSInteger)hex;

+ (UIColor *)colorINC;

+ (UIFont *)fontMontseRegular:(NSInteger)size;
+ (UIFont *)fontMontseBold:(CGFloat)size;
@end
