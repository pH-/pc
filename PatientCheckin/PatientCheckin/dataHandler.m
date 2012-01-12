//
//  dataHandler.m
//  patientLogin
//
//  Created by Phani Bhagav on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "dataHandler.h"
#import <CommonCrypto/CommonDigest.h>


@implementation dataHandler

@synthesize insuranceDetailsNew = _insuranceDetailsNew;

+(NSString*)getPatientData:(NSString*)userName password:(NSString*)password
{
    NSString* patientDataObtained=nil;
    NSString* serverAddress = @"http://localhost:8080/PatientLogin/rest/checkin?userid=";
    serverAddress=[serverAddress stringByAppendingString:userName];
    NSString* responseString;
    NSData *response1;
    NSURLResponse *urlResponse = nil;
    NSError *requestError;
    if(password!=nil)
    {
        NSString* encryptedPwd = [self MD5:password];
        serverAddress=[serverAddress stringByAppendingString:@"&pwd="];
        serverAddress=[serverAddress stringByAppendingString:encryptedPwd];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:serverAddress]];
        [request setHTTPMethod: @"GET"];
        response1 = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
        responseString = [NSString alloc];
        responseString = [responseString initWithData:response1 encoding:NSUTF8StringEncoding];
    }
    if([responseString isEqualToString:@"validPwd"] || password==nil)
    {
        NSString* serverAddress = @"http://localhost:8080/PatientLogin/rest/checkin?userid=";
        serverAddress=[serverAddress stringByAppendingString:userName];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:serverAddress]];
        [request setHTTPMethod: @"GET"];
        response1 = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
        patientDataObtained = [[NSString alloc] initWithData:response1 encoding:NSUTF8StringEncoding];
        return patientDataObtained;
    }
    else
        return @"invalidPwd";

}

+(NSString*)loginStaff:(NSString*)userName pwd:(NSString*)password
{
    NSString* serverAddress = @"http://localhost:8080/PatientLogin/rest/checkin?userid=";
    serverAddress=[serverAddress stringByAppendingString:userName];
    NSString* encryptedPwd = [self MD5:password];
    serverAddress=[serverAddress stringByAppendingFormat:@"&pwd=%@&staff=Y",encryptedPwd];
    NSString* responseString;
    NSData *response1;
    NSURLResponse *urlResponse = nil;
    NSError *requestError;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:serverAddress]];
    [request setHTTPMethod: @"GET"];
    response1 = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    responseString = [NSString alloc];
    responseString = [responseString initWithData:response1 encoding:NSUTF8StringEncoding];
    return responseString;
}

+(NSString*)MD5:(NSString*)input
{
    const char *ptr = [input UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(ptr, strlen(ptr), md5Buffer);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) 
        [output appendFormat:@"%02x",md5Buffer[i]];
    return output;
}
+(void)putNameData:(NSString*)iD name:(NSString*)name gender:(NSString*)gender
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:iD, @"id",name, @"name", gender, @"gender", nil];
    NSError *error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"Json string:%@", jsonString);
    [dataHandler updateDbWithJson:jsonData];
}

+(void)putInsuranceData:(NSString*)iD insuranceNum:(NSString*)number company:(NSString*)company type:(NSString*)type
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:iD, @"id", number, @"insuranceNum", company, @"insuranceCompany", type, @"insuranceType", nil];
    NSError *error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"Json string:%@", jsonString);
    [dataHandler updateDbWithJson:jsonData];
}

+(void)addChiefComplaint:(NSString*)iD complaint:(NSString*)complaint
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:iD, @"id", complaint, @"chiefComplaint", nil];
    NSError *error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"Json string:%@", jsonString);
    [dataHandler updateDbWithJson:jsonData];
}
+(void)updateHistory:(NSString*)iD history:(NSString*)complaintHistory
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:iD, @"id", complaintHistory, @"healthHistory", nil];
    NSError *error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"Json string:%@", jsonString);
    [dataHandler updateDbWithJson:jsonData];
}
+(void)updateDbWithJson:(NSData*)jsonToSend
{
    NSURLResponse *urlResponse = nil;
    NSError *requestError;
    NSString* serverAddress = @"http://localhost:8080/PatientLogin/rest/checkin";

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:serverAddress]];
    [request setHTTPMethod: @"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [jsonToSend length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:jsonToSend];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"Response obtained: %@",responseString);
}
@end
