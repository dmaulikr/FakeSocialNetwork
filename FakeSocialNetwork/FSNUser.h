//
//  FSNUser.h
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-11.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSNUser : NSObject

@property (nonatomic, strong) UIImage *avatar;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *userID;

- (instancetype)initWithName:(NSString *)name andUserID:(NSString *)userID andAvatar:(UIImage *)avatar;

@end
