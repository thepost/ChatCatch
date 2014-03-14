//
//  DHFirstViewController.h
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

@class DHTimelineTableViewController;

@interface DHTimelineController : UIViewController {
}

@property (nonatomic, strong) DHTimelineTableViewController *tableViewController;

- (IBAction)refresh:(id)sender;

- (IBAction)compose:(id)sender;

@end
