//
//  Login+CoreDataProperties.h
//  iNeedClass
//
//  Created by injevm on 4/8/15.
//  Copyright © 2015 Jesus Victorio. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "Login.h"

NS_ASSUME_NONNULL_BEGIN

@interface Login (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *id_login;
@property (nullable, nonatomic, retain) NSString *mail;
@property (nullable, nonatomic, retain) NSString *pass;
@property (nullable, nonatomic, retain) NSString *creationDate;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *apellido1;
@property (nullable, nonatomic, retain) NSString *fnac;
@property (nullable, nonatomic, retain) NSString *telefono;
@property (nullable, nonatomic, retain) NSString *cursando;
@property (nullable, nonatomic, retain) NSString *sexo;
@property (nullable, nonatomic, retain) NSString *imagen;
@property (nullable, nonatomic, retain) NSString *notificarMail;
@property (nullable, nonatomic, retain) NSString *nacionalidad;

@end

NS_ASSUME_NONNULL_END
