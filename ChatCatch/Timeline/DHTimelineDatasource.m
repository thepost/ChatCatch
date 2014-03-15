//
//  DHTimelineDatasource.m
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import "DHTimelineDatasource.h"


@interface DHTimelineDatasource()

@property (nonatomic, strong, readwrite) NSMutableArray *timelineTweets;

@end


@implementation DHTimelineDatasource


- (id)initWithArray:(NSArray *)tweetData
{
    self = [super init];
    
    if (self) {
        self.timelineTweets = [[NSMutableArray alloc] initWithArray:tweetData];
    }
    return self;
}


#pragma mark - Accessors
- (TweeterStatus *)tweetAtIndex:(NSInteger)index
{
    TweeterStatus *tweet = nil;
    
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
    [self.timelineTweets removeAllObjects];
    
    //Set each element in the data array as a TweeterStatus object...
    if ([jsonArray lastObject]) {
        [jsonArray enumerateObjectsUsingBlock:^(id tweetDetails, NSUInteger idx, BOOL *stop)
        {
            if ([[tweetDetails class] isSubclassOfClass:[NSDictionary class]])
            {
                //Set TwitterUser...
                TwitterUser *user = [[TwitterUser alloc] init];
                
                NSDictionary *tweetDict = (NSDictionary *)tweetDetails;
                NSDictionary *userDict = [tweetDict objectForKey:@"user"];
                
                [user setName:[userDict objectForKey:@"name"]];
                [user setScreenName:[userDict objectForKey:@"screen_name"]];
                
                NSURL *imageURL = [NSURL URLWithString:[userDict objectForKey:@"profile_image_url"]];
                [user setProfileImageNormalURL:imageURL];
                
                //Set TweeterStatus...
                TweeterStatus *status = [[TweeterStatus alloc] initWithUser:user];
                [status setText:[tweetDict objectForKey:@"text"]];
                
//                NSString *dateString = [tweetDict objectForKey:@"created_at"];

                [status setFavorited:[[tweetDict objectForKey:@"favorited"] boolValue]];
                [status setRetweeted:[[tweetDict objectForKey:@"retweeted"] boolValue]];
                
                //Add TweeterStatus to timelineTweets structure...
                [self.timelineTweets addObject:status];
            }
        }];
    }
}


@end
