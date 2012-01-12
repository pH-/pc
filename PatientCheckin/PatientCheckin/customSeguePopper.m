//
//  customSegueLogin.m
//  patientLogin
//
//  Created by Phani Bhagav on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "customSeguePopper.h"

@implementation customSeguePopper

-(void)perform {
    UIViewController *sourceVC = (UIViewController *) self.sourceViewController;
    
    [UIView transitionWithView:sourceVC.navigationController.view duration:0.2
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        [sourceVC.navigationController popViewControllerAnimated:YES];
                    }
                    completion:NULL];
    
}

@end
