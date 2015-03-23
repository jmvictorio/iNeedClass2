//
//  HTAutocompleteManager.m
//  HotelTonight
//
//  Created by Jonathan Sibley on 12/6/12.
//  Copyright (c) 2012 Hotel Tonight. All rights reserved.
//

#import "HTAutocompleteManager.h"

static HTAutocompleteManager *sharedManager;

@implementation HTAutocompleteManager

+ (HTAutocompleteManager *)sharedManager
{
	static dispatch_once_t done;
	dispatch_once(&done, ^{ sharedManager = [[HTAutocompleteManager alloc] init]; });
	return sharedManager;
}

#pragma mark - HTAutocompleteTextFieldDelegate

- (NSString *)textField:(HTAutocompleteTextField *)textField
    completionForPrefix:(NSString *)prefix
             ignoreCase:(BOOL)ignoreCase
{
    
    if (textField.autocompleteType == HTAutocompleteTypePoblacion)
    {
        static dispatch_once_t colorOnceToken;
        static NSArray *colorAutocompleteArray;
        dispatch_once(&colorOnceToken, ^
        {
            colorAutocompleteArray = @[ @"Écija, Sevilla",
                                        @"Sevilla, Sevilla",
                                        @"Dos Hermanas, Sevilla",
                                        @"Huelva, Huelva",
                                        @"Cádiz, Cádiz",
                                        @"Puerto de Santa María, Cádiz",
                                        @"Bollullos de la Mitación, Sevilla",
                                        @"Cañada del Rosal, Sevilla",
                                        @"La Carlota, Córdoba",
                                        @"San Fernando, Cádiz",
                                        @"Aznalcollar, Sevilla",
                                        @"Alcalá de Guadaira, Sevilla",
                                        @"Mairena del Alcor, Sevilla",
                                        @"Mairena del Aznaljarafe, Sevilla"];
        });

        NSString *stringToLookFor;
		NSArray *componentsString = [prefix componentsSeparatedByString:@","];
        NSString *prefixLastComponent = [componentsString.lastObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (ignoreCase)
        {
            stringToLookFor = [prefixLastComponent lowercaseString];
        }
        else
        {
            stringToLookFor = prefixLastComponent;
        }
        
        for (NSString *stringFromReference in colorAutocompleteArray)
        {
            NSString *stringToCompare;
            if (ignoreCase)
            {
                stringToCompare = [stringFromReference lowercaseString];
            }
            else
            {
                stringToCompare = stringFromReference;
            }
            
            if ([stringToCompare hasPrefix:stringToLookFor])
            {
                return [stringFromReference stringByReplacingCharactersInRange:[stringToCompare rangeOfString:stringToLookFor] withString:@""];
            }
            
        }
    }
    
    return @"";
}

@end
