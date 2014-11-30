//
//  QuestionsTableViewController.m
//  PSDHack
//
//  Created by Arturo Gamarra on 30/11/14.
//  Copyright (c) 2014 PSD. All rights reserved.
//

#import "QuestionsTableViewController.h"

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
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}

@end
