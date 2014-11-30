//
//  ResultsTableViewController.m
//  PSDHack
//
//  Created by Josky Jara on 11/30/14.
//  Copyright (c) 2014 PSD. All rights reserved.
//

#import "ResultsTableViewController.h"

@interface ResultsTableViewController ()

@property (strong, nonatomic) NSString *resultOutput;
@property (strong, nonatomic) NSArray *arrTratamientos;
@property (strong, nonatomic) NSArray *arrTratamientosDetalle;

@end

@implementation ResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _resultOutput = @"title 01;1.9;10|title 02;.8;6";
    _arrTratamientos = [_resultOutput componentsSeparatedByString:@"|"];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return _arrTratamientos.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
        return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"cellName";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    _arrTratamientosDetalle = [_arrTratamientos[indexPath.row] componentsSeparatedByString:@";"];
    
//    NSArray *aKeys = nil;
//    NSArray *aValues = nil;
    
    //NSDictionary *daysWeather = nil;
    
//    switch (indexPath.section) {
//        case 0: {
//            aKeys = [_solicitud SolicBasicInfoKeys];
//            aValues = [_solicitud SolicBasicInfoValues];
//            break;
//        }
//        case 1: {
//            //            NSArray *upcomingWeather = [self.weather upcomingWeather];
//            //            daysWeather = upcomingWeather[indexPath.row];
//            aKeys = [_solicitud SolicRequestInfoKeys];
//            aValues = [_solicitud SolicRequestInfoValues];
//            break;
//        }
//        case 2: {
//            aKeys = [_solicitud SolicSourceInfoKeys];
//            aValues = [_solicitud SolicSourceInfoValues];
//            break;
//        }
//        case 3: {
//            aKeys = [_solicitud SolicPaymentInfoKeys];
//            aValues = [_solicitud SolicPaymentInfoValues];
//            break;
//        }
//        default:
//            break;
//    }
    cell.textLabel.text = @"titulo";
    cell.detailTextLabel.text = @"detalle";
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    sectionName = @"2222";
    
//    switch (section)
//    {
//        case 0:
//            sectionName = NSLocalizedString(@"DATOS BÁSICOS DE LA SOLICITUD", @"mySectionName");
//            break;
//        case 1:
//            sectionName = NSLocalizedString(@"1. DATOS DEL SOLICITANTE", @"myOtherSectionName");
//            break;
//        case 2:
//            sectionName = NSLocalizedString(@"2. DATOS DEL DESTINATARIO", @"myOtherSectionName");
//            break;
//        case 3:
//            sectionName = NSLocalizedString(@"3. DATOS DEL PAGO", @"myOtherSectionName");
//            break;
//        default:
//            sectionName = @"";
//            break;
//    }
    return sectionName;
}
@end
