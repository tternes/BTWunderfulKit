//
//  BTWunderfulKit.m
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWunderfulKit.h"
#import "BTWClient.h"
#import "BTWLoginRequest.h"
#import "BTWListsRequest.h"
#import "BTWTasksRequest.h"

@interface BTWunderfulKit () <BTWLoginRequestDelegate, BTWListsRequestDelegate, BTWTasksRequestDelegate>
@property (nonatomic, strong) NSString *token;

@property (nonatomic, strong) BTWClient *client;
@property (nonatomic, strong) BTWListsRequest *listsRequest;
@property (nonatomic, strong) BTWTasksRequest *tasksRequest;
@end

@implementation BTWunderfulKit

- (id)init
{
    self = [super init];
    if(self)
    {
        self.client = [[BTWClient alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    self.listsRequest.delegate = nil;
    self.listsRequest = nil;
    
    self.tasksRequest.delegate = nil;
    self.tasksRequest = nil;

    self.delegate = nil;
    self.client = nil;

}

#pragma mark - Authentication

- (void)loginWithUsername:(NSString *)username password:(NSString *)password
{
    BTWLoginRequest *loginRequest = [BTWLoginRequest loginRequestWithUsername:username password:password];
    loginRequest.delegate = self;
    [self.client sendRequest:loginRequest];
}

#pragma mark - Lists

- (void)retrieveLists
{
    self.listsRequest = [BTWListsRequest listsRequestWithToken:self.token];
    self.listsRequest.delegate = self;
    [self.client sendRequest:self.listsRequest];
}


#pragma mark - Tasks

- (void)retrieveTasks
{
    self.tasksRequest = [BTWTasksRequest tasksRequestWithToken:self.token];
    self.tasksRequest.delegate = self;
    [self.client sendRequest:self.tasksRequest];
}

#pragma mark - BTWLogingRequestDelegate

- (void)loginRequest:(BTWLoginRequest *)request receivedToken:(NSString *)token
{
    NSLog(@"%@: %@", request, token);
    self.token = token;
    [self.delegate kit:self tokenIsAvailable:YES];
}

- (void)loginRequest:(BTWLoginRequest *)request failedWithError:(NSError *)error
{
    NSLog(@"%@: %@", request, error);
}

- (void)listRequest:(BTWListsRequest *)request receivedLists:(NSArray *)lists
{
    NSLog(@"%@: %@", request, lists);
    [self.delegate kit:self receivedLists:lists];
}

- (void)tasksRequest:(BTWTasksRequest *)request receivedTasks:(NSArray *)tasks
{
    NSLog(@"%@: %@", request, tasks);
    for(id task in tasks)
    {
        NSString *title = task[@"title"];
        NSString *listId = task[@"list_id"];
        [self.delegate kit:self receivedTask:title inList:listId];
    }

}

@end
