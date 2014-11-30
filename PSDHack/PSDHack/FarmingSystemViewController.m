//
//  FarmingSystemViewController.m
//  pds
//
//  Created by Josky Jara on 11/30/14.
//  Copyright (c) 2014 Sunarp. All rights reserved.
//

#import "FarmingSystemViewController.h"

@interface FarmingSystemViewController ()
@property (strong, nonatomic) NSArray *arrRegionPicker;
@property (strong, nonatomic) NSArray *arrFarSysPicker;

@property (strong, nonatomic) NSArray *arrFarSysDetailPicker;
@property (strong, nonatomic) NSArray *arrFarSys01Picker;
@property (strong, nonatomic) NSArray *arrFarSys02Picker;
@property (strong, nonatomic) NSArray *arrFarSys03Picker;
@property (strong, nonatomic) NSArray *arrFarSys04Picker;
@property (strong, nonatomic) NSArray *arrFarSys05Picker;
@property (strong, nonatomic) NSArray *arrFarSys06Picker;

@end

@implementation FarmingSystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrRegionPicker = [NSArray arrayWithObjects:@"East Asia and Pacific",
                        @"Eastern Europe and Central Asia",
                        @"Latin America and Caribbean",
                        @"Middle East and North Africa",
                        @"South Asia",@"Sub-Saharan Africa",nil];
    
    _arrFarSys01Picker = [NSArray arrayWithObjects:@"Coastal artisanal fishing (not mapped)",
    @"Highland extensive mixed",
    @"Lowland rice",
    @"Pastoral",
    @"Root-tuber",
    @"Sparse (arid)",
    @"Sparse (forest)",
    @"Temperate mixed",
    @"Tree crop mixed",
    @"Upland intensive mixed",
    @"Urban based (not mapped)",nil];
    
    
    _arrFarSys02Picker = [NSArray arrayWithObjects:@"Extensive cereal-livestock",
    @"Forest based livestock",
    @"Horticulture mixed",
    @"Irrigated",
    @"Large scale cereal-vegetable",
    @"Mixed",
    @"Pastoral",
    @"Small scale cereal-livestock",
    @"Sparse (arid)",
    @"Sparse (cold)",
    @"Urban based (not mapped)",nil];
    
    _arrFarSys03Picker = [NSArray arrayWithObjects:@"Cereal-livestock (Campos)",
    @"Coastal plantation & mixed",
    @"Dryland mixed",
    @"Extensive dryland mixed (Gran Chaco)",
    @"Extensive mixed (Cerrados & Llanos)",
    @"Forest based",
    @"High altitude mixed (Central Andes)",
    @"Intensive highland mixed (North Andes)",
    @"Intensive mixed",
    @"Irrigated",
    @"Maize-beans (Mesoamerica)",
    @"Mediterranean mixed",
    @"Moist temperate mixed-forest",
    @"Pastoral",
    @"Sparse (forest)",
    @"Temperate mixed (Pampas)",
    @"Urban based (not mapped)",nil];
    
    _arrFarSys04Picker = [NSArray arrayWithObjects:@"Coastal artisanal fishing (not mapped)",
    @"Dryland mixed",
    @"Highland mixed",
    @"Irrigated",
    @"Pastoral",
    @"Rainfed mixed",
    @"Sparse (arid)",
    @"Urban based (not mapped)",nil];
    
    _arrFarSys05Picker = [NSArray arrayWithObjects:@"Coastal artisanal fishing",
    @"Dry rainfed",
    @"Highland mixed",
    @"Pastoral",
    @"Rainfed mixed",
    @"Rice",
    @"Rice-wheat",
    @"Sparse (arid)",
    @"Sparse (mountain)",
    @"Tree crop (not mapped)",
    @"Urban based (not mapped)",nil];
    
    _arrFarSys06Picker = [NSArray arrayWithObjects:@"Agro-pastoral millet/sorghum",
    @"Cereal-root crop mixed",
    @"Coastal artisanal fishing",
    @"Forest based",
    @"Highland perennial",
    @"Highland temperate mixed",
    @"Irrigated",
    @"Large commercial & smallholder",
    @"Maize mixed",
    @"Pastoral",
    @"Rice-tree crop",
    @"Root crop",
    @"Sparse (arid)",
    @"Tree crop",
    @"Urban based (not mapped)",nil];
    
    _arrFarSysDetailPicker = _arrFarSys01Picker;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView.tag == 1) {
        return _arrRegionPicker.count;
    } else {
        return _arrFarSysDetailPicker.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title;
    if (pickerView.tag == 1) {
        title = _arrRegionPicker[row];
    } else {
        title = _arrFarSysDetailPicker[row];
    }
    
    return title;
}

//[self searchAndLoadOficinasRegistrales];
-(void)pickerView:(UIPickerView *)pickerView
     didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    [self searchAndLoadFarmingSystemsByRegion];

//    NSString *resultString = [[NSString alloc]
//                              initWithFormat:
//                              @"selected: %@", _arrTobeShown[row][@"Nombre"]];
//    //_lblSelected.text = resultString;
}

- (void)searchAndLoadFarmingSystemsByRegion {
    
    int value;
    
    value = [_regionPickerView selectedRowInComponent:0];
        // arrFarSysDetailPicker
    switch (value) {
        case 0:
            _arrFarSysDetailPicker = _arrFarSys01Picker;
            break;
        case 1:
            _arrFarSysDetailPicker = _arrFarSys02Picker;
            break;
        case 2:
            _arrFarSysDetailPicker = _arrFarSys03Picker;
            break;
        case 3:
            _arrFarSysDetailPicker = _arrFarSys04Picker;
            break;
        case 4:
            _arrFarSysDetailPicker = _arrFarSys05Picker;
            break;
        case 5:
            _arrFarSysDetailPicker = _arrFarSys06Picker;
            break;
        default:
            break;
    }
        [_farmingSystemPickerView reloadAllComponents];
}
@end
