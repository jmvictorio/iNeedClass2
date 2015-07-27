//
//  City.h
//  iNeedClass
//
//  Created by injevm on 23/7/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class State;

@interface City : NSManagedObject

@property (nonatomic, retain) NSString * id_city;
@property (nonatomic, retain) NSString * id_state;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * postal;
@property (nonatomic, retain) NSString * latitud;
@property (nonatomic, retain) NSString * longitud;
@property (nonatomic, retain) State *state_city;

@end
