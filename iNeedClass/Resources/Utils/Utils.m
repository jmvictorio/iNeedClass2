//
//  Utils.m
//  iWorkflow_2
//
//  Created by Diego Palomar on 06/05/13.
//  Copyright (c) 2013 ABENGOA. All rights reserved.
//

#import "Utils.h"
#import "Defines.h"
#import "ConfigHelper.h"


@implementation Utils

+ (NSString*)sharedDocumentsPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


+ (NSString *)stringFromDate:(NSDate *)date {
    
    NSDateFormatter* userDateFormat = [NSDateFormatter new];
    [userDateFormat setDateStyle:NSDateFormatterMediumStyle];
    [userDateFormat setTimeStyle:NSDateFormatterShortStyle];
    
    NSString *strDate = [userDateFormat stringFromDate:date];
    
    return strDate;
}


+ (BOOL)deviceHasRetinaDisplay {
    return ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))?1:0;
}


+ (BOOL)is_iPhoneDevice {
    return  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone);
}

+ (CGFloat)screenSpaceAvailableInDirection: (Direction)direction
                            forOrientation: (UIInterfaceOrientation)orientation {
    
    CGRect screenRect    = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth  = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    CGFloat spaceAvailable = 0;
    
    if ( UIInterfaceOrientationIsPortrait(orientation) ) {
        
        if ( direction == VerticalDirection ) {
            
            spaceAvailable = screenHeight;
            
        } else if ( direction == HorizontalDirection ) {
            
            spaceAvailable = screenWidth;
        }
        
    } else if( UIInterfaceOrientationIsLandscape(orientation) ) {
        
        if ( direction == VerticalDirection ) {
            
            spaceAvailable = screenWidth;
            
        } else if ( direction == HorizontalDirection ) {
            
            spaceAvailable = screenHeight;
        }
    }
    
    return spaceAvailable;
}


// Fuente: http://rosettacode.org/wiki/Determine_if_a_string_is_numeric#Objective-C
+ (BOOL)valueIsIntegerNumber:(NSString *)strValue
{
    NSUInteger len = [strValue length];
    NSUInteger i;
    BOOL status = NO;
    
    for(i=0; i < len; i++)
    {
        unichar singlechar = [strValue characterAtIndex: i];
        if ( (singlechar == ' ') && (!status) )
        {
            continue;
        }
        if ( ( singlechar == '+' ||
              singlechar == '-' ) && (!status) ) { status=YES; continue; }
        if ( ( singlechar >= '0' ) &&
            ( singlechar <= '9' ) )
        {
            status = YES;
        } else {
            return NO;
        }
    }
    return (i == len) && status;
}


//Construye la fecha para el cancelToRange
//FUENTE: http://nshipster.com/nsdatecomponents/
+ (NSString *)buildDateNow
{
    NSString *result;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setHour:-1];
    
    NSDate *date = [calendar dateByAddingComponents:components toDate:[NSDate date] options:0];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSZ"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    NSString *parte1 = [dateString substringWithRange:NSMakeRange(0, dateString.length-2)];
    NSString *parte2 = [dateString substringWithRange:NSMakeRange(dateString.length-2, 2)];
    result = [NSString stringWithFormat:@"%@:%@", parte1, parte2];
    
    return result;
}

+ (NSString *)buildLastDate:(NSDate *)date
{
    NSString *result;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    NSDate *dateFinal = [calendar dateByAddingComponents:components toDate:date options:0];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSZ"];
    NSString *dateString = [dateFormatter stringFromDate:dateFinal];
    
    NSString *parte1 = [dateString substringWithRange:NSMakeRange(0, dateString.length-2)];
    NSString *parte2 = [dateString substringWithRange:NSMakeRange(dateString.length-2, 2)];
    result = [NSString stringWithFormat:@"%@:%@", parte1, parte2];
    
    return result;
}

/** Devuelve la fecha de expiracion de los mensajes. Todos los mensajes cuya fecha de publicacion sea inferior
 a la fecha de expiracion se consideran expirados
 */
+ (NSDate *)expirationDate
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                                          fromDate:[[NSDate alloc] init]];
    
    NSInteger year = [components year];
    NSInteger month = [components month];
    NSInteger day = [components day];
    
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    
    NSDate *todayDate = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    // Calculamos la fecha limite. Todos los mensajes cuya fecha de publicacion sea inferior a esta se consideran expirados
    NSDate *lifetimeDate = [todayDate dateByAddingTimeInterval:-[ConfigHelper getLifetimeMessages]*24*60*60];
    
    return lifetimeDate;
}

+ (NSString *)convertDateToNSString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSZ"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    NSString *parte1 = [dateString substringWithRange:NSMakeRange(0, dateString.length-2)];
    NSString *parte2 = [dateString substringWithRange:NSMakeRange(dateString.length-2, 2)];

    return [NSString stringWithFormat:@"%@:%@", parte1, parte2];

}

+ (BOOL)is_iPhone5
{
    if([UIScreen mainScreen].bounds.size.height == 568){
        return YES;
    }else{
        return NO;
    }
}



@end
