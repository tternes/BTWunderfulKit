//
//  BTWunderfulClient.h
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTWRequest.h"

@interface BTWClient : NSObject

@property (nonatomic, strong) NSString *token;

- (void)sendRequest:(BTWRequest *)request;

@end
