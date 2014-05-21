//
//  BTWunderfulRequest.m
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWRequest.h"

#define WUNDERLIST_API_BASE @"https://api.wunderlist.com"

@interface BTWRequest ()
@property (nonatomic, assign) NSUInteger httpResponseCode;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, strong) NSString *contentType;
@end

@implementation BTWRequest

+ (instancetype)requestForEndpoint:(NSString *)endpoint withParameters:(NSDictionary *)parameters token:(NSString *)token
{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@%@", WUNDERLIST_API_BASE, endpoint];
    
    __block NSUInteger count = 0;
    [parameters enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        if(count == 0) [url appendString:@"?"];
        else [url appendString:@"&"];
        
        [url appendFormat:@"%@=%@", key, obj];
        count++;
    }];

    id request = [[self class] requestWithURL:[NSURL URLWithString:url]];
    if(token)
    {
        [request setValue:[NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
    }
    return request;
}

#pragma mark - BTWUrlConnection

- (void)connection:(BTWUrlConnection *)connection receivedResponse:(NSData *)data withStatus:(NSUInteger)statusCode
{
    NSAssert(NO, @"must be implemented in subclasses");
}

- (void)connection:(BTWUrlConnection *)connection receivedError:(NSError *)error
{
    NSAssert(NO, @"must be implemented in subclasses");
}

@end
