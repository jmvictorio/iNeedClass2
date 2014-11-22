//
//  MenuViewController.h
//  iNeedClass
//
//  Created by Jesus Victorio on 16/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuDelegate

@required

- (void)didMenuItemSelected:(NSUInteger)indexMenuItem;

@end

@interface MenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

- (IBAction)openProfile:(id)sender;
- (id)initMenuWithDelegate:(id<MenuDelegate>)delegate;

@end
