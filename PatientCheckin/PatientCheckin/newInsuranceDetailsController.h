//
//  newInsuranceDetailsController.h
//  patientLogin
//
//  Created by Phani Bhagav on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface newInsuranceDetailsController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *insuranceNum;
@property (weak, nonatomic) IBOutlet UITextField *insuranceCompany;
@property (weak, nonatomic) IBOutlet UITextField *insuranceType;

-(void)getPatientId:(NSString*)patientId;
@end
