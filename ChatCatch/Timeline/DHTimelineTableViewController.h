//
//  DHTimelineTableViewController.h
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

@class DHTimelineDatasource;

@interface DHTimelineTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
}

@property (nonatomic, strong) DHTimelineDatasource *timelineDatasource;

@end
