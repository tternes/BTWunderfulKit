//
//  BTWListsRequest.m
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWListsRequest.h"

@implementation BTWListsRequest

+ (instancetype)listsRequestWithToken:(NSString *)token
{
    BTWListsRequest *request = [BTWListsRequest requestForEndpoint:@"/me/lists"
                                                    withParameters:nil
                                                             token:token];

    request.HTTPMethod = @"GET";
    return request;
}

- (void)connection:(BTWUrlConnection *)connection receivedResponse:(NSData *)data withStatus:(NSUInteger)statusCode
{
    NSError *jsonError = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    
    id lists = json;
    if(lists)
        [self.delegate listRequest:self receivedLists:json];
    else
    {
//        id info = @{
//                    NSLocalizedDescriptionKey : @"failed to retrieve token from login response"
//                    };
//        NSError *error = [NSError errorWithDomain:@"co.bluetoo"
//                                             code:1000
//                                         userInfo:info];
//        [self.delegate loginRequest:self failedWithError:error];
    }
}

- (void)connection:(BTWUrlConnection *)connection receivedError:(NSError *)error
{
    
}

@end
