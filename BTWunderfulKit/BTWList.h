//
//  BTWWunderfulList.h
//  BTWunderfulKit
//
//  Created by Thaddeus on 5/22/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTWObject.h"

@interface BTWList : BTWObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *listId;

@property (nonatomic, strong) NSDate *createdDate;
@property (nonatomic, strong) NSDate *updatedDate;

- (instancetype)initWithInfo:(NSDictionary *)info;

@end
