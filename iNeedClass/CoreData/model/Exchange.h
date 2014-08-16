//
//  Exchange.h
//  iNeedClass
//
//  Created by Jesus Victorio on 15/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Subject, User;

@interface Exchange : NSManagedObject

@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * comments;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * id_subject1;
@property (nonatomic, retain) NSString * id_subject2;
@property (nonatomic, retain) NSString * id_user;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Subject *subject_exchange;
@property (nonatomic, retain) User *user_exchange;

@end
