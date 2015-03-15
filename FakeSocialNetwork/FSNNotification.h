//
//  FSNNotification.h
//  FakeSocialNetwork
//
//  Created by Cory Alder on 2015-03-13.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FSNNotificationType) {
    FSNNotificationTypeLike, // requires a user and a post
    FSNNotificationTypeFollow, // requires a user
    FSNNotificationTypeRepost // requires a user and a post
};

@class FSNPost;
@class FSNUser;

@interface FSNNotification : NSObject

@property (nonatomic, strong) FSNPost *post;
@property (nonatomic, strong) FSNUser *user;

@property (readonly) FSNNotificationType type;

- (instancetype)initWithType:(FSNNotificationType)noteType andPost:(FSNPost *)post andUser:(FSNUser *)user;
+ (instancetype)likeNotificationWithPost:(FSNPost *)post andUser:(FSNUser *)user;
+ (instancetype)followNotificationWithUser:(FSNUser *)user;
+ (instancetype)repostNotificationWithPost:(FSNPost *)post andUser:(FSNUser *)user;
@end
