//
//  BTWListsRequest.h
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWRequest.h"

@class BTWListsRequest;
@protocol BTWListsRequestDelegate <NSObject>
- (void)listRequest:(BTWListsRequest *)request receivedLists:(NSArray *)lists;
@end

@interface BTWListsRequest : BTWRequest
@property (nonatomic, weak) id<BTWListsRequestDelegate> delegate;
+ (instancetype)listsRequestWithToken:(NSString *)token;

@end
