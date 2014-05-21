//
//  BTWUrlConnection.m
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWUrlConnection.h"

@interface BTWUrlConnection ()
@property (nonatomic, assign) NSUInteger statusCode;
@property (nonatomic, strong) NSString *contentType;
@property (nonatomic, strong) NSMutableData *receivedData;
@end

@implementation BTWUrlConnection

- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate
{
    self = [super initWithRequest:request delegate:self];
    if(self)
    {
        self.statusCode = 0;
        self.receivedData = [NSMutableData data];
    }
    return self;
}

- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately
{
    self = [super initWithRequest:request delegate:self startImmediately:startImmediately];
    if(self)
    {
        self.statusCode = 0;
        self.receivedData = [NSMutableData data];
    }
    return self;
}

- (void)dealloc
{
    self.receivedData = nil;
}

#pragma mark - NSURLConnection

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%s: %@", __PRETTY_FUNCTION__, error);
    [self.delegate connection:self receivedError:error];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"response: %@", response);
    NSLog(@"%s: %ld", __PRETTY_FUNCTION__, (long)httpResponse.statusCode);

    // TODO: content-length checking
    self.receivedData = [NSMutableData data];

    self.statusCode = httpResponse.statusCode;
    self.contentType = httpResponse.allHeaderFields[@"Content-Type"];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"%s: bytes=%ld", __PRETTY_FUNCTION__, (long)[data length]);
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"finished");
    
    [self.delegate connection:self receivedResponse:self.receivedData withStatus:self.statusCode];
}


@end
