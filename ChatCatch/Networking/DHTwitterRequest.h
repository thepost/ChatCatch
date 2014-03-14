//
//  DHTwitterRequest.h
//  ChatCatch
//
//  Created by Mike Post on 14/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import <Social/Social.h>
#import <Accounts/Accounts.h>

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


//isTwitterEnabled

//

@end
