//
//  staffLoginViewController.h
//  patientLogin
//
//  Created by Phani Bhagav on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface staffLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *staffId;
@property (weak, nonatomic) IBOutlet UITextField *staffPassword;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;

@end
