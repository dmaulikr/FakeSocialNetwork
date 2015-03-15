//
//  FSNNotification.m
//  FakeSocialNetwork
//
//  Created by Cory Alder on 2015-03-13.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNNotification.h"

@implementation FSNNotification


- (instancetype)initWithType:(FSNNotificationType)noteType andPost:(FSNPost *)post andUser:(FSNUser *)user {
    if ((self = [super init])) {
        _type = noteType;
        _post = post;
        _user = user;
    }

    return self;
}

+ (instancetype)likeNotificationWithPost:(FSNPost *)post andUser:(FSNUser *)user {
    return [[FSNNotification alloc] initWithType:FSNNotificationTypeLike andPost:post andUser:user];
}

+ (instancetype)followNotificationWithUser:(FSNUser *)user {
    return [[FSNNotification alloc] initWithType:FSNNotificationTypeFollow andPost:nil andUser:user];
}

+ (instancetype)repostNotificationWithPost:(FSNPost *)post andUser:(FSNUser *)user {
    return [[FSNNotification alloc] initWithType:FSNNotificationTypeFollow andPost:post andUser:user];
}

@end
