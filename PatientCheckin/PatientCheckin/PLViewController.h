//
//  PLViewController.h
//  patientLogin
//
//  Created by Phani Bhagav on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "patientLoginViewController.h"
#import "staffLoginViewController.h"

@interface PLViewController : UIViewController {
    patientLoginViewController *patientLogin;
    staffLoginViewController *staffLogin;
}

@property (nonatomic,weak) NSString* patientInformation;
@property (nonatomic,weak) NSString* patientIdentity;
@property (nonatomic) bool lockScreen;
@property (nonatomic) bool patientLoginBool;


@end
