//
//  SITURLConnectionOperation.h
//  SITUtils
//
//  Created by UEGMOBILE on 07/08/14.
//  Copyright (c) 2014 abengoa. All rights reserved.
//

#import "SITOperation.h"

@interface SITURLConnectionOperation : SITOperation <NSURLConnectionDelegate>

@property (nonatomic, strong) NSString *userAuth;
@property (nonatomic, strong) NSString *passwordAuth;

- (void)requestWithURL:(NSString *)URL;

@end
