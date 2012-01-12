//
//  demographicsViewController.h
//  patientLogin
//
//  Created by Phani Bhagav on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface demographicsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *patientFirstName;
@property (weak, nonatomic) IBOutlet UILabel *patientLastName;
@property (weak, nonatomic) IBOutlet UILabel *patientGender;
@property (weak, nonatomic) IBOutlet UILabel *patientInsuranceNum;
@property (weak, nonatomic) IBOutlet UILabel *patientInsuranceCompany;
@property (weak, nonatomic) IBOutlet UILabel *patientInsuranceType;
@property (weak, nonatomic) IBOutlet UILabel *patientHealthHistory;
@property (weak, nonatomic) IBOutlet UILabel *patientChiefComplaint;
@property (weak, nonatomic) IBOutlet UILabel *patientId;
@property (weak, nonatomic) IBOutlet UILabel *pwdBox;


@property (nonatomic,weak) NSString* patientInfo;
@property (nonatomic,weak) NSString* firstName;
@property (nonatomic,weak) NSString* lastName;
@property (nonatomic,weak) NSString* gender;
@property (nonatomic,weak) NSString* insuranceNum;
@property (nonatomic,weak) NSString* insuranceCompany;
@property (nonatomic,weak) NSString* insuranceType;
@property (nonatomic,weak) NSString* healthHistory;
@property (nonatomic,weak) NSString* chiefComplaint;
@property (nonatomic,weak) NSString* patientIdentity;

-(void)displayPatientData:(NSString*)patientData iD:(NSString*)iD;
//-(void)updateNameData:(NSString*)firstName lastName:(NSString*)lastName gender:(NSString*)gender;
//-(void)updateInsuranceData:(NSString*)number company:(NSString*)company type:(NSString*) type;
-(void)updateData;


@end
