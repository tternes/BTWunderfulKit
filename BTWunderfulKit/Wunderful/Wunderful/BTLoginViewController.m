//
//  BTLoginViewController.m
//  Wunderful
//
//  Created by Thaddeus on 5/20/14.
//  Copyright (c) 2014 Bluetoo. All rights reserved.
//

#import "BTLoginViewController.h"
#import "BTWunderfulKit.h"

@interface BTLoginViewController () <BTWunderfulKitDelegate>
@property (nonatomic, weak) IBOutlet UITextField *usernameField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) BTWunderfulKit *wunderkit;
@end

@implementation BTLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.wunderkit = [[BTWunderfulKit alloc] init];
    self.wunderkit.delegate = self;
}

- (void)dealloc
{
    self.wunderkit = nil;
}

#pragma mark - Actions

- (IBAction)loginPressed:(id)sender
{
    [self.wunderkit loginWithUsername:self.usernameField.text password:self.passwordField.text];
}

- (void)kit:(BTWunderfulKit *)kit tokenIsAvailable:(BOOL)available
{
    if(available)
    {
        // start fetching
        [self.wunderkit retrieveLists];
    }
    else
    {
        // show login
    }
}

- (void)kit:(BTWunderfulKit *)kit receivedLists:(NSArray *)lists
{
    [kit retrieveTasks];
}

- (void)kit:(BTWunderfulKit *)kit receivedTask:(NSString *)task inList:(NSString *)list
{
    
}

@end
