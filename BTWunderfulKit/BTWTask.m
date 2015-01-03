//
//  BTWunderfulTask.m
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/22/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWTask.h"

@implementation BTWTask

- (instancetype)initWithInfo:(NSDictionary *)info
{
    self = [super init];
    if(self)
    {
#if 0
        {
            "assignee_id" = "<null>";
            "completed_at" = "<null>";
            "completed_by_id" = "<null>";
            "created_at" = "2014-05-22T13:39:40Z";
            "created_by_id" = "AA_vAABdNEA";
            "deleted_at" = "<null>";
            "due_date" = "<null>";
            id = ACxYACUpSgI;
            "list_id" = ABxYAABZpmU;
            "local_identifier" = "localId:Mac:AA_vAABdNEA:Task:911FCD0E-B250-4283-B163-9DF01D37AF33";
            note = "<null>";
            "owner_id" = "AA_vAABdNEA";
            "parent_id" = "<null>";
            position = "-20";
            "recurrence_count" = 0;
            "recurrence_type" = "<null>";
            "recurring_parent_id" = "<null>";
            starred = 0;
            title = "Cream Cheese";
            type = Task;
            "updated_at" = "2014-05-22T13:39:40Z";
            "updated_by_id" = "AA_vAABdNEA";
            "user_id" = "AA_vAABdNEA";
        },
#endif
        
        self.title = info[@"title"];
        self.taskId = info[@"id"];
        self.userId = info[@"user_id"];
        self.listId = info[@"list_id"];
        
        if([info[@"completed_at"] isEqualTo:[NSNull null]])
            self.isComplete = NO;
        else
            self.isComplete = YES;
        
        if([info[@"deleted_at"] isEqual:[NSNull null]])
            self.isDeleted = YES;
        else
            self.isDeleted = NO;
    }
    return self;
}

- (void)dealloc
{
    self.title = nil;
    self.userId = nil;
    
    self.createdDate = nil;
    self.updatedDate = nil;
    self.completedDate = nil;
    self.dueDate = nil;
}

@end
