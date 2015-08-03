//
//  LoginProcessor.h
//  iNeedClass
//
//  Created by injevm on 3/8/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginProcessor : NSObject

- (id)initWithLogin:(NSDictionary *)user;

- (void)execute;

@end
