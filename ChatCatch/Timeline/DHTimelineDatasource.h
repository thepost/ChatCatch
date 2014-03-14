//
//  DHTimelineDatasource.h
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

@class TweeterStatus;

@interface DHTimelineDatasource : NSObject

/**
 */
@property (nonatomic, strong, readonly) NSMutableArray *timelineTweets;

/**
 */
- (id)initWithArray:(NSArray *)tweetData;

/** 
 */
//- (TweeterStatus *)tweetAtIndex:(NSInteger)index;
- (id)tweetAtIndex:(NSInteger)index;

/**
 */
- (NSInteger)numberOfTweets;

/**
 */
- (void)setTweetsWithJSONArray:(NSArray *)jsonArray;

@end
