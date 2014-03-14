//
//  DHTimelineTableViewController.m
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import "DHTimelineTableViewController.h"
#import "DHTimelineDatasource.h"
#import "DHTimelineTableViewCell.h"


@interface DHTimelineTableViewController ()

@end


@implementation DHTimelineTableViewController


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        self.timelineDatasource = [[DHTimelineDatasource alloc] initWithArray:@[@"Alison", @"Mike"]];
    }
    return self;
}


#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 10)];
}


- (void)reloadWithTimelineData:(NSArray *)timelineData
{
    //Pass data to DHTimelineDatasource...
    [self.timelineDatasource setTweetsWithJSONArray:timelineData];
    
    //Reload table view...
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numRows = [_timelineDatasource numberOfTweets];
    
    if (numRows == 0) {
#warning TODO: Handle error!
    }
    return numRows;

}


- (DHTimelineTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DHTimelineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimelineCell"
                                                                    forIndexPath:indexPath];
    
    //Configure the cell...
#warning TODO: TweeterStatus *status = [_timelineDatasource tweetAtIndex:indexPath.row];
    NSString *status = [_timelineDatasource tweetAtIndex:indexPath.row];
    
    [[cell statusLabel] setText:status];
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Memory Management
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
