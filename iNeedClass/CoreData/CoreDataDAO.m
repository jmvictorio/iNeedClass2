//
//  CoreDataDAO.m
//  iNeedClass
//
//  Created by injevm on 3/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "CoreDataDAO.h"
#import "SITCoreDataManager.h"
#import "ConfigHelper.h"
#import "Utils.h"
#import "SITUtils.h"
#import "SITNotificator.h"
#import "User.h"
#import "Login.h"
#import "Teacher.h"
#import "Exchange.h"
#import "Subject.h"
#import "CategoryType.h"
#import "Country.h"
#import "State.h"
#import "City.h"
#import "CityState.h"
#import <CommonCrypto/CommonDigest.h>

@implementation CoreDataDAO

- (id)init
{
    self = [super init];
    if (self) {
        
        self.context = [[SITCoreDataManager sharedInstance] managedObjectContext];
        
    }
    return self;
}

- (id)initWithContext:(NSManagedObjectContext *)aContext
{
    
    self = [super init];
    if (self) {
        
        self.context = aContext;
    }
    return self;
    
}

- (User *)createUserWithData:(NSDictionary *)userData
{
    __block User *user = nil;
    __block BOOL changesDone = NO;
    
    [self.context performBlockAndWait: ^{
        
        user = [NSEntityDescription insertNewObjectForEntityForName: @"User"
                                                inManagedObjectContext: _context];
        
        for (NSString *field in [userData allKeys]) {
            [user setValue:[userData valueForKey:field] forKey:field];
        }
        
        BOOL changesDone = [self commitChanges]; //[self saveChangesInContext:_context];
        
        if (changesDone)
        {
            
        }////[SitLog debug:@"La tarea %@ ha sido almacenada.", [userData objectForKey:@"id"]];
        
    }];
    
    return changesDone ? user : nil;

}

- (User *)updateUserWithData:(NSDictionary *)userData
{
    NSString *userId = [userData objectForKey:@"id_user"];
    
    __block User *user = [self findUserWithID:userId];
    
    [self.context performBlockAndWait: ^{
        
        if (user)
        {
            for (NSString *field in [userData allKeys])
            {
                [user setValue:[userData valueForKey:field] forKey:field];
            }
            
            BOOL changesDone = [self commitChanges];
            
            if (changesDone){
                ////[SitLog debug:@"el usuario %@ ha sido actualizado.", userId];
            }
        }
        
    }];
    
    return user;
}

- (NSArray *)findAllUserIDs
{
    NSSortDescriptor *sorting = [[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:NO];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    [fetchRequest setPropertiesToFetch:[NSArray arrayWithObjects:@"id_user", nil]];
    [fetchRequest setResultType:NSDictionaryResultType];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sorting, nil]];
    
    __block NSMutableArray *usersID;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        usersID = [NSMutableArray arrayWithCapacity:[fetchedObjects count]];
        
        for (NSDictionary *row in fetchedObjects) {
            [usersID addObject:[row objectForKey:@"id"]];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    
    return usersID;
}

- (User *)findUserWithID:(NSString *)userId
{
    NSPredicate *queryPredicate = [NSPredicate predicateWithFormat:@"id_user = %@", userId];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    [fetchRequest setPredicate:queryPredicate];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block User *user = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
             //[error localizedDescription]];
        }
        
        if ( fetchedObjects != nil && [fetchedObjects count] > 0 ) {
            user = [fetchedObjects objectAtIndex:0];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return user;
}

- (NSSet *)findAllTeachWithID:(NSString *)userId
{
    NSPredicate *queryPredicate = [NSPredicate predicateWithFormat:@"id_user = %@", userId];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Teacher"];
    [fetchRequest setPredicate:queryPredicate];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block NSMutableSet *Teaches = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            NSLog(@"Se ha producido el siguiente error intentando recuperar un mensaje: %@",[error localizedDescription]);
        }
        
        if ( fetchedObjects != nil && [fetchedObjects count] > 0 ) {
            Teaches = [[NSMutableSet alloc]init];
            for(Teacher *teach in fetchedObjects){
                [Teaches addObject:teach];
            }
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return Teaches;
}

- (NSSet *)findAllExchangesWithID:(NSString *)userId
{
    NSPredicate *queryPredicate = [NSPredicate predicateWithFormat:@"id_user = %@", userId];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Exchange"];
    [fetchRequest setPredicate:queryPredicate];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block NSMutableSet *exchanges = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            NSLog(@"Se ha producido el siguiente error intentando recuperar un mensaje: %@", [error localizedDescription]);
        }
        
        if ( fetchedObjects != nil && [fetchedObjects count] > 0 ) {
            exchanges = [[NSMutableSet alloc]init];
            for(Exchange *exchange in fetchedObjects){
                [exchanges addObject:exchange];
            }
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return exchanges;
}

- (BOOL)createLoginWithData:(NSDictionary *)loginData
{
    __block Login *login = nil;
    __block BOOL changesDone = NO;
    
    [self.context performBlockAndWait: ^{
        
        login = [NSEntityDescription insertNewObjectForEntityForName: @"Login"
                                             inManagedObjectContext: _context];
        
        for (NSString *field in [loginData allKeys]) {
            [login setValue:[loginData valueForKey:field] forKey:field];
        }
        
        changesDone = [self commitChanges]; //[self saveChangesInContext:_context];
        
        if (changesDone)
        {
            NSLog(@"FUE BIEN EL LOGIN");
        }else{
            NSLog(@"ERROR EL LOGIN");
        }////[SitLog debug:@"La tarea %@ ha sido almacenada.", [userData objectForKey:@"id"]];
        
    }];
    
    return changesDone;
    
}

- (BOOL)deleteLogin
{
    NSFetchRequest *fetchRequestLogin= [[NSFetchRequest alloc] init];
    [fetchRequestLogin setEntity:[NSEntityDescription entityForName:@"Login" inManagedObjectContext:_context]];
    [fetchRequestLogin setIncludesPropertyValues:NO];
    
    __block BOOL changesDone = NO;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjectsLogin = [_context executeFetchRequest:fetchRequestLogin error:&error];
        
        for (Country *deleteObject in fetchedObjectsLogin)
        {
            [_context deleteObject:deleteObject];
        }
        
        if ([fetchedObjectsLogin count])
        {
            changesDone = [self commitChanges];
        }
        
        if (changesDone)
        {
            NSLog(@"PERFE EL VACIADO DE LOGIN");
            //[SITLog info:@"Se ha vaciado la tabla deleteAllACNotificationDelete: %@",
            //[error localizedDescription]];
        }
        else if ([fetchedObjectsLogin count] > 0)
        {
            NSLog(@"ERROR AL VACIAR LOGIN");
            //[SITLog error:@"Se ha producido el siguiente error en el metodo deleteAllACNotificationDelete: %@",
            //[error localizedDescription]];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return YES;
}

- (BOOL)deleteUser:(NSString *)userId
{
    
    //TODO: REFORMA
    NSFetchRequest *fetchRequestLogin= [[NSFetchRequest alloc] init];
    [fetchRequestLogin setEntity:[NSEntityDescription entityForName:@"User" inManagedObjectContext:_context]];
    [fetchRequestLogin setIncludesPropertyValues:NO];
    
    __block BOOL changesDone = NO;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjectsLogin = [_context executeFetchRequest:fetchRequestLogin error:&error];
        
        for (Country *deleteObject in fetchedObjectsLogin)
        {
            [_context deleteObject:deleteObject];
        }
        
        if ([fetchedObjectsLogin count])
        {
            changesDone = [self commitChanges];
        }
        
        if (changesDone)
        {
            NSLog(@"PERFE EL VACIADO DE LOGIN");
            //[SITLog info:@"Se ha vaciado la tabla deleteAllACNotificationDelete: %@",
            //[error localizedDescription]];
        }
        else if ([fetchedObjectsLogin count] > 0)
        {
            NSLog(@"ERROR AL VACIAR LOGIN");
            //[SITLog error:@"Se ha producido el siguiente error en el metodo deleteAllACNotificationDelete: %@",
            //[error localizedDescription]];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return YES;
}

- (User *)addTeach:(NSDictionary *)teachData toUserId:(NSString *)userId
{
    __block User *user = [self findUserWithID:userId];
    __block Teacher *teach = nil;
    __block NSMutableArray *teaches= nil;
    
    [self.context performBlockAndWait: ^{
        
        
        teaches = [[NSMutableArray alloc] init];
        for (NSDictionary *fileDic in teachData)
        {
            teach = [NSEntityDescription insertNewObjectForEntityForName: @"Teach"
                                                    inManagedObjectContext: _context];
            for (NSString *field in [fileDic allKeys])
            {
                [teach setValue:[fileDic valueForKey:field] forKey:field];
            }
            [teach setValue:[NSString stringWithFormat:@"%@,%@",[fileDic valueForKey:@"creationDate"],[user id_user]] forKey:@"id_teacher"];
            [teach setValue:user forKey:@"user"];
            [teaches addObject:teach];
        }
        
        [user setTeacher_user:[NSSet setWithArray:teaches]];
        BOOL changesDone = [self commitChanges];
        
        if (changesDone)
        {
            ////[SitLog debug:@"La asignatura a enseñar ha sido parseado."];
        }
    }];
    
    return user;
}


- (User *)addExchange:(NSDictionary *)exchangeData toUserId:(NSString *)userId
{
    __block User *user = [self findUserWithID:userId];
    __block Exchange *exchange = nil;
    __block NSMutableArray *exchanges= nil;
    
    [self.context performBlockAndWait: ^{
        
        
        exchanges = [[NSMutableArray alloc] init];
        for (NSDictionary *fileDic in exchangeData)
        {
            exchange = [NSEntityDescription insertNewObjectForEntityForName: @"Exchange"
                                                  inManagedObjectContext: _context];
            for (NSString *field in [fileDic allKeys])
            {
                [exchange setValue:[fileDic valueForKey:field] forKey:field];
            }
            [exchange setValue:[NSString stringWithFormat:@"%@,%@",[fileDic valueForKey:@"creationDate"],[user id_user]] forKey:@"id_exchange"];
            [exchange setValue:user forKey:@"user"];
            [exchanges addObject:exchange];
        }
        
        [user setExchange_user:[NSSet setWithArray:exchanges]];
        BOOL changesDone = [self commitChanges];
        
        if (changesDone) {
            //[SitLog debug:@"La asignatura a enseñar ha sido parseado."];
        }
        
    }];
    
    return user;
}

- (BOOL)addSubject:(NSDictionary *)subjectData
{
    __block Subject *subject = nil;
    __block BOOL changesDone = NO;
    
    [self.context performBlockAndWait: ^{
        
        subject = [NSEntityDescription insertNewObjectForEntityForName: @"Subject"
                                             inManagedObjectContext: _context];
        
        for (NSString *field in [subjectData allKeys]) {
            [subject setValue:[subjectData valueForKey:field] forKey:field];
        }
        
        BOOL changesDone = [self commitChanges]; //[self saveChangesInContext:_context];
        
        if (changesDone)
        {
            NSLog(@"La asignatura %@ ha sido almacenada.", [subjectData objectForKey:@"id_subject"]);
        }
        
    }];
    
    return changesDone;
    
}

- (BOOL)addCategoryType:(NSDictionary *)categoryData
{
    __block CategoryType *category = nil;
    __block BOOL changesDone = NO;
    
    [self.context performBlockAndWait: ^{
        
        category = [NSEntityDescription insertNewObjectForEntityForName: @"CategoryType"
                                                inManagedObjectContext: _context];
        
        for (NSString *field in [categoryData allKeys]) {
            [category setValue:[categoryData valueForKey:field] forKey:field];
        }
        
        BOOL changesDone = [self commitChanges]; //[self saveChangesInContext:_context];
        
        if (changesDone)
        {
            //[SitLog debug:@"La categoria %@ ha sido almacenada.", [categoryData objectForKey:@"id_category"]];
        }
        
    }];
    
    return changesDone;
    
}

- (NSArray *)findAllCategories
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"CategoryType"];
    [fetchRequest setPropertiesToFetch:[NSArray arrayWithObjects:@"id_category", nil]];
    [fetchRequest setResultType:NSDictionaryResultType];
    
    __block NSMutableArray *categoriesID;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        categoriesID = [NSMutableArray arrayWithCapacity:[fetchedObjects count]];
        
        for (NSDictionary *row in fetchedObjects) {
            [categoriesID addObject:[row objectForKey:@"id_category"]];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    
    return categoriesID;
}

- (NSArray *)findAllSubjects:(NSString *)categoryId
{
    NSPredicate *queryPredicate = [NSPredicate predicateWithFormat:@"id_category = %@", categoryId];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Subject"];
    [fetchRequest setPredicate:queryPredicate];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block NSMutableArray *subjects = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar un comentario: %@",
             //[error localizedDescription]];
        }
        
        if ( fetchedObjects != nil && [fetchedObjects count] > 0 ) {
            subjects = [[NSMutableArray alloc]init];
            for(Subject *subjectTemp in fetchedObjects){
                NSMutableDictionary *subject = [[NSMutableDictionary alloc] init];
                [subject setValue:[subjectTemp category] forKey:@"category"];
                [subject setValue:[subjectTemp id_subject] forKey:@"id_subject"];
                [subject setValue:[subjectTemp name] forKey:@"name"];
                [subjects addObject:subject];
            }
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return subjects;
}

- (BOOL)deleteTeach:(NSString *)teachId toUserId:(NSString *)userId
{
    NSManagedObject *userToDelete = [self findUserWithID:userId];
    
    __block BOOL changesDone = NO;
    
    [_context performBlockAndWait: ^{
        
        if(userToDelete)
        {
            User *user = (User *)userToDelete;
            if([user teacher_user]>0){
                for(Teacher *teach in [user teacher_user])
                {
                    if([teach.id_teacher isEqualToString:teachId]){
                        [_context deleteObject:teach];
                    }
                }
            }
            
            changesDone = [self commitChanges];
        }
        
        if (changesDone)
        {
            //[SitLog info:@"El usuario %@ ha sido eliminado.", userId];
        }
        else
        {
            if (userToDelete == nil)
            {
                //[SitLog warning:@"El usuario %@ no ha podido ser eliminado porque no esta en la bd.", userId];
            }
            else
            {
                //[SitLog warning:@"El usuario %@ esta en la bd pero no ha podido ser eliminado.", userId];
                
            }
        }
        
    }];
    
    return changesDone;
}

- (BOOL)deleteExchange:(NSString *)exchangeId toUserId:(NSString *)userId
{
    NSManagedObject *userToDelete = [self findUserWithID:userId];
    
    __block BOOL changesDone = NO;
    
    [_context performBlockAndWait: ^{
        
        if(userToDelete)
        {
            User *user = (User *)userToDelete;
            if([user exchange_user]>0){
                for(Exchange *exchange in [user exchange_user])
                {
                    if([exchange.id_exchange isEqualToString:exchangeId]){
                        [_context deleteObject:exchange];
                    }
                }
            }
            
            changesDone = [self commitChanges];
        }
        
        if (changesDone)
        {
            //[SitLog info:@"El usuario %@ ha sido eliminado.", userId];
        }
        else
        {
            if (userToDelete == nil)
            {
                //[SitLog warning:@"El usuario %@ no ha podido ser eliminado porque no esta en la bd.", userId];
            }
            else
            {
                //[SitLog warning:@"El usuario %@ esta en la bd pero no ha podido ser eliminado.", userId];
                
            }
        }
        
    }];
    
    return changesDone;
}


/**
 
 BD de todas las ciudades y provincias ACTUALES
 
 */

- (BOOL)addCountry:(NSDictionary *)country{
    
    __block BOOL changesDone = NO;
    __block Country *pais = nil;
    
    [self.context performBlockAndWait: ^{
        
        pais = [NSEntityDescription insertNewObjectForEntityForName: @"Country"
                                             inManagedObjectContext: _context];
        
        for (NSString *field in [country allKeys]) {
            [pais setValue:[country valueForKey:field] forKey:field];
        }
        changesDone = [self commitChanges];
        
        if (changesDone) NSLog(@"se ha insertado la pronvincia: %@", [pais name]);
        
        
    }];
    return YES;
}

- (BOOL)addState:(NSDictionary *)state{
    
    __block BOOL changesDone = NO;
    __block State *stat = nil;
    
    [self.context performBlockAndWait: ^{
        
        
        stat = [NSEntityDescription insertNewObjectForEntityForName: @"State"
                                             inManagedObjectContext: _context];
        
        for (NSString *field in [state allKeys]) {
            [stat setValue:[state valueForKey:field] forKey:field];
        }
        
        changesDone = [self commitChanges];
        
        if (changesDone) NSLog(@"se ha insertado la pronvincia: %@", [stat name]);
        
        
    }];
    return YES;
}

- (BOOL)addCity:(NSDictionary *)city{
    
    __block BOOL changesDone = NO;
    __block City *ciudad = nil;
    
    [self.context performBlockAndWait: ^{
        
        
        ciudad = [NSEntityDescription insertNewObjectForEntityForName: @"City"
                                               inManagedObjectContext: _context];
        
        for (NSString *field in [city allKeys]) {
            [ciudad setValue:[city valueForKey:field] forKey:field];
        }
        
        changesDone = [self commitChanges];
        
        if (changesDone) NSLog(@"Se ha insertado la ciudad: %@", [ciudad name]);
        
        
    }];
    return YES;
}

//Retorna todas las categorias persistidas.
- (NSArray *)findAllStates{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"State"];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block NSMutableArray *provincias = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        provincias = [[NSMutableArray alloc] initWithArray:fetchedObjects];
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return provincias;
}

- (void)prepareInsertStates{
    NSArray *arrayCiudades = [self findAllCities];
    NSArray *arrayProvincias = [self findAllStates];
    
    for(NSManagedObject *ciudad in arrayCiudades){
        NSArray *keys = [[[ciudad entity] attributesByName] allKeys];
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[ciudad dictionaryWithValuesForKeys:keys]];
        
        NSString *attributeProvincia = @"id_state";
        NSString *attributeValue = [dict valueForKey:@"id_state"];
        NSPredicate *predicatePoblacion = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", attributeProvincia, attributeValue];//keySelected is NSString itself
        NSArray *poblaciones = [NSMutableArray arrayWithArray:[arrayProvincias filteredArrayUsingPredicate:predicatePoblacion]];
        
        [dict setValue:[[poblaciones objectAtIndex:0] valueForKey:@"name"] forKey:@"provincia"];
        
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%@, %@", [dict valueForKey:@"name"], [dict valueForKey:@"provincia"]], @"name", [dict valueForKey:@"id_city"], @"id_city", nil];
        
        [self insertCityStates:dictionary];
    }
}

- (BOOL)insertCityStates:(NSDictionary *)dict{
    
    __block BOOL changesDone = NO;
    __block CityState *ciudad = nil;
    
    [self.context performBlockAndWait: ^{
        
        
        ciudad = [NSEntityDescription insertNewObjectForEntityForName: @"CityState"
                                               inManagedObjectContext: _context];
        
        [ciudad setValue:[dict valueForKey:@"name"] forKey:@"name"];
        [ciudad setValue:[dict valueForKey:@"id_city"] forKey:@"id_city"];
        
        changesDone = [self commitChanges];
        
        if (changesDone) NSLog(@"Se ha insertado la CityState: %@", [ciudad name]);
        
        
    }];
    return YES;
}

- (NSArray *)findAllCitiesStates{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"CityState"];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block NSMutableArray *ciudades = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        ciudades = [[NSMutableArray alloc] initWithArray:fetchedObjects];
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return ciudades;
}

//Retorna todas las categorias persistidas.
- (NSArray *)findAllCities{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block NSMutableArray *ciudades = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        ciudades = [[NSMutableArray alloc] initWithArray:fetchedObjects];
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return ciudades;
}

- (City *)findCity:(NSString *)city
{
    NSPredicate *queryPredicate = [NSPredicate predicateWithFormat:@"id_city = %@", city];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    [fetchRequest setPredicate:queryPredicate];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block City *ciudad = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        if ( fetchedObjects != nil && [fetchedObjects count] > 0 ) {
            ciudad = [fetchedObjects objectAtIndex:0];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return ciudad;
}

- (Country *)findCountry:(NSString *)country
{
    NSPredicate *queryPredicate = [NSPredicate predicateWithFormat:@"id_country = %@", country];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Country"];
    [fetchRequest setPredicate:queryPredicate];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block Country *pais = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        if ( fetchedObjects != nil && [fetchedObjects count] > 0 ) {
            pais = [fetchedObjects objectAtIndex:0];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return pais;
}

- (State *)findState:(NSString *)state
{
    NSPredicate *queryPredicate = [NSPredicate predicateWithFormat:@"id_state = %@", state];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"State"];
    [fetchRequest setPredicate:queryPredicate];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block State *provincia = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        if ( fetchedObjects != nil && [fetchedObjects count] > 0 ) {
            provincia = [fetchedObjects objectAtIndex:0];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return provincia;
}

// Elimina el intercambio del dispositivo
- (BOOL)deleteAllCities{
    NSFetchRequest *fetchRequestCountry = [[NSFetchRequest alloc] init];
    [fetchRequestCountry setEntity:[NSEntityDescription entityForName:@"Country" inManagedObjectContext:_context]];
    [fetchRequestCountry setIncludesPropertyValues:NO];
    
    NSFetchRequest *fetchRequestCities = [[NSFetchRequest alloc] init];
    [fetchRequestCities setEntity:[NSEntityDescription entityForName:@"City" inManagedObjectContext:_context]];
    [fetchRequestCities setIncludesPropertyValues:NO];
    
    NSFetchRequest *fetchRequestStates= [[NSFetchRequest alloc] init];
    [fetchRequestStates setEntity:[NSEntityDescription entityForName:@"State" inManagedObjectContext:_context]];
    [fetchRequestStates setIncludesPropertyValues:NO];
    
    __block BOOL changesDone = NO;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjectsCountry = [_context executeFetchRequest:fetchRequestCountry error:&error];
        NSArray *fetchedObjectsCity = [_context executeFetchRequest:fetchRequestCities error:&error];
        NSArray *fetchedObjectsState = [_context executeFetchRequest:fetchRequestStates error:&error];
        
        for (Country *deleteObject in fetchedObjectsCountry)
        {
            [_context deleteObject:deleteObject];
        }
        for (City *deleteObject in fetchedObjectsCity)
        {
            [_context deleteObject:deleteObject];
        }
        for (State *deleteObject in fetchedObjectsState)
        {
            [_context deleteObject:deleteObject];
        }
        
        if ([fetchedObjectsCountry count])
        {
            changesDone = [self commitChanges];
        }
        
        if (changesDone)
        {
            NSLog(@"PERFE EL VACIADO DE CIUDADES");
            //[SITLog info:@"Se ha vaciado la tabla deleteAllACNotificationDelete: %@",
            //[error localizedDescription]];
        }
        else if ([fetchedObjectsCountry count] > 0)
        {
            NSLog(@"ERROR AL VACIAR LAS CIUDADES");
            //[SITLog error:@"Se ha producido el siguiente error en el metodo deleteAllACNotificationDelete: %@",
            //[error localizedDescription]];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return YES;
}

/**
 
 BD de todas las ciudades y provincias
 
 */

- (BOOL)addCountryAll:(NSDictionary *)country{
    
    __block BOOL changesDone = NO;
    __block Country *pais = nil;
    
    [self.context performBlockAndWait: ^{
        
        pais = [NSEntityDescription insertNewObjectForEntityForName: @"CountryAll"
                                                inManagedObjectContext: _context];
        
        for (NSString *field in [country allKeys]) {
            [pais setValue:[country valueForKey:field] forKey:field];
        }
        changesDone = [self commitChanges];
        
        if (changesDone) NSLog(@"se ha insertado la pronvincia: %@", [pais name]);
        
        
    }];
    return YES;
}

- (BOOL)addStateAll:(NSDictionary *)state{
    
    __block BOOL changesDone = NO;
    __block State *stat = nil;
    
    [self.context performBlockAndWait: ^{
        
        
        stat = [NSEntityDescription insertNewObjectForEntityForName: @"StateAll"
                                                inManagedObjectContext: _context];
        
        for (NSString *field in [state allKeys]) {
            [stat setValue:[state valueForKey:field] forKey:field];
        }

        changesDone = [self commitChanges];
        
        if (changesDone) NSLog(@"se ha insertado la pronvincia: %@", [stat name]);
        
        
    }];
    return YES;
}

- (BOOL)addCityAll:(NSDictionary *)city{
    
    __block BOOL changesDone = NO;
    __block City *ciudad = nil;
    
    [self.context performBlockAndWait: ^{
        
        
        ciudad = [NSEntityDescription insertNewObjectForEntityForName: @"CityAll"
                                                    inManagedObjectContext: _context];
        
        for (NSString *field in [city allKeys]) {
            [ciudad setValue:[city valueForKey:field] forKey:field];
        }
        
        changesDone = [self commitChanges];
        
        if (changesDone) NSLog(@"Se ha insertado la ciudad: %@", [ciudad name]);
        
        
    }];
    return YES;
}

//Retorna todas las categorias persistidas.
- (NSArray *)findAllStatesAll{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"StateAll"];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block NSMutableArray *provincias = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        provincias = [[NSMutableArray alloc] initWithArray:fetchedObjects];
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return provincias;
}

- (void)prepareInsertStatesAll{
    NSArray *arrayCiudades = [self findAllCities];
    NSArray *arrayProvincias = [self findAllStates];
    
    for(NSManagedObject *ciudad in arrayCiudades){
        NSArray *keys = [[[ciudad entity] attributesByName] allKeys];
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[ciudad dictionaryWithValuesForKeys:keys]];
        
        NSString *attributeProvincia = @"id_state";
        NSString *attributeValue = [dict valueForKey:@"id_state"];
        NSPredicate *predicatePoblacion = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", attributeProvincia, attributeValue];//keySelected is NSString itself
        NSArray *poblaciones = [NSMutableArray arrayWithArray:[arrayProvincias filteredArrayUsingPredicate:predicatePoblacion]];
        
        [dict setValue:[[poblaciones objectAtIndex:0] valueForKey:@"name"] forKey:@"provincia"];
        
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%@, %@", [dict valueForKey:@"name"], [dict valueForKey:@"provincia"]], @"name", nil];
  
        [self insertCityStates:dictionary];
    }
}

- (BOOL)insertCityStatesAll:(NSDictionary *)dict{
    
    __block BOOL changesDone = NO;
    __block CityState *ciudad = nil;
    
    [self.context performBlockAndWait: ^{
        
        
        ciudad = [NSEntityDescription insertNewObjectForEntityForName: @"CityStateAll"
                                               inManagedObjectContext: _context];
        
        [ciudad setValue:[dict valueForKey:@"name"] forKey:@"name"];
        
        changesDone = [self commitChanges];
        
        if (changesDone) NSLog(@"Se ha insertado la CityState: %@", [ciudad name]);
        
        
    }];
    return YES;
}

- (NSArray *)findAllCitiesStatesAll{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"CityStateAll"];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block NSMutableArray *ciudades = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        ciudades = [[NSMutableArray alloc] initWithArray:fetchedObjects];
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return ciudades;
}

//Retorna todas las categorias persistidas.
- (NSArray *)findAllCitiesAll{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"CityAll"];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block NSMutableArray *ciudades = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        ciudades = [[NSMutableArray alloc] initWithArray:fetchedObjects];
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return ciudades;
}

- (City *)findCityAll:(NSString *)city
{
    NSPredicate *queryPredicate = [NSPredicate predicateWithFormat:@"id_city = %@", city];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"CityAll"];
    [fetchRequest setPredicate:queryPredicate];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block City *ciudad = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        if ( fetchedObjects != nil && [fetchedObjects count] > 0 ) {
            ciudad = [fetchedObjects objectAtIndex:0];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return ciudad;
}

- (Country *)findCountryAll:(NSString *)country
{
    NSPredicate *queryPredicate = [NSPredicate predicateWithFormat:@"id_country = %@", country];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"CountryAll"];
    [fetchRequest setPredicate:queryPredicate];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block Country *pais = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        if ( fetchedObjects != nil && [fetchedObjects count] > 0 ) {
            pais = [fetchedObjects objectAtIndex:0];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return pais;
}

- (State *)findStateAll:(NSString *)state
{
    NSPredicate *queryPredicate = [NSPredicate predicateWithFormat:@"id_state = %@", state];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"StateAll"];
    [fetchRequest setPredicate:queryPredicate];
    [fetchRequest setReturnsDistinctResults:YES];
    
    __block State *provincia = nil;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjects = [_context executeFetchRequest:fetchRequest error:&error];
        
        if (error)
        {
            //[SitLog error:@"Se ha producido el siguiente error intentando recuperar el usuario: %@",
            //[error localizedDescription]];
        }
        
        if ( fetchedObjects != nil && [fetchedObjects count] > 0 ) {
            provincia = [fetchedObjects objectAtIndex:0];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }
    
    return provincia;
}

// Elimina el intercambio del dispositivo
- (BOOL)deleteAllCitiesAll{
    NSFetchRequest *fetchRequestCountry = [[NSFetchRequest alloc] init];
    [fetchRequestCountry setEntity:[NSEntityDescription entityForName:@"CountryAll" inManagedObjectContext:_context]];
    [fetchRequestCountry setIncludesPropertyValues:NO];
    
    NSFetchRequest *fetchRequestCities = [[NSFetchRequest alloc] init];
    [fetchRequestCities setEntity:[NSEntityDescription entityForName:@"CityAll" inManagedObjectContext:_context]];
    [fetchRequestCities setIncludesPropertyValues:NO];
    
    NSFetchRequest *fetchRequestStates= [[NSFetchRequest alloc] init];
    [fetchRequestStates setEntity:[NSEntityDescription entityForName:@"StateAll" inManagedObjectContext:_context]];
    [fetchRequestStates setIncludesPropertyValues:NO];
    
    __block BOOL changesDone = NO;
    
    void (^doSearch)(void) = ^{
        
        NSError *error = nil;
        NSArray *fetchedObjectsCountry = [_context executeFetchRequest:fetchRequestCountry error:&error];
        NSArray *fetchedObjectsCity = [_context executeFetchRequest:fetchRequestCities error:&error];
        NSArray *fetchedObjectsState = [_context executeFetchRequest:fetchRequestStates error:&error];
        
        for (Country *deleteObject in fetchedObjectsCountry)
        {
            [_context deleteObject:deleteObject];
        }
        for (City *deleteObject in fetchedObjectsCity)
        {
            [_context deleteObject:deleteObject];
        }
        for (State *deleteObject in fetchedObjectsState)
        {
            [_context deleteObject:deleteObject];
        }
        
        if ([fetchedObjectsCountry count])
        {
            changesDone = [self commitChanges];
        }
        
        if (changesDone)
        {
            NSLog(@"PERFE EL VACIADO DE CIUDADES");
            //[SITLog info:@"Se ha vaciado la tabla deleteAllACNotificationDelete: %@",
             //[error localizedDescription]];
        }
        else if ([fetchedObjectsCountry count] > 0)
        {
            NSLog(@"ERROR AL VACIAR LAS CIUDADES");
            //[SITLog error:@"Se ha producido el siguiente error en el metodo deleteAllACNotificationDelete: %@",
             //[error localizedDescription]];
        }
        
    };
    
    if ([NSThread isMainThread]) {
        doSearch();
    }
    else {
        [_context performBlockAndWait:doSearch];
    }

    return YES;
}

#pragma mark - SAVE CONTEXT

/**
 Persiste los cambios sobre el contexto asociado.
 
 @return YES si los cambios han sido almacenados correctamente en la BD. NO e.o.c.
 */
- (BOOL)commitChanges
{
    NSError *error = nil;
    __block BOOL recordSaved = NO;
    
    if ( ![_context save:&error] ) {
         NSLog(@"Ocurrio el siguiente fallo al persistir cambios en la BD: %@", [error localizedDescription]);
    }
    
    // Si la solicitud se hizo desde un hilo de trabajo, persistir cambios en el contexto principal de aplicacion
    if (![NSThread isMainThread]) {
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            NSManagedObjectContext *mainContext   = [[SITCoreDataManager sharedInstance] mainContext];
            
            NSError *error = nil;
            recordSaved = [mainContext save:&error];
            
            if (error) {
                
                NSString *errorMsg = [NSString stringWithFormat:
                                      @"Error on EntityManager.createRecordForEntity:withValues:inContext:\n"
                                      @"Descripción: %@\n",
                                      [error description]];
                
                NSLog(@"ERROR: %@",errorMsg);
            }
            
        });
    }
    
    return error == nil ? YES : NO;
}

#pragma mark - Metodos privados

// Guarda los cambios en el contexto pasado como parametro
- (BOOL)saveChangesInContext:(NSManagedObjectContext *)context
{
    if (![NSThread isMainThread]) {
        
        [context performBlockAndWait: ^{
            
            NSError *error = nil;
            
            [_context save:&error];
            
            if (error) {
                NSLog(@"Error almacenando contexto: %@", error.description);
            }
        }];
    }
    
    
    __block BOOL changesSaved = NO;
    
    dispatch_block_t saveParentContextBlock = ^{
        
        NSError *error = nil;
        NSString *failureMsg = nil;
        NSManagedObjectContext *mainContext = [[SITCoreDataManager sharedInstance] mainContext];
        
        @try {
            
            changesSaved = [mainContext save: &error];
            
        }
        @catch (NSException *exception) {
            
            failureMsg = [NSString stringWithFormat:
                          @"Exception on EntityManager.saveChangesInContext:\n"
                          @"Descripción: %@\n"
                          @"Cambios almacenados: %@\n",
                          [exception description], (changesSaved ? @"SI" : @"NO")];
        }
        
        if (error != nil) {
            
            failureMsg = [NSString stringWithFormat:
                          @"Error on CoreDataManager.saveChangesInContext:\n"
                          @"Descripción: %@\n"
                          @"Cambios almacenados: %@\n",
                          [error description], (changesSaved ? @"SI" : @"NO")];
        }
        
        if (failureMsg) {
            NSLog(@"EROOR: %@", failureMsg);
        }
    };
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    //dispatch_get_current_queue() == mainQueue
    if ([NSThread isMainThread]) {
        
        saveParentContextBlock();
    }
    else {
        
        dispatch_sync(mainQueue, saveParentContextBlock);
    }
    
    return changesSaved;
}


- (NSPersistentStoreCoordinator *)resetPersistentStore {
    NSError *error = nil;
    
    [self.context reset];
    [self.context lock];
    
    // FIXME: dirty. If there are many stores...
    NSPersistentStore *store = [[[[SITCoreDataManager sharedInstance] persistentStoreCoordinator]persistentStores] lastObject];
    
    [[[SITCoreDataManager sharedInstance] persistentStoreCoordinator] removePersistentStore:store error:&error];
    
    if (error) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    // Delete file
    if ([[NSFileManager defaultManager] fileExistsAtPath:store.URL.path]) {
        
        [[NSFileManager defaultManager] removeItemAtPath:store.URL.path error:&error];
        
        if (error) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    
    // Delete the reference to non-existing store
    
    NSPersistentStoreCoordinator *r = [[SITCoreDataManager sharedInstance] persistentStoreCoordinator];
    [self.context unlock];
    
    return r;
}



@end
