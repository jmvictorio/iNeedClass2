//
//  ProfileViewController.h
//  iNeedClass
//
//  Created by injevm on 21/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController <FBLoginViewDelegate, UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *containerProfile;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *imageFB;
@property (weak, nonatomic) IBOutlet UIButton *valorationButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *numberClassLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberExchangeLabel;

@property (weak, nonatomic) IBOutlet UITabBar *menuTabOptions;
@property (weak, nonatomic) IBOutlet UITabBarItem *classItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *exchangeItem;

@end
