//
//  FSNNotification.m
//  FakeSocialNetwork
//
//  Created by Cory Alder on 2015-03-13.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNNotification.h"

@implementation FSNNotification


-(instancetype)initWithType:(FSNNotificationType)noteType {
    if ((self = [super init])) {
        _type = noteType;
    }
    return self;
}


@end
