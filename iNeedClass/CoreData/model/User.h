//
//  User.h
//  iNeedClass
//
//  Created by Jesus Victorio on 15/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exchange, Login, Teacher;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * age;
@property (nonatomic, retain) NSNumber * genre;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * picture;
@property (nonatomic, retain) NSString * tel;
@property (nonatomic, retain) NSString *id_login;
@property (nonatomic, retain) Exchange *exchange_user;
@property (nonatomic, retain) Teacher *teacher_user;
@property (nonatomic, retain) Login *login_user;

@end
