//
//  dataHandler.h
//  patientLogin
//
//  Created by Phani Bhagav on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataHandler : NSObject

@property (nonatomic,weak) NSArray* insuranceDetailsNew;

+(NSString*)getPatientData:(NSString*)userName password:(NSString*)password;
+(NSString*)MD5:(NSString*)input;
+(void)putNameData:(NSString*)iD name:(NSString*)name gender:(NSString*)gender;
+(void)putInsuranceData:(NSString*)iD insuranceNum:(NSString*)number company:(NSString*)company type:(NSString*)type;
+(void)addChiefComplaint:(NSString*)iD complaint:(NSString*)complaint;
+(void)updateDbWithJson:(NSData*)jsonToSend;
+(void)updateHistory:(NSString*)iD history:(NSString*)complaintHistory;
+(NSString*)loginStaff:(NSString*)userName pwd:(NSString*)password;

@end
