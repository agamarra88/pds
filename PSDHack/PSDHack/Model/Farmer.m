//
//  Farmer.m
//  PSDHack
//
//  Created by Arturo Gamarra on 30/11/14.
//  Copyright (c) 2014 PSD. All rights reserved.
//

#import "Farmer.h"

@implementation Farmer

+ (Farmer *)shareFarmer {
    static Farmer *_shareFarmer = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _shareFarmer = [[self alloc] init];
    });
    return _shareFarmer;
}

- (void)setCombustibleConsumido:(double)combustibleConsumido withTipo:(NSString *)tipo {
    self.tipoCombustible = tipo;
    self.combustibleConsumido = combustibleConsumido;
    
    double factorEmision = [self getFactorEmision:tipo];
    double factorPC = [self getFactorPC:tipo];
    self.consumoCombustibleTotal = self.combustibleConsumido * 3.79 * 1/1000 * 854 * factorPC * 1/1000000 * factorEmision;
}

- (void)setCantidadMasaComposte:(double)cantidadMasaComposte {
    _cantidadMasaComposte = cantidadMasaComposte;
    self.cantidadMasaComposteTotal = ((cantidadMasaComposte * 4/1000 * 21) + (cantidadMasaComposte * 0.3/1000 * 296)) * 1/1000;
}

- (void)setCantidadMasaBiogas:(double)cantidadMasaBiogas {
    _cantidadMasaBiogas = cantidadMasaBiogas;
    self.cantidadMasaBiogasTotal = cantidadMasaBiogas * 1/1000 * 21;
}

- (void)setCabezaGanado:(double)cabezaGanado {
    _cabezaGanado = cabezaGanado;
    self.cabezaGanadoTotal = cabezaGanado * 53 * 21;
    self.fermentacionEntericaTotal = self.cabezaGanadoTotal;
}

- (void)setCantidadNitrogeno:(double)cantidadNitrogeno {
    _cantidadNitrogeno = cantidadNitrogeno;
    self.cantidadNitrogenoTotal = self.cantidadNitrogeno * 0.01 * 0.01 * 0.0075 * 44/28 * 296;
}

- (void)setUreaAplicada:(double)ureaAplicada {
    _ureaAplicada = ureaAplicada;
    self.ureaAplicadaTotal = ureaAplicada * 0.2 * 44/12;
}

- (void)setUreaAplicadaTotal:(double)ureaAplicadaTotal {
    _ureaAplicadaTotal = ureaAplicadaTotal;
    self.fertilizacionTotal = self.ureaAplicadaTotal + self.cantidadNitrogenoTotal;
}

- (void)setCantidadNitrogenoTotal:(double)cantidadNitrogenoTotal {
    _cantidadNitrogenoTotal = cantidadNitrogenoTotal;
    self.fertilizacionTotal = self.ureaAplicadaTotal + self.cantidadNitrogenoTotal;
}

- (void)setCantidadMasaBiogasTotal:(double)cantidadMasaBiogasTotal {
    _cantidadMasaBiogasTotal = cantidadMasaBiogasTotal;
    self.tratamiendoResiduosTotal = self.cantidadMasaBiogasTotal + self.cantidadMasaComposteTotal;
}

- (void)setCantidadMasaComposteTotal:(double)cantidadMasaComposteTotal {
    _cantidadMasaComposteTotal = cantidadMasaComposteTotal;
    self.tratamiendoResiduosTotal = self.cantidadMasaBiogasTotal + self.cantidadMasaComposteTotal;
}

- (double)getFactorEmision:(NSString *)tipo {
    tipo = [tipo uppercaseString];
    if ([tipo isEqualToString:@"DIESEL"]) {
        return 74.1;
    } else if ([tipo isEqualToString:@"GASOLINA"]) {
        return 69.3;
    } else if ([tipo isEqualToString:@"GAS NATURAL"]) {
        return 56.1;
    } else {
        return 0;
    }
}

- (double)getFactorPC:(NSString *)tipo {
    tipo = [tipo uppercaseString];
    if ([tipo isEqualToString:@"DIESEL"]) {
        return 42.5;
    } else if ([tipo isEqualToString:@"GASOLINA"]) {
        return 43;
    } else if ([tipo isEqualToString:@"GAS NATURAL"]) {
        return 34.6;
    } else {
        return 0;
    }
}

- (void)calculateCarbonoTotal {
    self.carbonoTotal = self.consumoCombustibleTotal + self.tratamiendoResiduosTotal + self.fermentacionEntericaTotal + self.fertilizacionTotal;
}

@end
