//
//  BTWunderfulRequest.h
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTWUrlConnection.h"

@interface BTWRequest : NSMutableURLRequest <BTWConnectionDelegate>

+ (instancetype)requestForEndpoint:(NSString *)endpoint withParameters:(NSDictionary *)parameters token:(NSString *)token;
@end

