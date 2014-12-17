//
//  SITConfigHelper.h
//  Accion Comercial
//
//  Created by Diego Palomar on 29/08/13.
//  Copyright (c) 2013 ABENGOA. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Propiedades de entorno
typedef enum {
    kLanguage,            /// Idioma del dispositivo
    KOSVersion,           /// Version del sistema operativo
    kAppVersion,          /// Version actual de la aplicacion
    kAppIdentifier,       /// Identificar del bundle de la aplicacion
    kDeviceSerialNumber,  /// Numero de serie del dispositivo
    kMacAddress,          /// Direccion MAC del dispositivo
    kDeviceIdentifier     /// Identificador unico de dispositivo (UDID)
} EnviromentVars;

/** 
 Helper por medio del cual se accede a la coleccion de parametros de configuracion de la aplicacion.
 */
@interface SITConfigHelper : NSObject

// Devuelve el valor de la propiedad (de entorno) pasada como parametro.
+ (NSString *)getSystemProperty:(EnviromentVars)propertyName;

+ (void)setUDID:(NSString *)udid;
+ (NSString *)getUDID;

+ (void)setLdapUser:(NSString *)user;
+ (NSString *)getLdapUser;

+ (void)setEmailUser:(NSString *)mail;
+ (NSString *)getEmailUser;

@end
