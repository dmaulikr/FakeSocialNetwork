//
//  FSNPost.h
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-11.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNUser.h"

@class FSNUser;

@interface FSNPost : NSObject

@property (nonatomic, strong) NSDate *postedDate;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) FSNUser *author;
@property (nonatomic, strong) FSNUser *originalAuthor; // denotes a "retweet" type post

- (instancetype)initWithContent:(NSString *)content andAuthor:(FSNUser *)author;

@end

@protocol FSNPostDelegate <NSObject>

@required
- (void)didCreatePost:(FSNPost *)post;

@end