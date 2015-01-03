//
//  BTWunderfulKit.h
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTWTask.h"

@class BTWunderfulKit;
@protocol BTWunderfulKitDelegate <NSObject>

- (void)kit:(BTWunderfulKit *)kit tokenIsAvailable:(BOOL)available;

- (void)kit:(BTWunderfulKit *)kit receivedLists:(NSArray *)lists;


- (void)kit:(BTWunderfulKit *)kit receivedTask:(BTWTask *)task;
- (void)kitFinishedReceivingLists:(BTWunderfulKit *)kit;

@end

@interface BTWunderfulKit : NSObject

@property (nonatomic, weak) id<BTWunderfulKitDelegate> delegate;

#pragma mark - Authentication
- (void)loginWithUsername:(NSString *)username password:(NSString *)password;

#pragma mark - Lists
- (void)retrieveLists;
//- (void)addListNamed:(NSString *)listName;
//- (void)deleteListNamed:(NSString *)listName;

#pragma mark - Tasks
- (void)retrieveTasks;
//- (void)addTask:(NSString *)task toList:(NSString *)listName;
//- (void)completeTask:(NSString *)task inList:(NSString *)listName;

@end
