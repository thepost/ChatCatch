//
//  DHTimelineDatasource.m
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import "DHTimelineDatasource.h"

/*
@interface DHTimelineDatasource()

@property (nonatomic, strong) NSArray *mainTweets;

@end
 */

@implementation DHTimelineDatasource


- (id)initWithArray:(NSArray *)tweetData
{
    self = [super init];
    
    if (self)
    {
//        self.timelineTweets = [[NSArray alloc] init];
        
        if ([tweetData lastObject]) {
            [self setTimelineTweets:tweetData];
        }
    }
    return self;
}


- (id)tweetAtIndex:(NSInteger)index
{
    id tweet = @"";
    
    if ([_timelineTweets lastObject]) {
        tweet = [_timelineTweets objectAtIndex:index];
    }

    return tweet;
}


- (NSInteger)numberOfTweets
{
    return [self.timelineTweets count];
}


@end
