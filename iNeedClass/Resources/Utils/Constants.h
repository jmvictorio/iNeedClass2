//
//  Constants.h
//  AccionComercial
//
//  Created by UEGMOBILE on 06/08/14.
//  Copyright (c) 2014 ABENGOA. All rights reserved.
//

#import <Foundation/Foundation.h>

// Timeout para las peticiones
extern NSInteger const kTimeout;

// Nombres de las claves del diccionario que encapsula el mensaje del evento
// que se transmite a la aplicación a través del metodo notifyAppStatus:
extern NSString * const EventNameKey;

// Nombres de los eventos que se producen en la aplicación. Cuando un controlador
// requiere recibir notificacion de eventos debe especificar la lista de los eventos
// que va a seguir.
extern NSString * const CloseRegistro;
extern NSString * const ActualizaMenu;
extern NSString * const ExitAndUpdateMenu;
extern NSString * const UpdateProgress;
extern NSString * const EndProgress;
extern NSString * const FinishStates;
extern NSString * const FinishStatesAll;