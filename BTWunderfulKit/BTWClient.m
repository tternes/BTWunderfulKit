//
//  BTWunderfulClient.m
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWClient.h"
#import "BTWUrlConnection.h"

@implementation BTWClient

- (void)sendRequest:(BTWRequest *)request
{
    NSLog(@"request: %@", request);
    BTWUrlConnection *connection = [[BTWUrlConnection alloc] initWithRequest:request delegate:self];
    connection.delegate = request;
    [connection start];
}

@end
