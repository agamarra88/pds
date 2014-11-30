//
//  LandRegions.m
//  PSDHack
//
//  Created by Arturo Gamarra on 30/11/14.
//  Copyright (c) 2014 PSD. All rights reserved.
//

#import "LandRegions.h"

@implementation LandRegions

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    NSArray *subSaharan = @[@"BI",@"KM",@"DJ",@"ER",@"ET",@"KE",@"MG",@"MW",@"MU",@"YT",@"MZ",@"RE",@"RW",@"SC",@"SO",@"UG",@"TZ",@"ZM",@"ZW",@"AO",
                            @"CM",@"CF",@"TD",@"CG",@"CD",@"GQ",@"GA",@"ST",@"BW",@"LS",@"NA",@"ZA",@"SZ",@"BJ",@"BF",@"CV",@"CI",@"GM",@"GH",@"GN",
                            @"GW",@"LR",@"ML",@"MR",@"NE",@"NG",@"SH",@"SN",@"SL",@"TG"];
    
    NSArray *latinAmerica = @[@"AI",@"AG",@"AW",@"BS",@"BB",@"BQ",@"VG",@"KY",@"CU",@"CW",@"DM",@"DO",@"GD",@"GP",@"HT",@"JM",@"MQ",@"MS",@"PR",@"BL",
                              @"KN",@"LC",@"MF",@"VC",@"SX",@"TT",@"TC",@"VI",@"BZ",@"CR",@"SV",@"GT",@"HN",@"MX",@"NI",@"PA",@"AR",@"BO",@"BR",
                              @"CL",@"CO",@"EC",@"FK",@"GF",@"GY",@"PY",@"PE",@"SR",@"UY",@"VE",@"BM",@"CA",@"GL",@"PM",@"US"];
    
    NSArray *southAsia = @[@"AF",@"BD",@"BT",@"IN",@"IR",@"MV",@"NP",@"PK",@"LK",@"BN",@"KH",@"ID",@"LA",@"MY",@"MM",@"PH",@"SG",@"TH",@"TL",@"VN"];
    
    NSArray *middleEastNorthAfrica = @[@"DZ",@"EG",@"LY",@"MA",@"SS",@"SD",@"TN",@"EH",@"AM",@"AZ",@"BH",@"CY",@"GE",@"IQ",@"IL",@"JO",@"KW",
                                       @"LB",@"PS",@"OM",@"QA",@"SA",@"SY",@"TR",@"AE",@"YE"];
    
    NSArray *easternEuropeCentralAsia = @[@"KZ",@"KG",@"TJ",@"TM",@"UZ",@"BY",@"BG",@"CZ",@"HU",@"PL",@"MD",@"RO",@"RU",@"SK",@"UA",@"DK",
                                          @"EE",@"FO",@"FI",@"GG",@"IS",@"IE",@"IM",@"JE",@"LV",@"LT",@"NO",@"SJ",@"SE",@"GB",@"AL",@"AD",@"BA",
                                          @"HR",@"GI",@"GR",@"VA",@"IT",@"MT",@"ME",@"PT",@"SM",@"RS",@"SI",@"ES",@"MK",@"AT",@"BE",@"FR",@"DE",
                                          @"LI",@"LU",@"MC",@"NL",@"CH"];
    
    NSArray *eastAsiaPacific = @[@"AU",@"NZ",@"NF",@"FJ",@"NC",@"PG",@"SB",@"VU",@"GU",@"KI",@"MH",@"FM",@"NR",@"MP",@"PW",@"AS",@"CK",@"PF",
                                 @"NU",@"PN",@"WS",@"TK",@"TO",@"TV",@"WF",@"CN",@"HK",@"MO",@"KP",@"JP",@"MN",@"KR"];
    
    NSMutableDictionary *mutable = [NSMutableDictionary new];
    [mutable setObject:subSaharan forKey:@"Sub-Saharan Africa"];
    [mutable setObject:middleEastNorthAfrica forKey:@"Middle East and North Africa"];
    [mutable setObject:easternEuropeCentralAsia forKey:@"Eastern Europe and Central Asia"];
    [mutable setObject:southAsia forKey:@"South Asia"];
    [mutable setObject:eastAsiaPacific forKey:@"East Asia and Pacific"];
    [mutable setObject:latinAmerica forKey:@"Latin America and Caribbean"];
    
    _landregions = mutable;
    return self;
}

@end
