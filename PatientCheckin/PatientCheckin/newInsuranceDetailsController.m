//
//  newInsuranceDetailsController.m
//  patientLogin
//
//  Created by Phani Bhagav on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "newInsuranceDetailsController.h"
#import "demographicsViewController.h"
#import "dataHandler.h"
@interface newInsuranceDetailsController()
@property (nonatomic,weak) NSString* patientId;
@end

@implementation newInsuranceDetailsController
@synthesize insuranceNum = _insuranceNum;
@synthesize insuranceCompany = _insuranceCompany;
@synthesize insuranceType = _insuranceType;
@synthesize patientId = _patientId;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)submitNewData:(id)sender {
    NSString* insuranceNumNew = self.insuranceNum.text;
    NSString* insuranceCompanyNew = self.insuranceCompany.text;
    NSString* insuranceTypeNew = self.insuranceType.text;
    [dataHandler putInsuranceData:self.patientId insuranceNum:insuranceNumNew company:insuranceCompanyNew type:insuranceTypeNew];
    [self dismissModalViewControllerAnimated:YES];
    
    
}
-(void)getPatientId:(NSString*)patientId
{
    self.patientId = patientId;
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [self setInsuranceNum:nil];
    [self setInsuranceCompany:nil];
    [self setInsuranceType:nil];
    [self setInsuranceType:nil];
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
