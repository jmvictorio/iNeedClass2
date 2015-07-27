//
//  CoreDataDAO.h
//  iNeedClass
//
//  Created by injevm on 3/12/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@class Teacher;
@class Login;
@class Exchange;
@class Subject;
@class CategoryType;

@interface CoreDataDAO : NSObject

@property (nonatomic, strong) NSManagedObjectContext *context;

// Inicializador de la clase
- (id)initWithContext:(NSManagedObjectContext *)aContext;

// Crea un nuevo usuario con la informacion especificada
- (User *)createUserWithData:(NSDictionary *)userData;

// Actualiza un nuevo usuario con la informacion especificada
- (User *)updateUserWithData:(NSDictionary *)userData;

// Devuelve el identificador de todos los usuarios almacenados en el dispositivo que no hayan sido borrados
- (NSArray *)findAllUserIDs;

// Devuelve el mensaje cuyo identificador es el pasado como parametro
- (User *)findUserWithID:(NSString *)userId;

// Devuelve el identificador de todos los files almacenados en el dispositivo que pertenezcan a un mensaje
- (NSSet *)findAllTeachWithID:(NSString *)userId;

// Devuelve el identificador de todos los files almacenados en el dispositivo que pertenezcan a un mensaje
- (NSSet *)findAllExchangesWithID:(NSString *)userId;

// Elimina el usuario del dispositivo
- (BOOL)deleteUser:(NSString *)userId;

//----------------------------------------------------------------------------------------------------------

// añade una asignatura para clases a un usuario y al sistema
- (User *)addTeach:(NSDictionary *)teachData toUserId:(NSString *)userId;

// añade una asignatura para intercambios a un usuario y al sistema
- (User *)addExchange:(NSDictionary *)exchangeData toUserId:(NSString *)userId;

// Elimina la asignatura del usuario en el servidor
- (BOOL)deleteTeach:(NSString *)teachId toUserId:(NSString *)userId;

// Elimina el intercambio del dispositivo
- (BOOL)deleteExchange:(NSString *)exchangeId toUserId:(NSString *)userId;

//----------------------------------------------------------------------------------------------------------

//Añade una asignatura
- (BOOL)addSubject:(NSDictionary *)subjectData;

//Añade un tipo de asignatura
- (BOOL)addCategoryType:(NSDictionary *)categoryData;

//Retorna todas las categorias persistidas.
- (NSArray *)findAllCategories;

//Retorna todas las asignaturas de una categoria
- (NSArray *)findAllSubjects:(NSString *)categoryId;


// añade todas las ciudades y paises al sistema.
- (BOOL)addCity:(NSDictionary *)city;

- (BOOL)findCity:(NSString *)city;

// añade todas las ciudades y paises al sistema.
- (BOOL)addState:(NSDictionary *)state;

- (BOOL)findState:(NSString *)state;

// añade todas las ciudades y paises al sistema.
- (BOOL)addCountry:(NSDictionary *)country;

- (BOOL)findCountry:(NSString *)country;

//Retorna todas las categorias persistidas.
- (NSArray *)findAllCities;


// Elimina el intercambio del dispositivo
- (BOOL)deleteAllCities;


/**
 Persiste los cambios sobre el contexto asociado.
 
 @return YES si los cambios han sido almacenados correctamente en la BD. NO e.o.c.
 */
- (BOOL)commitChanges;


// Guarda los cambios en el contexto pasado como parametro
- (BOOL)saveChangesInContext:(NSManagedObjectContext *)context;

- (NSPersistentStoreCoordinator *)resetPersistentStore;

@end
