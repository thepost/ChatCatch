//
//  DHTwitterRequest.m
//  ChatCatch
//
//  Created by Mike Post on 14/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import "DHTwitterRequest.h"

NSString *const TWITTER_URL_ROOT = @"https://api.twitter.com/1.1/";


@interface DHTwitterRequest()

@property (nonatomic, strong) ACAccountStore *accountStore;

@end


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


- (BOOL)isTwitterEnabled
{
    BOOL twitterEnabled = [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
    return twitterEnabled;
}


- (void)requestTimeline:(DHRequestSuccessBlock)success failed:(DHRequestFailBlock)fail;
{
    
}


@end
