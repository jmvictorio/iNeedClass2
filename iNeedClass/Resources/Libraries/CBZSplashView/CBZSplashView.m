//
//  CBZSplashView.m
//  MicroMessage
//
//  Created by Callum Boddy on 22/07/2014.
//  Copyright (c) 2014 Callum Boddy. All rights reserved.
//

#import "CBZSplashView.h"

@interface CBZSplashView ()
@property (nonatomic, strong) UIColor *backgroundViewColor;
@property (nonatomic, strong) UIImage *iconImage;
@property (strong, nonatomic) UIImageView *iconImageView;
@property (nonatomic, strong) NSMutableArray *icons;
@end


@implementation CBZSplashView

- (instancetype)initWithIcon:(UIImage *)icon backgroundColor:(UIColor *)backgroundColor
{
  self = [super init];
  if (self) {
      _icons=[[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"Business-Situations_05_1"],
                                                    [UIImage imageNamed:@"Business-Situations_05_2"],
                                                    [UIImage imageNamed:@"Business-Situations_05_3"],
                                                    [UIImage imageNamed:@"Business-Situations_05_4"],
                                                    [UIImage imageNamed:@"Business-Situations_05_5"],
                                                    [UIImage imageNamed:@"Business-Situations_05_6"],
                                                    [UIImage imageNamed:@"Business-Situations_05_7"],
                                                    [UIImage imageNamed:@"Business-Situations_05_8"],
                                                    [UIImage imageNamed:@"Business-Situations_05_9"],
                                                    [UIImage imageNamed:@"Business-Situations_05_10"],
                                                    [UIImage imageNamed:@"Business-Situations_05_11"],
                                                    [UIImage imageNamed:@"Business-Situations_05_12"],
                                                    [UIImage imageNamed:@"Business-Situations_05_13"],
                                                    [UIImage imageNamed:@"Business-Situations_05_14"], nil];
    _iconImage = icon;
    _backgroundViewColor = backgroundColor;
  }
  return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
  if (!newSuperview) {
    return;
  }
  [self setupViewWithBackgroundColor:self.backgroundViewColor];
}

- (void)setupViewWithBackgroundColor:(UIColor *)backgroundColor
{
    if (!backgroundColor) {
        return;
    }
  
    self.frame = [UIApplication sharedApplication].keyWindow.frame;
    self.backgroundColor = self.backgroundViewColor;

    self.iconImageView = [UIImageView new];
    self.iconImageView.image = [self.icons objectAtIndex:0];//[self.iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.iconImageView.tintColor = self.iconColor;
    self.iconImageView.frame = CGRectMake(0, 0, self.iconStartSize.width, self.iconStartSize.height);
    self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.iconImageView.center = self.center;
  
    [self addSubview:self.iconImageView];
}

- (void)startAnimation
{
  __block __weak typeof(self) weakSelf = self;
  
  if (!self.animationDuration) {
    return;
  }
  CGFloat shrinkDuration = self.animationDuration * 0.3;
  CGFloat growDuration = self.animationDuration * 0.7;
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(5, 5);
    weakSelf.iconImageView.transform = scaleTransform;
  [UIView animateWithDuration:shrinkDuration delay:0 usingSpringWithDamping:20 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
      weakSelf.alpha = 1;
      weakSelf.iconImageView.animationImages = self.icons;
      weakSelf.iconImageView.animationDuration = 2.1f;
      weakSelf.iconImageView.animationRepeatCount = 1;
      [weakSelf.iconImageView startAnimating];
    
  } completion:^(BOOL finished) {
    [UIView animateWithDuration:growDuration animations:^{
        
        
        sleep(2);
        [weakSelf.iconImageView stopAnimating];
        [weakSelf.iconImageView setImage:[self.icons objectAtIndex:13]];
        weakSelf.alpha = 0;
    } completion:^(BOOL finished) {
        
      //  [weakSelf.iconImageView setImage:[self.icons objectAtIndex:8]];
      [weakSelf removeFromSuperview];
    }];
      
    
  }];
   // weakSelf.alpha = 0;
}


#pragma mark - property getters

- (CGSize)iconStartSize
{
  if (!_iconStartSize.height) {
    _iconStartSize = CGSizeMake(60, 60);
  }
  return _iconStartSize;
}

- (CGFloat)animationDuration
{
  if (!_animationDuration) {
    _animationDuration = 1.2f;
  }
  return _animationDuration;
}

- (UIColor *)iconColor
{
  if (!_iconColor) {
    _iconColor = [UIColor whiteColor];
  }
  return _iconColor;
}



@end
