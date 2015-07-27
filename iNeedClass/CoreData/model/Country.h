//
//  Country.h
//  iNeedClass
//
//  Created by injevm on 23/7/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class State;

@interface Country : NSManagedObject

@property (nonatomic, retain) NSString * id_country;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *state_country;
@end

@interface Country (CoreDataGeneratedAccessors)

- (void)addState_countryObject:(State *)value;
- (void)removeState_countryObject:(State *)value;
- (void)addState_country:(NSSet *)values;
- (void)removeState_country:(NSSet *)values;

@end
