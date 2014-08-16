//
//  ConfigHelper.h
//  Accion Comercial
//
//  Created by Diego Palomar on 29/08/13.
//  Copyright (c) 2013 ABENGOA. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kLanguage,            // Idioma del dispositivo
    KOSVersion,           // Version del sistema operativo
    kAppVersion,          // Version actual de la aplicacion
    kAppIdentifier,       // Identificar del bundle de la aplicacion
    kDeviceSerialNumber,  // Numero de serie del dispositivo
    kMacAddress,          // Direccion MAC del dispositivo
    kDeviceIdentifier     // Identificador unico de dispositivo (UDID)
} EnviromentVars;

/*
 * Helper por medio del cual se accede a la coleccion de parametros de configuracion de la aplicacion.
 */
@interface ConfigHelper : NSObject

// Devuelve el valor de la propiedad (de entorno) pasada como parametro.
+ (NSString *)getSystemProperty:(EnviromentVars)propertyName;

+ (void)setUDID:(NSString *)udid;
+ (NSString *)getUDID;

+ (void)setLdapUser:(NSString *)user;
+ (NSString *)getLdapUser;

+ (void)setEmailUser:(NSString *)mail;
+ (NSString *)getEmailUser;

+ (void)setLastDate:(NSString *)date;
+ (NSDate *)getLastDate;

/// Obtiene el tiempo de vida de los mensajes. Por defecto, es de 15 dias
+ (NSInteger)getLifetimeMessages;
/// Modifica el tiempo de vida de los mensajes
+ (void)setLifetimeMessages:(NSInteger)lifetime;

// Devuelve la ruta al archivo de configuracion disponible en el directorio 'Documents' de la
// aplicacion. Si el archivo no existe, el metodo crea una copia del archivo de configuracion
// original almacenado en el bundle y devuelve la ruta del archivo creado.
+ (NSString *)getPropertiesFilePath;

@end
