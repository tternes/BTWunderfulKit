//
//  BTWUrlConnection.h
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BTWUrlConnection;
@protocol BTWConnectionDelegate <NSObject>

@required
- (void)connection:(BTWUrlConnection *)connection receivedResponse:(NSData *)data withStatus:(NSUInteger)statusCode;
- (void)connection:(BTWUrlConnection *)connection receivedError:(NSError *)error;

@end

@interface BTWUrlConnection : NSURLConnection

@property (nonatomic, weak) id<BTWConnectionDelegate> delegate;

@end
