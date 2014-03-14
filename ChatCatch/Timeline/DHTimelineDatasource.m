//
//  DHTimelineDatasource.m
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import "DHTimelineDatasource.h"
#import "TweeterStatus.h"


@interface DHTimelineDatasource()

@property (nonatomic, strong, readwrite) NSArray *timelineTweets;

@end


@implementation DHTimelineDatasource


- (id)initWithArray:(NSArray *)tweetData
{
    self = [super init];
    
    if (self)
    {
        self.timelineTweets = [[NSArray alloc] init];
        
        if ([tweetData lastObject]) {
            [self setTimelineTweets:tweetData];
        }
    }
    return self;
}


#pragma mark - Accessors
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


#pragma mark - Mutators
- (void)setTweetsWithJSONArray:(NSArray *)jsonArray
{
    //Set each element in the data array as a TweeterStatus object...
    if ([jsonArray lastObject]) {
        [jsonArray enumerateObjectsUsingBlock:^(id tweetDetails, NSUInteger idx, BOOL *stop)
        {
            if ([[tweetDetails class] isSubclassOfClass:[NSDictionary class]]) {
                
            }
        }];
    }
}


@end
