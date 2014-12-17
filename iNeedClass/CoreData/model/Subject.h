//
//  Subject.h
//  iNeedClass
//
//  Created by injevm on 6/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CategoryType, Exchange, Teacher;

@interface Subject : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * id_subject;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) CategoryType *category_subject;
@property (nonatomic, retain) Exchange *exchange_subject;
@property (nonatomic, retain) Teacher *teacher_subject;

@end
