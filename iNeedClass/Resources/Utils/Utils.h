//
//  Utils.h
//  iWorkflow_2
//
//  Created by Diego Palomar on 06/05/13.
//  Copyright (c) 2013 ABENGOA. All rights reserved.
//

#import <Foundation/Foundation.h>


#define IS_OS_VERSION_LESS_THAN_7    ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
#define screen_iPhone_landscape = 568
#define screen_iPhone_portrait = 320
#define screen_iPad_landscape = 768
#define screen_iPad_portrait = 1024


typedef enum {
    VerticalDirection,
    HorizontalDirection
} Direction;

@class Outcome;

// Clase con metodos de utilidad para la aplicación
@interface Utils : NSObject

// Devuelve la ruta del directorio de documentos de la aplicación
+ (NSString*)sharedDocumentsPath;

// Predicado para determinar si el dispositivo tiene pantalla Retina
+ (BOOL)deviceHasRetinaDisplay;

// Predicado para determinar si el dispositivo es un iPhone (en caso contrario es un iPad)
+ (BOOL)is_iPhoneDevice;

// Predicado para determinar si el dispositivo es un iPhone 5(en caso contrario es un 4)
+ (BOOL)is_iPhone5;

// Retorna el espacio disponible(pixels) de la pantalla en la direccion especificada
// estando el dispositivo en la orientacion indicada como parametro.
+ (CGFloat)screenSpaceAvailableInDirection: (Direction)direction
                            forOrientation: (UIInterfaceOrientation)orientation;

+ (BOOL)valueIsIntegerNumber:(NSString *)strValue;

+ (NSString *)buildDateNow;

+ (NSString *)buildLastDate:(NSDate *)date;

// Convierte un NSDate a un NSString
+ (NSString *)convertDateToNSString:(NSDate *)date;

@end
