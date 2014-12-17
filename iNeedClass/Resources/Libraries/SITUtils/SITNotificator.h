//
//  Notificator.h
//  iWorkflow_2
//
//  Created by Diego Palomar on 08/05/13.
//  Copyright (c) 2013 ABENGOA. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 @protocol SITNotificatorDelegate
 @discussion Protocolo que deben aceptar los componentes de la aplicación para
 poder recibir notificaciones de los eventos producidos
*/
@protocol SITNotificatorDelegate

@required

/**
 @brief Enviado al observador cuando se produce un evento en la aplicación
 @param notification Notificacion que contiene datos de interes para el observador
 */
- (void)didReceiveNotificationEvent:(NSNotification *)notification;

@end

/** 
 @brief Clase encarga de gestionar los distintos tipos de alertas presentadas al usuario,
 asi como tambien los mensajes asociados a los cambios de estado que emiten y
 reciben los distintos componentes a nivel de aplicación
 */
@interface SITNotificator : NSObject

/**
 Muestra al usuario una alerta instantanea de tipo emergente (AlertView)
 @param message Mensaje que se muestra
 @param title Titulo del alert
 */
+ (void)showAlertWithTextMessage: (NSString *)message andTitle: (NSString *)title;

/**
 Muestra un mensaje de tipo emergente sobre la vista pasada como parametro despues de un retraso
 en segundos definido a través del parametro seconds.
 @param message Mensaje que se muestra
 @param view Vista sobre la que se muestra el toast
 @param seconds Tiempo que tarda en aparecer el toast
 */
+ (void)showToastWithMessage:(NSString *)message inView:(UIView *)view afterDelay:(NSTimeInterval)seconds;

/**
 Suscribe al observador para recibir mensajes de cambio de estado dentro de la aplicación
 La suscripcion se realiza para los mensajes definidos en el parametro eventList
    @param observer Objeto observador sobre el que se delega cuando se produce alguno de los eventos registrados
    @param eventList Array que contiene los eventos que se van a observar
 */
+ (void)addObserver:(id<SITNotificatorDelegate>)observer forEvents:(NSArray *)eventList;

/**
 Comunica a nivel de aplicación un evento producido cuyo mensaje es encapsulado en el
 diccionario recibido como parametro
 @param notificationName Nombre del evento que se va a notificar
 @param userInfo Diccionario que contiene el mensaje a notificar
 */
+ (void)notifyEvent:(NSString *)notificationName withUserInfo:(NSDictionary *)userInfo;

/**
 Elima el observador de la lista de componentes suscritos para recibir mensajes
 @param observer Observador a eliminar
 */
+ (void)removeObserver:(id)observer;

@end
