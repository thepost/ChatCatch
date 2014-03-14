//
//  DHTwitterRequest.m
//  ChatCatch
//
//  Created by Mike Post on 14/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//

#import "DHTwitterRequest.h"

NSString *const TWITTER_URL_ROOT = @"https://api.twitter.com/1.1/";


@interface DHTwitterRequest()

@property (nonatomic, strong) ACAccountStore *accountStore;

@end


@implementation DHTwitterRequest


#pragma mark - Init
+ (DHTwitterRequest *)sharedInstance
{
    static DHTwitterRequest *singleton = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    
    return singleton;
}


- (id)init
{
    self = [super init];
    
    if (self) {
        self.accountStore = [[ACAccountStore alloc] init];
    }
    return self;
}


#pragma mark - Auth & Requests
- (BOOL)isTwitterEnabled
{
    BOOL twitterEnabled = [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
    return twitterEnabled;
}


- (void)requestAccess:(DHRequestSuccessBlock)success failed:(DHRequestFailBlock)fail;
{
    if (self.accountStore == nil) {
        self.accountStore = [[ACAccountStore alloc] init];
    }
    
    ACAccountType *twitterAccount = [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [self.accountStore requestAccessToAccountsWithType:twitterAccount
                                               options:nil
                                            completion:^(BOOL granted, NSError *error)
    {
        dispatch_async(dispatch_get_main_queue(), ^()
        {
            if (granted == YES) {
                success(nil);
            }
            else {
                fail(error);
            }
        });
    }];
}


- (void)requestTimeline:(DHRequestSuccessBlock)success failed:(DHRequestFailBlock)fail;
{
    NSURL *twitterURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@statuses/home_timeline.json", TWITTER_URL_ROOT]];
    
    NSDictionary *params = @{@"count": @"2",
                             @"contributor_details": @"true"};

    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                            requestMethod:SLRequestMethodGET
                                                      URL:twitterURL
                                               parameters:params];
    
    //Set the account to the request...
    ACAccountType *twitterAccountType = [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];

    ACAccount *twitterAccount = (ACAccount *)[[self.accountStore accountsWithAccountType:twitterAccountType] lastObject];
    [request setAccount:twitterAccount];
    
    //Make request...
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
    {
        if ((responseData) && (urlResponse.statusCode == 200))
        {
            //Convert to JSON...
            NSError *jsonError = nil;
            NSArray *tweets = [NSJSONSerialization JSONObjectWithData:responseData
                                                              options:NSJSONReadingAllowFragments
                                                                error:&jsonError];
            
            if ([tweets lastObject]) {
                success(tweets);
            }
            else {
                fail(jsonError);
            }
        }
        else {
            NSLog(@"URL request not successful. Response code: %d", urlResponse.statusCode);
            fail(error);
        }
    }];
}


@end
