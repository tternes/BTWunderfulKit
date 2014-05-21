//
//  BTWTasksRequest.h
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWRequest.h"

@class BTWTasksRequest;
@protocol BTWTasksRequestDelegate <NSObject>
- (void)tasksRequest:(BTWTasksRequest *)request receivedTasks:(NSArray *)tasks;
@end

@interface BTWTasksRequest : BTWRequest
@property (nonatomic, weak) id<BTWTasksRequestDelegate> delegate;
+ (instancetype)tasksRequestWithToken:(NSString *)token;

@end
