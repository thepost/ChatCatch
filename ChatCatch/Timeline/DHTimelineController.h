//
//  DHFirstViewController.h
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//


@class DHTimelineTableViewController;
@class DHTwitterRequest;


/**
 The root view controller for all things timeline related. Manages the main table view controller, twitter auth and requests,
 and user actions for compose and reload.
 */
@interface DHTimelineController : UIViewController {
}

/**
 */
@property (nonatomic, strong) DHTimelineTableViewController *tableViewController;

/**
 */
@property (nonatomic, strong) DHTwitterRequest *twitterRequest;


/**
 */
- (void)alertTwitterSignIn;

/**
 */
- (IBAction)refresh:(id)sender;

/**
 */
- (IBAction)compose:(id)sender;

@end
