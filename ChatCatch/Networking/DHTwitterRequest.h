//
//  DHTwitterRequest.h
//  ChatCatch
//
//  Created by Mike Post on 14/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import <Social/Social.h>
#import <Accounts/Accounts.h>

extern NSString *const TWITTER_URL_ROOT;

/**
 Basic auth blocks.
 */
typedef void(^DHRequestAuthenticationBlock)(NSURL *authorizationURL);
typedef void(^DHRequestSuccessBlock)(id response);
typedef void(^DHRequestFailBlock)(NSError *error);


@interface DHTwitterRequest : NSObject

/**
 Singleton initialiser.
 */
+ (DHTwitterRequest *)sharedInstance;

/**
 @return
 */
- (BOOL)isTwitterEnabled;

/**
 @param
 @param 
 */
- (void)requestAccess:(DHRequestSuccessBlock)success failed:(DHRequestFailBlock)fail;

/**
 @param
 @param
 */
- (void)requestTimeline:(DHRequestSuccessBlock)success failed:(DHRequestFailBlock)fail;

@end
