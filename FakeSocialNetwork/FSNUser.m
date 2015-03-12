//
//  FSNUser.m
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-11.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNUser.h"

@implementation FSNUser

- (instancetype)initWithName:(NSString *)name andUserID:(NSString *)userID andAvatar:(UIImage *)avatar {
    
    if (self = [super init]) {
        self.avatar = avatar;
        self.name = name;
        self.userID = userID;
    }
    
    return self;
}

@end
