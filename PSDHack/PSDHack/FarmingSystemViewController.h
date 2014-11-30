//
//  FarmingSystemViewController.h
//  pds
//
//  Created by Josky Jara on 11/30/14.
//  Copyright (c) 2014 Sunarp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FarmingSystemViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate>

//properties

@property (weak, nonatomic) IBOutlet UILabel *regionLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *farmingSystemPickerView;
@property (strong, nonatomic) NSString *region;

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;


//action

@end
