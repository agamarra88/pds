//
//  QuestionsTableViewController.m
//  PSDHack
//
//  Created by Arturo Gamarra on 30/11/14.
//  Copyright (c) 2014 PSD. All rights reserved.
//

#import "QuestionsTableViewController.h"
#import "Farmer.h"

@interface QuestionsTableViewController ()

@end

@implementation QuestionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // first we create a button and set it's properties
    UIBarButtonItem *myButton = [[UIBarButtonItem alloc]init];
    myButton.action = @selector(done:);
    myButton.title = @"Finalizar";
    myButton.target = self;
    
    // then we add the button to the navigation bar
    self.navigationItem.rightBarButtonItem = myButton;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger index = [self.answerCollections indexOfObject:textField];
    if (index != self.answerCollections.count -1) {
        index++;
        [[self.answerCollections objectAtIndex:index] becomeFirstResponder];
    } else {
        [self done:textField];
    }
    return NO;
}

- (IBAction)done:(id)sender {
    //Call service
    if (![self areQuestionsAnswered]) {
        UIAlertView *errorAlert = [[UIAlertView alloc]
                                   initWithTitle:@"Error" message:@"Por favor responder todas las preguntas" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [errorAlert show];
        return;
    }
    Farmer *farmer = [Farmer shareFarmer];
    farmer.cantidadHecatareas = [self.cantidadHectareas.text doubleValue];
    farmer.combustibleConsumido = [self.consumoCombutible.text doubleValue];
    farmer.cantidadMasaComposte = [self.cantidadComposte.text doubleValue];
    farmer.cantidadMasaBiogas = [self.cantidadMasaBiogas.text doubleValue];
    farmer.cabezaGanado = [self.cabezasGanado.text doubleValue];
    farmer.cantidadNitrogeno = [self.nitrogenoAplicado.text doubleValue];
    farmer.ureaAplicada = [self.ureaAplicada.text doubleValue];
    [farmer setCombustibleConsumido:farmer.combustibleConsumido withTipo:self.tipoCombustible.text];
    [farmer calculateCarbonoTotal];
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}

- (BOOL)areQuestionsAnswered {
    for (UITextField *textField in self.answerCollections) {
        if ([textField.text isEqualToString:@""]) {
            return false;
        }
    }
    return true;
}
@end
