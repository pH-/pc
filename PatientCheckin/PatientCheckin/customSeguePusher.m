//
//  customSegueGetLoginScreen.m
//  patientLogin
//
//  Created by Phani Bhagav on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "customSeguePusher.h"

@implementation customSeguePusher
-(void)perform {
    UIViewController *sourceVC = (UIViewController *) self.sourceViewController;
    UIViewController *destinationVC = (UIViewController *) self.destinationViewController;
    
    [UIView transitionWithView:sourceVC.navigationController.view duration:0.2
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [sourceVC.navigationController pushViewController:destinationVC animated:NO];
                    }
                    completion:NULL];
    
}
@end
