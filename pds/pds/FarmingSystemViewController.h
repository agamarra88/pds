//
//  FarmingSystemViewController.h
//  pds
//
//  Created by Josky Jara on 11/30/14.
//  Copyright (c) 2014 Sunarp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FarmingSystemViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

//properties
@property (weak, nonatomic) IBOutlet UIPickerView *regionPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *farmingSystemPickerView;

//action

@end
