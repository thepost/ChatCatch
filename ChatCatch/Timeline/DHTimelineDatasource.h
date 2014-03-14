//
//  DHTimelineDatasource.h
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

@class UserTweet;

@interface DHTimelineDatasource : NSObject //<UITableViewDataSource> {}

/**
 */
@property (nonatomic, strong) NSArray *timelineTweets;

/**
 */
- (id)initWithArray:(NSArray *)tweetData;

/** 
 */
//- (UserTweet *)tweetAtIndex:(NSInteger)index;
- (id)tweetAtIndex:(NSInteger)index;

/**
 */
- (NSInteger)numberOfTweets;

@end
