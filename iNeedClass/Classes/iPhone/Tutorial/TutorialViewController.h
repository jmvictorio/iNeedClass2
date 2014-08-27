//
//  TutorialViewController.h
//  iNeedClass
//
//  Created by Jesus Victorio on 22/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *buttonLogin;
@property (weak, nonatomic) IBOutlet UIButton *butonSign;
- (IBAction)loginAction:(id)sender;
- (IBAction)signAction:(id)sender;

@end
