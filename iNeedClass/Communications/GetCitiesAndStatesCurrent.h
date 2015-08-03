//
//  GetCitiesAndStatesCurrent.h
//  iNeedClass
//
//  Created by injevm on 31/7/15.
//  Copyright © 2015 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SITOperation.h"

@interface GetCitiesAndStatesCurrent : SITOperation <NSURLConnectionDelegate>

+ (GetCitiesAndStatesCurrent *)defaultView:(NSInteger)option;

@end
