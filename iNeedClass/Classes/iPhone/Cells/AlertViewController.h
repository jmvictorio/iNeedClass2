//
//  AlertViewController.h
//  iNeedClass
//
//  Created by injevm on 24/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AlertViewController;

typedef void(^ActionHandler)(AlertViewController *view);

@interface AlertViewController : UIView <UITextFieldDelegate>

@property (nonatomic, copy) ActionHandler dismissHandler;

+ (AlertViewController *)defaultView:(NSInteger)option;

@end
