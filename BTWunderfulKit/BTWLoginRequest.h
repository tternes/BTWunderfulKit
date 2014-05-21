//
//  BTWunderfulLoginRequest.h
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWRequest.h"

@class BTWLoginRequest;
@protocol BTWLoginRequestDelegate <NSObject>

- (void)loginRequest:(BTWLoginRequest *)request receivedToken:(NSString *)token;
- (void)loginRequest:(BTWLoginRequest *)request failedWithError:(NSError *)error;

@end

@interface BTWLoginRequest : BTWRequest
@property (nonatomic, weak) id<BTWLoginRequestDelegate> delegate;

+ (instancetype)loginRequestWithUsername:(NSString *)username password:(NSString *)password;

@end
