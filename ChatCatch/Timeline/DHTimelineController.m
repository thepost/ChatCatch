//
//  DHFirstViewController.m
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import "DHTimelineController.h"
#import "DHTimelineTableViewController.h"
#import "DHTwitterRequest.h"

@interface DHTimelineController ()

/**
 Called after the recent tweet deletion has been attempted.
 */
- (void)alertTweetDeletion:(NSError *)error;

/**
 Deletes the most recent tweet after the timer has been fired.
 */
- (void)autoDeleteTweet:(NSTimer*)theTimer;

@end


@implementation DHTimelineController


#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.twitterRequest = [DHTwitterRequest sharedInstance];
    
    if ([_twitterRequest isTwitterEnabled] == NO) {
        [self alertTwitterSignIn];
    }
    else {
        [self refresh:nil];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"TimelineTableViewController"])
    {
        [self setTableViewController:(DHTimelineTableViewController *)[segue destinationViewController]];
    }
}


#pragma mark - Twitter
- (void)alertTwitterSignIn
{
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Twitter Unavailable"
                                                        message:@"Please sign in to at least 1 account in Settings -> Twitter. Then enable access."
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertview show];
}


- (void)alertTweetDeletion:(NSError *)error
{
    NSString *title = @"60 Seconds Alert";
    NSString *message;
    
    if (error == nil) {
        message = @"Your recent Tweet has been deleted!";
    }
    else {
        message = [NSString stringWithFormat:@"There was a problem with deleting your recent Tweet: %@", [error description]];
    }
    
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertview show];
}


- (void)autoDeleteTweet:(NSTimer*)theTimer
{
    NSDictionary *tweet = [theTimer userInfo];
    
    if (tweet) {
        [_twitterRequest deleteTweetWithID:[tweet objectForKey:@"id"]
                                   success:^(id response) {
                                       [self alertTweetDeletion:nil];
                                       [self refresh:nil];
                                   }
                                    failed:^(NSError *error) {
                                        [self alertTweetDeletion:error];
                                        NSLog(@"Error with deleting tweet: %@", [error description]);
                                    }];
    }
}


#pragma mark - IBAction
- (IBAction)refresh:(id)sender
{
    //1. Pull data from Twitter...
    BOOL twitterEnabled = [_twitterRequest isTwitterEnabled];
    
    if (twitterEnabled == YES)
    {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        
        //2. Now check if we have access...
        [_twitterRequest requestAccess:^(id response)
        {
            //3a. Make the request...
            [_twitterRequest requestTimeline:^(id response)
            {
                //4. Call DHTimelineTableViewController's reloadWithTimelineData:
                if ([[response class] isSubclassOfClass:[NSArray class]])
                {
                    NSArray *tweets = (NSArray *)response;
                    [self.tableViewController reloadWithTimelineData:tweets];
                }
            }
                                      failed:^(NSError *error) {
                                          //3b. Handle error...
                                          [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                                      }];
        }
                                failed:^(NSError *error) {
                                    //2b. Inform that no access was given...
                                    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                                    [self alertTwitterSignIn];
                                }];
    }
    else {
        [self alertTwitterSignIn];
    }
}


- (IBAction)compose:(id)sender
{
    //Present Twitter view controller...
    BOOL twitterEnabled = [_twitterRequest isTwitterEnabled];
    
    if (twitterEnabled == YES)
    {
        SLComposeViewController *twitterComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [twitterComposer setCompletionHandler:^(SLComposeViewControllerResult result)
        {
            //Reload data...
            [self refresh:nil];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
            
            //Get status ID of the most recent tweet...
            [_twitterRequest requestLatestTweet:^(id response)
            {
                //Auto-Delete tweet...
                if ([[response class] isSubclassOfClass:[NSArray class]])
                {
                    NSDictionary *tweet = [(NSArray *)response lastObject];
                
                    if (tweet) {
                        //Set up 60 second delay...
                        [NSTimer scheduledTimerWithTimeInterval:60
                                                        target:self
                                                        selector:@selector(autoDeleteTweet:)
                                                        userInfo:tweet
                                                        repeats:NO];
                    }
                }
            }
                                         failed:^(NSError *error) {
                                             //Handle error...
                                         }];
        }];
        
        [self presentViewController:twitterComposer
                           animated:YES
                         completion:NULL];
    }
    else {
        [self alertTwitterSignIn];
    }
}


#pragma mark - Memory Management
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
