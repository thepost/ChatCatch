//
//  DHTwitterRequest.m
//  ChatCatch
//
//  Created by Mike Post on 14/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import "DHTwitterRequest.h"


@implementation DHTwitterRequest


+ (DHTwitterRequest *)sharedInstance
{
    static DHTwitterRequest *singleton = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    
    return singleton;
}


@end
