//
//  FSNPost.m
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-11.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNPost.h"

@implementation FSNPost

- (instancetype)initWithContent:(NSString *)content andAuthor:(FSNUser *)author {
    if (self = [super init]) {
        self.author = author;
        self.content = content;
        self.postedDate = [NSDate date];
    }
    
    return self;
}

@end
