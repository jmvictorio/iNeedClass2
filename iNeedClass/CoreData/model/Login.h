//
//  Login.h
//  iNeedClass
//
//  Created by Jesus Victorio on 15/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Login : NSManagedObject

@property (nonatomic, retain) NSString * id_user;
@property (nonatomic, retain) NSString * mail;
@property (nonatomic, retain) NSString * pass;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) User *user_login;

@end