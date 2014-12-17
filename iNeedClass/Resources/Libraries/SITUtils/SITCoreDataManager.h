//
//  CoreDataManager.h
//  AccionComercial
//
//  Created by UEGMOBILE on 12/05/14.
//  Copyright (c) 2014 ABENGOA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SITCoreDataManager : NSObject

// Devuelve la instancia compartida de CoreDataManager
+ (SITCoreDataManager *)sharedInstance;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// Contexto asociado al hilo principal
@property (nonatomic, strong) NSManagedObjectContext *mainContext;


// Devuelve un contexto sobre el que realizar las operaciones
- (NSManagedObjectContext *)managedObjectContext;

@end

