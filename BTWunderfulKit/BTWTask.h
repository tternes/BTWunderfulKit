//
//  BTWunderfulTask.h
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/22/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWObject.h"

@interface BTWTask : BTWObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *taskId;
@property (nonatomic, strong) NSString *listId;
@property (nonatomic, strong) NSString *userId;

@property (nonatomic, assign) BOOL isComplete;
@property (nonatomic, assign) BOOL isDeleted;

@property (nonatomic, strong) NSDate *createdDate;
@property (nonatomic, strong) NSDate *updatedDate;
@property (nonatomic, strong) NSDate *completedDate;
@property (nonatomic, strong) NSDate *dueDate;

- (instancetype)initWithInfo:(NSDictionary *)info;

@end
