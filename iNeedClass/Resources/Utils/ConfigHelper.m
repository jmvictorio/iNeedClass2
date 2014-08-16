//
//  ConfigHelper.m
//  Accion Comercial
//
//  Created by Diego Palomar on 29/08/13.
//  Copyright (c) 2013 ABENGOA. All rights reserved.
//

#import <dlfcn.h>
#import <sys/socket.h>
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>

#import "ConfigHelper.h"


@interface ConfigHelper()

// Devuelve una coleccion (dos elementos) con las direcciones MAC asociadas al dispositivo
// Indice {0: MAC Address, 1: MAC Bluetooth}
+ (NSArray *)hardwareFingerprint;

// Devuelve el numero de serie del dispostivo
+ (NSString *)getSerialNumber;

@end


@implementation ConfigHelper

#pragma mark - Metodos publicos

// Devuelve el valor de la propiedad (de entorno) pasada como parametro.
+ (NSString *)getSystemProperty:(EnviromentVars)propertyName {
    
    NSString *systemProperty = nil;
    
    switch (propertyName) {

        case kLanguage: {
            
            NSArray *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
            systemProperty = [languages objectAtIndex:0];
            break;
        }
            
        case KOSVersion:
            
            systemProperty = [[UIDevice currentDevice] systemVersion];
            break;
         
        case kAppVersion:
            
            systemProperty = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
            break;

        case kAppIdentifier:
            
            systemProperty = [[NSBundle mainBundle] bundleIdentifier];
            break;
            
        case kDeviceSerialNumber:
            
            systemProperty = [self getSerialNumber];
            break;
            
        case kMacAddress:
            
            // Indice {0: MAC Address, 1: MAC Bluetooth}
            systemProperty = [[self hardwareFingerprint] objectAtIndex:0];
            break;
            
        case kDeviceIdentifier: {

            systemProperty = [self getUDID];
            break;
        }
    }
    
    return systemProperty;
}


+ (void)setUDID:(NSString *)udid
{
    [[NSUserDefaults standardUserDefaults] setValue:udid forKey:@"udid"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+ (NSString *)getUDID
{
//    return @"eadc908b38ade573be4d164cf4b612bf52b8d95b";
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"udid"];//@"a080111fb68d3807ea5e3941e74c05a1c7ce06e5";//
}


+ (void)setLdapUser:(NSString *)user
{
    [[NSUserDefaults standardUserDefaults] setValue:user forKey:@"ldapUser"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+ (NSString *)getLdapUser
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"ldapUser"];
}

+ (void)setEmailUser:(NSString *)user
{
    [[NSUserDefaults standardUserDefaults] setValue:user forKey:@"userEmail"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+ (NSString *)getEmailUser
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"userEmail"];
}

+ (void)setLastDate:(NSString *)date
{
    [[NSUserDefaults standardUserDefaults] setValue:date forKey:@"lastDate"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSDate *)getLastDate
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"lastDate"];
}

// Modifica el tiempo de vida de los mensajes
+ (void)setLifetimeMessages:(NSInteger)lifetime
{
    [[NSUserDefaults standardUserDefaults] setInteger:lifetime forKey:@"lifetime"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// Obtiene el tiempo de vida de los mensajes. Por defecto, es de 15 dias
+ (NSInteger)getLifetimeMessages
{
   return [[NSUserDefaults standardUserDefaults] integerForKey:@"lifetime"];
}

#pragma mark - Metodos privados

+ (NSString *)getSerialNumber {
	
    NSString *serialNum = nil;
    
	void *IOKit = dlopen("/System/Library/Frameworks/IOKit.framework/IOKit", RTLD_NOW);
	if (IOKit)
	{
		mach_port_t *kIOMasterPortDefault = dlsym(IOKit, "kIOMasterPortDefault");
		CFMutableDictionaryRef (*IOServiceMatching)(const char *name) = dlsym(IOKit, "IOServiceMatching");
		mach_port_t (*IOServiceGetMatchingService)(mach_port_t masterPort, CFDictionaryRef matching) = dlsym(IOKit, "IOServiceGetMatchingService");
		CFTypeRef (*IORegistryEntryCreateCFProperty)(mach_port_t entry, CFStringRef key, CFAllocatorRef allocator, uint32_t options) = dlsym(IOKit, "IORegistryEntryCreateCFProperty");
		kern_return_t (*IOObjectRelease)(mach_port_t object) = dlsym(IOKit, "IOObjectRelease");
        
		if (kIOMasterPortDefault && IOServiceGetMatchingService && IORegistryEntryCreateCFProperty && IOObjectRelease)
		{
			mach_port_t platformExpertDevice = IOServiceGetMatchingService(*kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice"));
			if (platformExpertDevice)
			{
				CFTypeRef platformSerialNumber = IORegistryEntryCreateCFProperty(platformExpertDevice, CFSTR("IOPlatformSerialNumber"), kCFAllocatorDefault, 0);
				if (CFGetTypeID(platformSerialNumber) == CFStringGetTypeID())
				{
					serialNum = [NSString stringWithString:(__bridge NSString*)platformSerialNumber];
					CFRelease(platformSerialNumber);
				}
				IOObjectRelease(platformExpertDevice);
			}
		}
		dlclose(IOKit);
	}
    
	return serialNum;
}

// Devuelve una coleccion (dos elementos) con las direcciones MAC asociadas al dispositivo
// Indice {0: MAC Address, 1: MAC Bluetooth}
+ (NSArray *)hardwareFingerprint {
    
    int                 mgmtInfoBase[6];
    char                *msgBuffer = NULL;
    size_t              length;
    unsigned char       macAddress[6];
    struct if_msghdr    *interfaceMsgStruct;
    struct sockaddr_dl  *socketStruct;
    NSString            *errorFlag = NULL;
    
    // Setup the management Information Base (mib)
    mgmtInfoBase[0] = CTL_NET;        // Request network subsystem
    mgmtInfoBase[1] = AF_ROUTE;       // Routing table info
    mgmtInfoBase[2] = 0;
    mgmtInfoBase[3] = AF_LINK;        // Request link layer information
    mgmtInfoBase[4] = NET_RT_IFLIST;  // Request all configured interfaces
    
    // With all configured interfaces requested, get handle index
    if ((mgmtInfoBase[5] = if_nametoindex("en0")) == 0)
        errorFlag = @"if_nametoindex failure";
    else
    {
        // Get the size of the data available (store in len)
        if (sysctl(mgmtInfoBase, 6, NULL, &length, NULL, 0) < 0)
            errorFlag = @"sysctl mgmtInfoBase failure";
        else
        {
            // Alloc memory based on above call
            if ((msgBuffer = malloc(length)) == NULL)
                errorFlag = @"buffer allocation failure";
            else
            {
                // Get system information, store in buffer
                if (sysctl(mgmtInfoBase, 6, msgBuffer, &length, NULL, 0) < 0)
                    errorFlag = @"sysctl msgBuffer failure";
            }
        }
    }
    
    // Befor going any further...
    if (errorFlag != NULL) {
        
        if (msgBuffer) {
            free(msgBuffer);
        }
            
        return nil;
    }
    
    // Map msgbuffer to interface message structure
    interfaceMsgStruct = (struct if_msghdr *) msgBuffer;
    
    // Map to link-level socket structure
    socketStruct = (struct sockaddr_dl *) (interfaceMsgStruct + 1);
    
    // Copy link layer address data in socket structure to an array
    memcpy(&macAddress, socketStruct->sdl_data + socketStruct->sdl_nlen, 6);
    
    // Read from char array into a string object, into traditional Mac address format
    NSString *macAddressString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                                  macAddress[0], macAddress[1], macAddress[2],
                                  macAddress[3], macAddress[4], macAddress[5]];
    
    NSString *macBluetoothAddressString2 = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                                            macAddress[0], macAddress[1], macAddress[2],
                                            macAddress[3], macAddress[4], macAddress[5] + 1];
    
    // Release the buffer memory
    free(msgBuffer);
    
    NSMutableArray *arrayResult = [NSMutableArray array];
    
    [arrayResult addObject:macAddressString];
    [arrayResult addObject:macBluetoothAddressString2];
    
    return arrayResult;
}

// Devuelve la ruta al archivo de configuracion disponible en el directorio 'Documents' de la
// aplicacion. Si el archivo no existe, el metodo crea una copia del archivo de configuracion
// original almacenado en el bundle y devuelve la ruta del archivo creado.
+ (NSString *)getPropertiesFilePath
{
    // Ruta de acceso al directorio 'Documents' de la aplicacion
    NSString *documentFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                    NSUserDomainMask, YES) objectAtIndex:0];
    // Ruta de acceso al archivo de configuracion dentro del directorio 'Documents'
    NSString *propertiesFilePath = [documentFolder stringByAppendingPathComponent:@"AC-PRE.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:propertiesFilePath]) // El archivo no existe
    {
        // Ruta de acceso al archivo de configuracion dentro del bundle de la aplicacion
        //NSString *bundleFile = [[NSBundle mainBundle] pathForResource:propertiesFilePath ofType:@"plist"];
        
        // Almacenar una copia del archivo de configuracion en el directorio 'Documents'
        //[fileManager copyItemAtPath:bundleFile toPath:propertiesFilePath error:nil];
    }
    
    return propertiesFilePath;
}

@end
