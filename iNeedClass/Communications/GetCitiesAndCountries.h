//
//  GetCitiesAndCountries.h
//  iNeedClass
//
//  Created by injevm on 24/7/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SITOperation.h"

@interface GetCitiesAndCountries : SITOperation <NSURLConnectionDelegate>

+ (GetCitiesAndCountries *)defaultView:(NSInteger)option;

@end
