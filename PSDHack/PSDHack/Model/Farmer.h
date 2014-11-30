//
//  Farmer.h
//  PSDHack
//
//  Created by Arturo Gamarra on 30/11/14.
//  Copyright (c) 2014 PSD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Farmer : NSObject

+ (Farmer *)shareFarmer;

@property (nonatomic, strong) NSString *region;
@property (nonatomic, strong) NSString *farmSystem;

@property (nonatomic, strong) NSString *tipoCombustible;
@property (nonatomic) double combustibleConsumido;
@property (nonatomic) double cantidadMasaComposte;
@property (nonatomic) double cantidadMasaBiogas;
@property (nonatomic) double cabezaGanado;
@property (nonatomic) double cantidadNitrogeno;
@property (nonatomic) double ureaAplicada;
@property (nonatomic) double cantidadHecatareas;

@property (nonatomic) double consumoCombustibleTotal;
@property (nonatomic) double cantidadMasaComposteTotal;
@property (nonatomic) double cantidadMasaBiogasTotal;
@property (nonatomic) double cabezaGanadoTotal;
@property (nonatomic) double cantidadNitrogenoTotal;
@property (nonatomic) double ureaAplicadaTotal;

@property (nonatomic) double tratamiendoResiduosTotal;
@property (nonatomic) double fermentacionEntericaTotal;
@property (nonatomic) double fertilizacionTotal;

@property (nonatomic) double carbonoTotal;

@end
