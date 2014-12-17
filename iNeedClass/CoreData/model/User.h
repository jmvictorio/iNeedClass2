//
//  User.h
//  iNeedClass
//
//  Created by injevm on 6/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exchange, Login, Teacher;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * age;
@property (nonatomic, retain) NSNumber * genre;
@property (nonatomic, retain) NSString * id_login;
@property (nonatomic, retain) NSString * id_user;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * picture;
@property (nonatomic, retain) NSString * tel;
@property (nonatomic, retain) NSString * valoration;
@property (nonatomic, retain) NSSet *exchange_user;
@property (nonatomic, retain) Login *login_user;
@property (nonatomic, retain) NSSet *teacher_user;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addExchange_userObject:(Exchange *)value;
- (void)removeExchange_userObject:(Exchange *)value;
- (void)addExchange_user:(NSSet *)values;
- (void)removeExchange_user:(NSSet *)values;

- (void)addTeacher_userObject:(Teacher *)value;
- (void)removeTeacher_userObject:(Teacher *)value;
- (void)addTeacher_user:(NSSet *)values;
- (void)removeTeacher_user:(NSSet *)values;

@end
