//
//  newNameDetailsController.h
//  patientLogin
//
//  Created by Phani Bhagav on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface newNameDetailsController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *gender;
-(void)getPatientId:(NSString*)patientId;
@end
