//
//  TweeterStatus.h
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import "TwitterUser.h"

/**
 This would subclass NSManagedObject if using core data.
 */
@interface TweeterStatus : NSObject

/**
 */
@property (nonatomic, strong) TwitterUser *user;

/**
 */
@property (nonatomic, strong) NSDate *dateCreated;

/**
 */
@property (nonatomic, strong) NSString *text;

/**
 */
@property (nonatomic, assign, getter=isRetweeted) BOOL retweeted;

/**
 */
@property (nonatomic, assign, getter=isFavorited) BOOL favorited;


/**
 */
- (id)initWithUser:(TwitterUser *)user;

@end
