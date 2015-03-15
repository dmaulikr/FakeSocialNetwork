//
//  FSNSentiment.h
//  FakeSocialNetwork
//
//  Created by Daniel Mathews on 2015-03-15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FSNPost;

@interface FSNSentiment : NSObject

@property (nonatomic, strong) NSDictionary *sentimentDict;
@property (nonatomic, strong) NSSet *intensifiers;
@property (nonatomic, strong) NSSet *negators;

-(NSNumber *) scoreForPost:(FSNPost*) post;

@end
