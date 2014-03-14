//
//  TwitterUser.h
//  ChatCatch
//
//  Created by Mike Post on 13/03/14.
//  Copyright (c) 2014 Dashend. All rights reserved.
//


/**
 This would subclass NSManagedObject if using core data.
 */
@interface TwitterUser : NSObject

/**
 */
@property (nonatomic, strong) NSString *name;

/**
 */
@property (nonatomic, strong) NSString *screenName;

/**
 A thumb of the user's profile image. Defaults to 48 x 48 https://dev.twitter.com/docs/user-profile-images-and-banners
 */
@property (nonatomic, strong) UIImage *profileImageNormal;

@end
