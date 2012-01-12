//
//  patientLoginViewController.m
//  patientLogin
//
//  Created by Phani Bhagav on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "patientLoginViewController.h"
//#import "demographicsViewController.h"
#import "dataHandler.h"
#import "PLViewController.h"

@interface patientLoginViewController() 
{
    NSString* patientDataObtained;
    NSString* patientId;
    BOOL      newPatient;
}
@end
@implementation patientLoginViewController
@synthesize patientId = _patientId;
@synthesize patientPassword = _patientPassword;
@synthesize errorMessage = _errorMessage;


- (IBAction)loginPatient:(UIButton*)sender {
    patientId = self.patientId.text;
    NSString* password = self.patientPassword.text;
    if(patientId.length!=0 && password.length!=0)
    {
        NSString* dbQuery = [dataHandler getPatientData:patientId password:password];
        if(![dbQuery isEqualToString:@"invalidPwd"])
        {
            patientDataObtained = dbQuery;
            newPatient = false;
            int currentVCIndex = [self.navigationController.viewControllers indexOfObject:self.navigationController.topViewController];
            PLViewController* parentController = (PLViewController*)[self.navigationController.viewControllers objectAtIndex:currentVCIndex-1];
            parentController.patientInformation = patientDataObtained;
            parentController.patientIdentity = patientId;
            parentController.patientLoginBool = true;
            [self performSegueWithIdentifier:@"popLoginScreen" sender:self];
            self.errorMessage.hidden=true;
        }
        else
        {
            self.errorMessage.hidden=false;
            self.errorMessage.text = @"Invalid UserId/Password";
        }
        
    }
    else
    {
        self.errorMessage.hidden=false;
        self.errorMessage.text = @"Please enter User id pwd or click New User";
    }
    
}
- (IBAction)getNewPatientData:(id)sender {
    
    self.patientId.text = @"";
    self.patientPassword.text = @"";
    int randNum = arc4random()%999999;
    patientId = [NSString stringWithFormat:@"U%d",randNum];    
    newPatient = true;
    int currentVCIndex = [self.navigationController.viewControllers indexOfObject:self.navigationController.topViewController];
    PLViewController* parentController = (PLViewController*)[self.navigationController.viewControllers objectAtIndex:currentVCIndex-1];
    parentController.patientInformation = nil;
    parentController.patientIdentity = patientId;
    parentController.patientLoginBool = true;
    [self performSegueWithIdentifier:@"popLoginScreen" sender:self];
}



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setPatientId:nil];
    [self setPatientPassword:nil];
    [self setErrorMessage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
