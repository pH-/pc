//
//  staffLoginViewController.m
//  patientLogin
//
//  Created by Phani Bhagav on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "staffLoginViewController.h"
#import "PLViewController.h"
#import "dataHandler.h"


@implementation staffLoginViewController
@synthesize staffId;
@synthesize staffPassword;
@synthesize errorMessage;


- (IBAction)loginStaff:(id)sender {
    
    NSString* pwdCheck = [dataHandler loginStaff:self.staffId.text pwd:self.staffPassword.text];
    if([pwdCheck isEqualToString:@"validPwd"])
    {
        int currentVCIndex = [self.navigationController.viewControllers indexOfObject:self.navigationController.topViewController];
        PLViewController* parentController = (PLViewController*)[self.navigationController.viewControllers objectAtIndex:currentVCIndex-1];
        parentController.lockScreen=false;
        parentController.patientLoginBool=false;
        [self performSegueWithIdentifier:@"unlockScreen" sender:self];
    }
    else
    {
        self.errorMessage.hidden=false;
        self.errorMessage.text = @"Invalid LoginId/Password";
    }
        
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
    [self.navigationController setNavigationBarHidden:true];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [self setStaffId:nil];
    [self setStaffPassword:nil];
    [self setErrorMessage:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
