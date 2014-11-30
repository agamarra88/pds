//
//  FarmingSystemViewController.m
//  pds
//
//  Created by Josky Jara on 11/30/14.
//  Copyright (c) 2014 Sunarp. All rights reserved.
//

#import "FarmingSystemViewController.h"
#import "LandRegions.h"
#import "Farmer.h"
#import "QuestionsTableViewController.h"

@interface FarmingSystemViewController ()

@property (strong, nonatomic) NSDictionary *dictFarmSys;

@end

@implementation FarmingSystemViewController{
    
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSArray *eastAsiaPacific = [NSArray arrayWithObjects:@"Coastal artisanal fishing (not mapped)",
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
    
    
    NSArray *easternEuropeCentralAsia = [NSArray arrayWithObjects:@"Extensive cereal-livestock",
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
    
    NSArray *latinAmerica = [NSArray arrayWithObjects:@"Cereal-livestock (Campos)",
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
    
    NSArray *middleEastNorthAfrica = [NSArray arrayWithObjects:@"Coastal artisanal fishing (not mapped)",
                          @"Dryland mixed",
                          @"Highland mixed",
                          @"Irrigated",
                          @"Pastoral",
                          @"Rainfed mixed",
                          @"Sparse (arid)",
                          @"Urban based (not mapped)",nil];
    
    NSArray *southAsia = [NSArray arrayWithObjects:@"Coastal artisanal fishing",
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
    
    NSArray *subSaharan = [NSArray arrayWithObjects:@"Agro-pastoral millet/sorghum",
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
    
    NSMutableDictionary *mutable = [NSMutableDictionary new];
    [mutable setObject:subSaharan forKey:@"Sub-Saharan Africa"];
    [mutable setObject:middleEastNorthAfrica forKey:@"Middle East and North Africa"];
    [mutable setObject:easternEuropeCentralAsia forKey:@"Eastern Europe and Central Asia"];
    [mutable setObject:southAsia forKey:@"South Asia"];
    [mutable setObject:eastAsiaPacific forKey:@"East Asia and Pacific"];
    [mutable setObject:latinAmerica forKey:@"Latin America and Caribbean"];
    
     self.dictFarmSys = mutable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLocale *currentLocation = [NSLocale currentLocale];
    NSString *value = [currentLocation.localeIdentifier substringFromIndex:3];
    self.region = [self getRegionFromLocation:value];
    self.regionLabel.text = self.region;
    
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    
    [self setupMapView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowQuestions"]) {
        QuestionsTableViewController *destinationVC = (QuestionsTableViewController *)segue.destinationViewController;
        NSInteger row = [self.farmingSystemPickerView selectedRowInComponent:0];
        NSArray *farmSystems = self.dictFarmSys[self.region];
        destinationVC.farmSystem = farmSystems[row];
        destinationVC.region = self.region;
        
        Farmer *farmer = [Farmer shareFarmer];
        farmer.farmSystem = farmSystems[row];
        farmer.region = self.region;
        farmer.latitude = [self.latitudeLabel.text doubleValue];
        farmer.longitude = [self.longitudeLabel.text doubleValue];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *farmSystems = self.dictFarmSys[self.region];
    return farmSystems.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *farmSystems = self.dictFarmSys[self.region];
    return farmSystems[row];
}

- (NSString *)getRegionFromLocation:(NSString *)location {
    LandRegions *landregions = [[LandRegions alloc] init];
    for (NSString* key in landregions.landregions.allKeys) {
        NSArray *countries = landregions.landregions[key];
        for (NSString *country in countries) {
            if ([location isEqualToString:country]) {
                return key;
            }
        }
    }
    return nil;
}


- (IBAction)getCurrentLocation:(id)sender {
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        _longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        _latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    
    // Reverse Geocoding
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            _addressLabel.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                  placemark.subThoroughfare, placemark.thoroughfare,
                                  placemark.postalCode, placemark.locality,
                                  placemark.administrativeArea,
                                  placemark.country];
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
}

- (void)setupMapView
{
    
    //
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];
}
@end
