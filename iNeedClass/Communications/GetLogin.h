//
//  GetLogin.h
//  iNeedClass
//
//  Created by injevm on 3/8/15.
//  Copyright © 2015 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SITOperation.h"

@interface GetLogin : SITOperation <NSURLConnectionDelegate>

+ (GetLogin *)defaultView:(NSDictionary *)user;

@property (nonatomic, strong)NSString *mail;
@property (nonatomic, strong)NSString *pass;

@end
