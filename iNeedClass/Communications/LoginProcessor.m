//
//  LoginProcessor.m
//  iNeedClass
//
//  Created by injevm on 3/8/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import "LoginProcessor.h"
#import "CoreDataDAO.h"

@interface LoginProcessor () {
    
    CoreDataDAO *coreDataDAO;
}

@property (nonatomic, strong) NSDictionary *user;

@end

@implementation LoginProcessor

- (id)initWithLogin:(NSDictionary *)user{
    if (self = [super init]) {
        [self setUser:user];
        coreDataDAO = [[CoreDataDAO alloc] init];
    }
    
    return self;
}

- (void)execute
{
    [coreDataDAO deleteLogin];
    
    BOOL addNewState = [coreDataDAO createLoginWithData:self.user];
        
    if(addNewState){
        //NSLog(@"La provincia %@ se ha añadido satisfactoriamente", [provinciaDic valueForKey:@"name"]);
    }else{
        NSLog(@"Hubo un error en el login de: %@", [self.user valueForKey:@"mail"]);
    }
    
    [SITNotificator notifyEvent:FinishStates withUserInfo:nil];

}

@end
