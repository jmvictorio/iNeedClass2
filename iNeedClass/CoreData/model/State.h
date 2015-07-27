//
//  State.h
//  iNeedClass
//
//  Created by injevm on 23/7/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class City, Country;

@interface State : NSManagedObject

@property (nonatomic, retain) NSString * id_country;
@property (nonatomic, retain) NSString * id_state;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * name3;
@property (nonatomic, retain) NSSet *city_state;
@property (nonatomic, retain) Country *country_state;
@end

@interface State (CoreDataGeneratedAccessors)

- (void)addCity_stateObject:(City *)value;
- (void)removeCity_stateObject:(City *)value;
- (void)addCity_state:(NSSet *)values;
- (void)removeCity_state:(NSSet *)values;

@end
