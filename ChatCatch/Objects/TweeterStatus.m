//
//  TweeterStatus.m
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import "TweeterStatus.h"


@implementation TweeterStatus


- (id)initWithUser:(TwitterUser *)user
{
    self = [super init];
    
    if (self) {
        [self setUser:user];
    }
    return self;
}


@end
