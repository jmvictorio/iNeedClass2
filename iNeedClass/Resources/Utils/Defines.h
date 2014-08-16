//
//  Defines.h
//
//  Created by Diego Palomar on 28/08/13.
//  Copyright 2013 ABENGOA. All rights reserved.
//
//

/////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                     //
// Constantes de uso general en la aplicacion                                                          //
//                                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////////////////////


// Codigos de respuesta de los servicios del BUS
#define BUS_NOT_AVAILABLE          400
#define BUS_INTERNAL_ERROR         500
#define SERVICE_RESPONSE_OK        200
#define CONNECTION_TIMEOUT_1       kCFURLErrorTimedOut                // Codigo de respuesta de la API de Cocoa para Timeouts
#define CONNECTION_TIMEOUT_2       kCFURLErrorNotConnectedToInternet  // Codigo de respuesta de la API de Cocoa para Timeouts

// Codigos de error de autenticacion SSL definidos en CFNetworkErrors.h
#define SECURE_CONNECTION_FAILED   @[@"-1200", @"-1201", @"-1202", @"-1203", @"-1204", @"-1205", @"-1206", @"-2000"]

#define LIFE_TIME_DEFAULT           15
