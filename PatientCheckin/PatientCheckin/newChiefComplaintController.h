//
//  newChiefComplaintController.h
//  patientLogin
//
//  Created by Phani Bhagav on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newChiefComplaintController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *complaintText;

-(void)getPatientId:(NSString*)patientIdentity;
@end
