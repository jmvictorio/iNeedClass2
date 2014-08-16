//
//  Teacher.h
//  iNeedClass
//
//  Created by Jesus Victorio on 15/08/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Subject, User;

@interface Teacher : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * comments;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * id_teacher;
@property (nonatomic, retain) NSString * id_user;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) Subject *subject_teacher;
@property (nonatomic, retain) User *user_teacher;

@end
