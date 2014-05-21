//
//  BTWunderfulLoginRequest.m
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWLoginRequest.h"

@implementation BTWLoginRequest

+ (instancetype)loginRequestWithUsername:(NSString *)username password:(NSString *)password
{
    BTWLoginRequest *request = [BTWLoginRequest requestForEndpoint:@"/login"
                                                    withParameters:@{ @"email":username, @"password":password }
                                                             token:nil];
    request.HTTPMethod = @"POST";
    return request;
}

- (void)connection:(BTWUrlConnection *)connection receivedResponse:(NSData *)data withStatus:(NSUInteger)statusCode
{
    NSError *jsonError = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

    NSString *token = json[@"token"];
    if(token)
        [self.delegate loginRequest:self receivedToken:token];
    else
    {
        id info = @{
            NSLocalizedDescriptionKey : @"failed to retrieve token from login response"
        };
        NSError *error = [NSError errorWithDomain:@"co.bluetoo"
                                             code:1000
                                         userInfo:info];
        [self.delegate loginRequest:self failedWithError:error];
    }
}

- (void)connection:(BTWUrlConnection *)connection receivedError:(NSError *)error
{

}

@end
