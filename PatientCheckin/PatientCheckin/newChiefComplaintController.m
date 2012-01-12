//
//  newChiefComplaintController.m
//  patientLogin
//
//  Created by Phani Bhagav on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "newChiefComplaintController.h"
#import "demographicsViewController.h"
#import "dataHandler.h"
@interface newChiefComplaintController()
@property (nonatomic,weak) NSString* patientId;
@end
@implementation newChiefComplaintController
@synthesize complaintText;
@synthesize patientId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
- (IBAction)putInDb:(id)sender {
    
    [dataHandler addChiefComplaint:self.patientId complaint:self.complaintText.text];
    [self dismissModalViewControllerAnimated:YES];
}

-(void)getPatientId:(NSString*)patientIdentity
{
    self.patientId = patientIdentity;
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
    [self setComplaintText:nil];
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
