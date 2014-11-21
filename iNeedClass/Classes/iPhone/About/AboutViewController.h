//
//  AboutViewController.h
//  iNeedClass
//
//  Created by Jesus Victorio on 22/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *PrincipalView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property (weak, nonatomic) IBOutlet UILabel *designFreepik;
@property (weak, nonatomic) IBOutlet UILabel *tituloFreepik;
@property (weak, nonatomic) IBOutlet UILabel *byME;
@property (weak, nonatomic) IBOutlet UILabel *agrees;
@property (weak, nonatomic) IBOutlet UILabel *appFriend;
@property (weak, nonatomic) IBOutlet UILabel *appFriendDescription;

- (IBAction)backToHome:(id)sender;

@end
