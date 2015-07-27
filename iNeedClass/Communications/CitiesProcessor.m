//
//  CitiesProcessor.m
//  iNeedClass
//
//  Created by injevm on 24/7/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import "CitiesProcessor.h"
#import "CoreDataDAO.h"
#import "City.h"
#import "State.h"
#import "Country.h"


@interface CitiesProcessor () {
    
    CoreDataDAO *coreDataDAO;
}

@property (nonatomic, strong) NSDictionary *allarray;

@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) NSArray *states;
@property (nonatomic, strong) NSArray *countries;

@end

@implementation CitiesProcessor
@synthesize states;
@synthesize cities;
@synthesize countries;

- (id)initWithCities:(NSDictionary *)allArray{
    if (self = [super init]) {
        [self setAllarray:allArray];
        coreDataDAO = [[CoreDataDAO alloc] init];
    }
    
    return self;
}

- (void)execute
{
    states = [_allarray objectForKey:@"provincias"];
    countries = [_allarray objectForKey:@"paises"];
    cities = [_allarray objectForKey:@"ciudades"];
    
    [self parseCities:cities];
    [self parseCountries:countries];
    [self parseStates:states];
}

- (void)parseStates:(NSArray *)provincias{
    for(NSDictionary *provinciaDic in provincias){
        
        BOOL newState = [coreDataDAO findState:[provinciaDic valueForKey:@"idprovincia"]] ? NO : YES;
        
        if (newState){
            
            BOOL addNewState = [coreDataDAO addState:provinciaDic];
            
            if(addNewState){
                NSLog(@"La provincia %@ se ha añadido satisfactoriamente", [provinciaDic valueForKey:@"provincia"]);
            }else{
                NSLog(@"Hubo un error al añadir la provincia %@", [provinciaDic valueForKey:@"provincia"]);
            }
        }
    }
}

- (void)parseCities:(NSArray *)ciudades{
    
    for(NSDictionary *ciudadDic in ciudades){
    
        BOOL newCity = [coreDataDAO findCity:[ciudadDic valueForKey:@"idpoblacion"]] ? NO : YES;
    
        if (newCity){
        
            BOOL addNewCity = [coreDataDAO addCity:ciudadDic];
            
            if(addNewCity){
                NSLog(@"La ciudad %@ se ha añadido satisfactoriamente", [ciudadDic valueForKey:@"poblacion"]);
            }else{
                NSLog(@"Hubo un error al añadir la ciudad %@", [ciudadDic valueForKey:@"poblacion"]);
            }
        }
    }
    /*
     if (message) {
     
     [self broadcastResultForMessage:messageID withSucces:YES andDevelopment:[message development]];
     }
     else {
     
     [self broadcastResultForMessage:messageID withSucces:NO andDevelopment:nil];
     }
     */
    
}

- (void)parseCountries:(NSArray *)paises{
    for(NSDictionary *paisDic in paises){
        
        BOOL newCountry = [coreDataDAO findCountry:[paisDic valueForKey:@"idpais"]] ? NO : YES;
        
        if (newCountry){
            
            BOOL addNewCountry = [coreDataDAO addCountry:paisDic];
            
            if(addNewCountry){
                NSLog(@"El pais %@ se ha añadido satisfactoriamente", [paisDic valueForKey:@"pais"]);
            }else{
                NSLog(@"Hubo un error al añadir el pais %@", [paisDic valueForKey:@"pais"]);
            }
        }
    }
}

- (void)broadcastResultForMessage:(NSString *)idMessage withSucces:(BOOL)success andDevelopment:(NSString *)development
{
   /* NSString *eventName = success ? MessageDetailReceived : FailedMessageDetailReceived;
    
    NSMutableDictionary *eventInfo = [NSMutableDictionary dictionary];
    //    [eventInfo setObject:eventName forKey:EventNameKey];
    [eventInfo setObject:idMessage forKey:MessageIDKey];
    
    if([eventName isEqualToString:MessageDetailReceived])
    {
    
        [eventInfo setObject:development forKey:@"development"];
    }
    
    //    [SITNotificator notifyEvent:eventInfo];
    
    [SITNotificator notifyEvent:eventName withUserInfo:eventInfo];*/
}

@end
