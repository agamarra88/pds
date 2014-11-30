//
//  QuestionsTableViewController.h
//  PSDHack
//
//  Created by Arturo Gamarra on 30/11/14.
//  Copyright (c) 2014 PSD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsTableViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSString *region;
@property (strong, nonatomic) NSString *farmSystem;
@property (weak, nonatomic) IBOutlet UITextField *cantidadHectareas;
@property (weak, nonatomic) IBOutlet UITextField *tipoCombustible;
@property (weak, nonatomic) IBOutlet UITextField *consumoCombutible;
@property (weak, nonatomic) IBOutlet UITextField *cantidadComposte;
@property (weak, nonatomic) IBOutlet UITextField *cantidadMasaBiogas;
@property (weak, nonatomic) IBOutlet UITextField *cabezasGanado;
@property (weak, nonatomic) IBOutlet UITextField *nitrogenoAplicado;
@property (weak, nonatomic) IBOutlet UITextField *ureaAplicada;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *answerCollections;

@end
