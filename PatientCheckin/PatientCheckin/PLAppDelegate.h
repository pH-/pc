//
//  PLAppDelegate.h
//  patientLogin
//
//  Created by Phani Bhagav on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLViewController.h"

@interface PLAppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
    PLViewController *homePage;
}

@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) IBOutlet PLViewController *homePage;

@end
