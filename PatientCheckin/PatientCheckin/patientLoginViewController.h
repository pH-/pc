//
//  patientLoginViewController.h
//  patientLogin
//
//  Created by Phani Bhagav on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface patientLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *patientId;
@property (weak, nonatomic) IBOutlet UITextField *patientPassword;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;

@end
