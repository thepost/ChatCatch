//
//  DHTimelineDatasource.h
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import "TweeterStatus.h"

@interface DHTimelineDatasource : NSObject

/**
 */
@property (nonatomic, strong, readonly) NSMutableArray *timelineTweets;

/**
 */
- (id)initWithArray:(NSArray *)tweetData;

/** 
 */
- (TweeterStatus *)tweetAtIndex:(NSInteger)index;

/**
 */
- (NSInteger)numberOfTweets;

/**
 */
- (void)setTweetsWithJSONArray:(NSArray *)jsonArray;

@end
