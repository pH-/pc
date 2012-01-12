//
//  demographicsViewController.m
//  patientLogin
//
//  Created by Phani Bhagav on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "demographicsViewController.h"
#import "newNameDetailsController.h"
#import "dataHandler.h"
#import "PLViewController.h"
@interface demographicsViewController()
{
    bool newPatientIndicator;
}
@end

@implementation demographicsViewController
@synthesize patientFirstName = _patientFirstName;
@synthesize patientLastName = _patientLastName;
@synthesize patientGender = _patientGender;
@synthesize patientInsuranceNum = _patientInsuranceNum;
@synthesize patientInsuranceCompany = _patientInsuranceCompany;
@synthesize patientInsuranceType = _patientInsuranceType;
@synthesize patientHealthHistory = _patientHealthHistory;
@synthesize patientChiefComplaint = _patientChiefComplaint;
@synthesize patientId = _patientId;
@synthesize pwdBox = _newPwdBox;
@synthesize patientInfo = _patientInfo;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize gender = _gender;
@synthesize insuranceNum = _insuranceNum;
@synthesize insuranceCompany = _insuranceCompany;
@synthesize insuranceType = _insuranceType;
@synthesize healthHistory = _healthHistory;
@synthesize chiefComplaint = _chiefComplaint;
@synthesize patientIdentity = _patientIdentity;

-(void)displayPatientData:(NSString *)patientData iD:(NSString *)iD
{
    self.patientIdentity = iD;
    if (patientData==nil) {
        newPatientIndicator=true;
    }
    else
    {
        self.patientInfo = patientData;
        [self updateData];
        newPatientIndicator = false;
    }

}
-(void)updateData
{
    NSString *patientData = self.patientInfo;
    NSArray* patientDetails = [patientData componentsSeparatedByString:@","];
    NSLog(@"details size:%d", [patientDetails count]);
    NSArray *names = [[patientDetails objectAtIndex:0] componentsSeparatedByString:@" "];
    self.firstName=[names objectAtIndex:0];
    if([names count]>1)
        self.lastName= [[[patientDetails objectAtIndex:0] componentsSeparatedByString:@" "]objectAtIndex:1];
    self.gender = [patientDetails objectAtIndex:1];
    self.insuranceNum = [patientDetails objectAtIndex:2];
    self.insuranceCompany = [patientDetails objectAtIndex:3];
    self.insuranceType = [patientDetails objectAtIndex:4];
    self.healthHistory = [patientDetails objectAtIndex:5];
    self.chiefComplaint = [patientDetails objectAtIndex:6];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"getNameData"])
    {
        [segue.destinationViewController getPatientId:self.patientIdentity];
    }
    if([segue.identifier isEqualToString:@"getNewInsuranceData"])
    {
        [segue.destinationViewController getPatientId:self.patientIdentity];
    }
    if([segue.identifier isEqualToString:@"getChiefComplaint"])
    {
        [segue.destinationViewController getPatientId:self.patientIdentity];
    }
}
- (IBAction)checkInPatient:(id)sender {
    NSString *history;
    history = self.chiefComplaint;
    NSLog(@"complaint:%@",self.chiefComplaint);
    NSLog(@"history:%@",history);
    [dataHandler updateHistory:self.patientIdentity history:history];
    
    int currentVCIndex = [self.navigationController.viewControllers indexOfObject:self.navigationController.topViewController];
    PLViewController* parentController = (PLViewController*)[self.navigationController.viewControllers objectAtIndex:currentVCIndex-1];
    parentController.lockScreen = true;
    
    [self performSegueWithIdentifier:@"checkinComplete" sender:self];
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

-(void)viewWillAppear:(BOOL)animated
{
    self.patientInfo = [dataHandler getPatientData:self.patientIdentity password:nil];
    if (newPatientIndicator==true) {
        self.pwdBox.text = @"Your New UserId is:";
        self.pwdBox.text = [self.pwdBox.text stringByAppendingFormat:@"%@ and your new Password is: password ",self.patientIdentity];
        self.pwdBox.hidden=false;
    }
    [self updateData];
    self.patientId.text = self.patientIdentity;
    if(![self.patientInfo isEqualToString:@"null,null,null,null,null,null,null"])
    {
        self.patientFirstName.text= self.firstName;
        self.patientLastName.text= self.lastName;
        self.patientGender.text = self.gender;
        self.patientInsuranceNum.text = self.insuranceNum;
        self.patientInsuranceCompany.text = self.insuranceCompany;
        self.patientInsuranceType.text = self.insuranceType;
        self.patientHealthHistory.text = self.healthHistory;
        self.patientChiefComplaint.text = self.chiefComplaint;
    }
    
    [super viewWillAppear:animated];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewDidUnload
{
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
