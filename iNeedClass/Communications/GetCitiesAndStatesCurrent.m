//
//  GetCitiesAndStatesCurrent.m
//  iNeedClass
//
//  Created by injevm on 31/7/15.
//  Copyright © 2015 Jesus Victorio. All rights reserved.
//

#import "GetCitiesAndStatesCurrent.h"
#import "Defines.h"
#import "SITQueueManager.h"
#import "ConfigHelper.h"
#import "Utils.h"
#import "CitiesProcessorCurrent.h"


#define MAX_SYNC_ATTEMPTS   3

@interface GetCitiesAndStatesCurrent ()

/// Bandera para controlar el ruunloop del hilo
@property (atomic) BOOL runloopLive;

/// Buffer de almacenamiento de la respuesta del web service
@property (nonatomic, strong) NSMutableData *serverResponseData;

/// Contador de reintentos de sincronizacion
@property (nonatomic) NSInteger connAttemptsCounter;

@property (nonatomic) NSString *WS_GETCITIESOPTION;


@end

@implementation GetCitiesAndStatesCurrent

- (id)init
{
    self = [super init];
    
    if (self) {
        _runloopLive = NO;
        
        _connAttemptsCounter = 0;
        
        self.idOperation = [Utils buildDateNow];
        self.WS_GETCITIESOPTION = WS_GETPOBLACIONESCURRENT;
    }
    
    return self;
}

- (id)init2
{
    self = [super init];
    
    if (self) {
        _runloopLive = NO;
        
        _connAttemptsCounter = 0;
        
        self.idOperation = [Utils buildDateNow];
        self.WS_GETCITIESOPTION = WS_GETPROVINCIASCURRENT;
        
    }
    
    return self;
}

+ (GetCitiesAndStatesCurrent *)defaultView:(NSInteger)option
{
    GetCitiesAndStatesCurrent *view;
    
    switch (option) {
        case 0:
            view = [[GetCitiesAndStatesCurrent alloc] init];
            break;
        case 1:
            view = [[GetCitiesAndStatesCurrent alloc] init2];
            break;
        default:
            break;
    }
    
    return view;
}

#pragma mark - Punto de entrada de las clases NSOperation

- (void)main {
    
    @autoreleasepool {
        
        [self getCities];
        
    }
}

#pragma mark - Helper methods

/// Ejecuta la peticion de sincronizacion
- (void)getCities
{
    NSLog(@"Lanzando peticion de GetCities...");
    
    _connAttemptsCounter += 1;
    
    // Recuperar la direccion del servicio requerido para la sincronizacion
    // asi como las credenciales de autenticacion para el BUS
    NSString *address        = self.WS_GETCITIESOPTION;
    //NSString *user           = USER;
    //NSString *password       = PASS;
    
    NSMutableURLRequest *request = [NSMutableURLRequest new];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:address]];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    /*NSString *authStr = [NSString stringWithFormat:@"%@:%@", user, password];
     NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
     NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]];
     [request setValue:authValue forHTTPHeaderField:@"Authorization"];*/
    [request setTimeoutInterval:kTimeout];
    
    NSLog(@"(Operacion GETCITIES) Esperando respuesta del SERVIDOR...");
    
    // Crear la conexion con el servicio y lanzar la peticion
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection)
    {
        //CONEXION CORRECTA
    }
    
    /// Dado que la conexion es asincrona y se hace desde un hilo de trabajo, el runloop de dicho hilo
    /// debe permanecer activo hasta que explicitamente se indique que puede ser finalizado.
    /// Fuente del truco: http://stackoverflow.com/a/1730053/1368721
    
    // Comprobar que no se haya recuperado ya una referencia al runloop del hilo de trabajo. Si se crea mas de
    // un runloop y no se finalizan cada uno de ellos, el hilo de trabajo nunca sera destruido.
    // Esto es porque este procesor tiene reintentos y asi evitamos bloquear m√°s hilos
    if (!_runloopLive) {
        _runloopLive = YES;
        CFRunLoopRun();
    }
}

#pragma mark NSURLConnection Delegate Methods

- (NSCachedURLResponse *)connection: (NSURLConnection *)connection
                  willCacheResponse: (NSCachedURLResponse*)cachedResponse {
    // Se devuelve nil para indicar que no es necesario cachear la respuesta para esta conexion
    
    return nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // Se ha recibido respuesta por parte del servicio web
    
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    NSInteger responseCode = [httpResponse statusCode];
    
    if ( responseCode == SERVICE_RESPONSE_OK ) {
        
        if ([[SITQueueManager sharedInstance] isSuspendAsync])
        {
            [[SITQueueManager sharedInstance] resumeAllQueues];
        }
        
        // Inicializar la instancia que almacenara la informacion recibida a traves del metodo didReceiveData
        _serverResponseData = [NSMutableData new];
        
    } else {
        
        NSLog(@"Se ha producido un fallo. Respuesta del servicio de getCities: %ld\n", (long)responseCode);
        
        // Intentar sincronizar mientras no se haya superado el numero maximo de reintentos
        if ( _connAttemptsCounter < MAX_SYNC_ATTEMPTS )
        {
            NSLog(@"Reintentar getCities.");
            
            // Esperar 2 segundos hasta el proximo intento
            [NSThread sleepForTimeInterval:2];
            
            [self getCities];
            
            return;
        }
        
        NSLog(@"didReceiveResponse: Se ha abortado la peticion de GetCities!");
        
        [self broadcastSyncResult:NO];
        
        [connection cancel];
        
        [self stopCurrentRunLoop];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    // Agregar los datos recibidos a la instancia encargada de almacenar la informacion
    // enviada por el servicio web de sincronizacion
    if (_serverResponseData) {
        [_serverResponseData appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // La peticion esta completada y toda la informacion ha sido recibida. Procesar los datos
    if (_serverResponseData)
    {
        
        NSDictionary *syncDataCollection = [NSJSONSerialization JSONObjectWithData: _serverResponseData
                                                                           options: NSJSONReadingMutableContainers
                                                                             error: nil];
        if(syncDataCollection)
        {
            CitiesProcessorCurrent *citiesProcessor = [[CitiesProcessorCurrent alloc] initWithCities:syncDataCollection];
            [citiesProcessor execute];
        }
        NSLog(@"Se ha parseado citiesProcessor");
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // La conexion ha fallado por alguna razon. Revisar el error producido y determinar la accion ha seguir
    
    [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:@"cities"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"Se ha producido un fallo. Codigo de error: %ld. Descripcion de error: ", (long)[error code]);
    
    // Intentar sincronizar mientras no se haya superado el numero maximo de reintentos
    if ( _connAttemptsCounter < MAX_SYNC_ATTEMPTS ) {
        
        NSLog(@"Reintentar getCities.");
        
        // Esperar 2 segundos hasta el pr√≥ximo intento
        [NSThread sleepForTimeInterval:2];
        
        [self getCities];
        
        return;
    }
    else
    {
        
        if ([error code] == NSURLErrorNotConnectedToInternet || [error code] == NSURLErrorCannotConnectToHost ||
            [error code] == NSURLErrorCannotFindHost) {
            
            // Se suspende la cola de operaciones
            [[SITQueueManager sharedInstance] suspendAllQueues];
            
        }
        
    }
    
    NSLog(@"Se ha abortado la peticion de GetCities!");
    
    [self broadcastSyncResult:NO];
    
    [self stopCurrentRunLoop];
}

// Envia a nivel de aplicacion el evento asociado al resultado de la sincronizacion.
// Si la operacion fue exitosa (success = YES) envia 'SyncCompleted'. e.o.c. SyncFailed
- (void)broadcastSyncResult:(BOOL)success
{
    //NSString *syncResult = success ? SyncCompleted : SyncFailed;
    //[SITNotificator notifyEvent:syncResult withUserInfo:nil];
}

- (void)stopCurrentRunLoop {
    
    _runloopLive = NO;
    
    if (_serverResponseData) {
        _serverResponseData = nil;
    }
    
    CFRunLoopStop(CFRunLoopGetCurrent());
}



@end
