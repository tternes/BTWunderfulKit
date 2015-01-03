//
//  BTWWunderfulList.m
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/22/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWList.h"

@implementation BTWList

- (instancetype)initWithInfo:(NSDictionary *)info
{
    self = [super init];
    if(self)
    {
#if 0
        {
            "created_at" = "2013-08-19T13:08:02Z";
            id = "AB_vAATtDNo";
            "local_identifier" = "localId:iPhone:AA_vAABdNEA:List:19C77C76-5620-4D72-8D9D-945E576B53AA";
            "owner_id" = "AA_vAABdNEA";
            position = "44.9999";
            title = Meals;
            type = List;
            "updated_at" = "2014-05-16T23:59:35Z";
        },
#endif
        self.listId = info[@"id"];
        self.title = info[@"title"];
    }
    return self;
}

- (void)dealloc
{
    self.title = nil;
    self.listId = nil;
    
    self.createdDate = nil;
    self.updatedDate = nil;
}

@end
