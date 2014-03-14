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
                                                        message:@"Please sign in to at least 1 account in Settings -> Twitter"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertview show];
}


#pragma mark - IBAction
- (IBAction)refresh:(id)sender
{
    //1. Pull data from Twitter...
    BOOL twitterEnabled = [_twitterRequest isTwitterEnabled];
    
    if (twitterEnabled == YES)
    {
        //2. Call DHTimelineTableViewController's reloadWithTimelineData:
        
        //3. DHTimelineTableViewController passes data to DHTimelineDatasource
        
        //4. DHTimelineDatasource sets each element in the data array as a TweeterStatus object
        
        //5. DHTimelineTableViewController refreshes its table view.
    }
    else {
        [self alertTwitterSignIn];
    }
}


- (IBAction)compose:(id)sender {
    //Present Twitter view controller...
}


#pragma mark - Memory Management
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
