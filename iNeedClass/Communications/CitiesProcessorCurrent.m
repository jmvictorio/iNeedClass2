//
//  CitiesProcessorCurrent.m
//  iNeedClass
//
//  Created by injevm on 24/7/15.
//  Copyright (c) 2015 Jesus Victorio. All rights reserved.
//

#import "CitiesProcessorCurrent.h"
#import "CoreDataDAO.h"
#import "City.h"
#import "State.h"
#import "Country.h"


@interface CitiesProcessorCurrent () {
    
    CoreDataDAO *coreDataDAO;
}

@property (nonatomic, strong) NSDictionary *allarray;

@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) NSArray *states;
@property (nonatomic, strong) NSArray *countries;

@end

@implementation CitiesProcessorCurrent
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
    cities = [_allarray objectForKey:@"poblaciones"];
    
    if(states){
        [self parseStates:states];
    }
    if(countries){
        
        [self parseCountries:countries];
    }
    if(cities){
        [coreDataDAO deleteAllCities];
        [self parseCities:cities];
    }
}

- (void)parseStates:(NSArray *)provincias{
    for(NSDictionary *provinciaDic in provincias){
        
        BOOL newState = [coreDataDAO findState:[provinciaDic valueForKey:@"id_state"]] ? NO : YES;
        
        if (newState){
            
            BOOL addNewState = [coreDataDAO addState:provinciaDic];
            
            [SITNotificator notifyEvent:UpdateProgress withUserInfo:nil];
            
            if(addNewState){
                //NSLog(@"La provincia %@ se ha añadido satisfactoriamente", [provinciaDic valueForKey:@"name"]);
            }else{
                NSLog(@"Hubo un error al añadir la provincia %@", [provinciaDic valueForKey:@"name"]);
            }
        }
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"cities"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [SITNotificator notifyEvent:FinishStates withUserInfo:nil];
}

- (void)parseCities:(NSArray *)ciudades{
    
    for(NSDictionary *ciudadDic in ciudades){
        
        BOOL newCity = [coreDataDAO findCity:[ciudadDic valueForKey:@"id_city"]] ? NO : YES;
        
        if (newCity){
            
            BOOL addNewCity = [coreDataDAO addCity:ciudadDic];
            
            [SITNotificator notifyEvent:UpdateProgress withUserInfo:nil];
            
            if(addNewCity){
                //NSLog(@"La ciudad %@ se ha añadido satisfactoriamente", [ciudadDic valueForKey:@"name"]);
            }else{
                NSLog(@"Hubo un error al añadir la ciudad %@", [ciudadDic valueForKey:@"name"]);
            }
        }
    }
    [SITNotificator notifyEvent:EndProgress withUserInfo:nil];
}

- (void)parseCountries:(NSArray *)paises{
    for(NSDictionary *paisDic in paises){
        
        BOOL newCountry = [coreDataDAO findCountry:[paisDic valueForKey:@"id_country"]] ? NO : YES;
        
        if (newCountry){
            
            BOOL addNewCountry = [coreDataDAO addCountry:paisDic];
            
            if(addNewCountry){
                NSLog(@"El pais %@ se ha añadido satisfactoriamente", [paisDic valueForKey:@"name"]);
            }else{
                NSLog(@"Hubo un error al añadir el pais %@", [paisDic valueForKey:@"name"]);
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
