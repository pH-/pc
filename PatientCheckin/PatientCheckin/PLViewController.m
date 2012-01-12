//
//  PLViewController.m
//  patientLogin
//
//  Created by Phani Bhagav on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PLViewController.h"
#import "patientLoginViewController.h"
#import "demographicsViewController.h"


@implementation PLViewController

@synthesize patientInformation = _patientInformation;
@synthesize patientIdentity = _patientIdentity;
@synthesize lockScreen = _lockScreen;
@synthesize patientLoginBool = _patientLoginBool;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)loginPatient:(id)sender {
    
    self.patientLoginBool = false;
    [self performSegueWithIdentifier:@"getPatientLogin" sender:self];
//    [self performSegueWithIdentifier:@"displayPatientData" sender:self];
    
}
- (IBAction)loginStaffMember:(id)sender {
    self.patientLoginBool = false;
    [self performSegueWithIdentifier:@"staffLogin" sender:self];
//    [self performSegueWithIdentifier:@"displayPatientData" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"displayPatientData"])
    {
        [segue.destinationViewController displayPatientData:self.patientInformation iD:self.patientIdentity];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    if(!self.lockScreen && self.patientLoginBool)
    {
        [self performSegueWithIdentifier:@"displayPatientData" sender:self];
        self.patientLoginBool=false;
    }
    else if(self.lockScreen)
    {
        [self performSegueWithIdentifier:@"staffLogin" sender:self];
    }
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
