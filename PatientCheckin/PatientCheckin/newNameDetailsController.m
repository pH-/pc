//
//  newNameDetailsController.m
//  patientLogin
//
//  Created by Phani Bhagav on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "newNameDetailsController.h"
#import "demographicsViewController.h"
#import "dataHandler.h"

@interface newNameDetailsController()
@property (nonatomic,weak) NSString* patientId;
@end

@implementation newNameDetailsController
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize gender = _gender;
@synthesize patientId = _patientId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
- (IBAction)submitNewName:(id)sender {
    NSString* firstName = self.firstName.text;
    NSString* lastName = self.lastName.text;
    NSString* gender = self.gender.text;
    NSString* name = [firstName stringByAppendingFormat:@" %@",lastName];
    [dataHandler putNameData:self.patientId name:name gender:gender];
    [self dismissModalViewControllerAnimated:YES];
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
    [self setFirstName:nil];
    [self setLastName:nil];
    [self setGender:nil];
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
