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
 Checks SLComposeViewController to see if twitter accounts are enabled in settings.
 @return 
 */
- (BOOL)isTwitterEnabled;

/**
 Checks ACAccountType to see if the app has been enabled for use with Twitter.
 @param success block executed with a response of 200.
 @param fail block executed with any errors or a different response.
 */
- (void)requestAccess:(DHRequestSuccessBlock)success failed:(DHRequestFailBlock)fail;

/**
 Retrieves the 50 most recent tweets from the Twitter API.
 @param success block executed with a response of 200.
 @param fail block executed with any errors or a different response.
 */
- (void)requestTimeline:(DHRequestSuccessBlock)success failed:(DHRequestFailBlock)fail;

/**
 Gets the last tweet by specifying a count of 1 in the parameters from the Twitter API.
 @param success block executed with a response of 200.
 @param fail block executed with any errors or a different response.
 */
- (void)requestLatestTweet:(DHRequestSuccessBlock)success failed:(DHRequestFailBlock)fail;

/**
 Deletes the tweet if the tweetID is matched.
 @param tweetID the ID to delete.
 @param success block executed with a response of 200.
 @param fail block executed with any errors or a different response.
 */
- (void)deleteTweetWithID:(NSString *)tweetID success:(DHRequestSuccessBlock)success failed:(DHRequestFailBlock)fail;

@end
