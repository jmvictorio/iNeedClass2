//
//  Category.h
//  iNeedClass
//
//  Created by injevm on 6/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Subject;

@interface CategoryType : NSManagedObject

@property (nonatomic, retain) NSString * id_category;
@property (nonatomic, retain) NSString * id_subcategory;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * subcategory;
@property (nonatomic, retain) Subject *subject_category;

@end
