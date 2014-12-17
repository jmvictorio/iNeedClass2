//
//  Synchronizer.h
//  Acc. Comercial
//
//  Created by Diego Palomar on 10/03/14.
//  Copyright (c) 2014 ABENGOA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SITOperation;

// TODO: Contemplar que se podrian intentar encolar procesos de naturaleza
// diferente pero a los que se les asignara el mismo identificador, lo cual
// implicaria que no serian encolados


/// Posteado cuando las colas son suspendidas
extern NSString * const SITQueueManagerSuspendedAllQueues;

@interface SITQueueManager : NSObject

// Devuelve la instancia compartida del sincronizador
+ (SITQueueManager *)sharedInstance;

- (BOOL)enqueueSyncOperation:(SITOperation *)operation;
- (BOOL)enqueueAsyncOperation:(SITOperation *)operation;

// Suspende todas las colas
- (void)suspendAllQueues;
// Reanuda todas las colas
- (void)resumeAllQueues;
// Limpia las colas
- (void)clearQueues;
// Pregunta si esta suspendida la cola asyncrona
- (BOOL)isSuspendAsync;

- (NSOperationQueue *)async;

- (BOOL)cancelOperationWithId:(NSString *)idOperation;

@end
