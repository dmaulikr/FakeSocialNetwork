//
//  FSNSentiment.m
//  FakeSocialNetwork
//
//  Created by Daniel Mathews on 2015-03-15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNSentiment.h"
#import "FSNPost.h"

@interface FSNSentiment()

@end

@implementation FSNSentiment

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *str=[[NSBundle mainBundle] pathForResource:@"sentiment" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:str];
        
        NSError *error = nil;
        
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSArray *sentimentArray = jsonDict[@"words"];
        
        NSMutableDictionary *sentimentDict = [NSMutableDictionary dictionary];
        for (NSDictionary *word in sentimentArray){
            NSString *wordStr = word[@"Word"];
            NSString *scoreStr = word[@"Score"];
            [sentimentDict setValue:[NSNumber numberWithInt:scoreStr.intValue] forKey:wordStr];
        }
        
        self.sentimentDict = sentimentDict;
        
        self.intensifiers = [NSSet setWithObjects:
                                  @"so",
                                  @"very",
                                  @"obviously",
                                  @"clearly",
                                  @"patently",
                                  @"absolutely",
                                  @"really",
                                  @"plainly",
                                  @"undoubtedly",
                                  @"certainly",
                                  @"totally",
                                  @"simply",
                                  @"wholly",
                                  @"awfully",
                                  @"bloody",
                                  @"dreadfully",
                                  @"extremely",
                                  @"most",
                                  @"quite",
                                  @"literally",
                                  @"remarkably",
                                  @"terribly",
                                  @"goddamn",
                                  @"hella",
                                  @"fucking",
                                  @"freaking",
                                  @"madly",
                                  @"ridiculously", nil
                                ];
        
        self.negators = [NSSet setWithObjects:
                           @"no",
                           @"didn't",
                           @"don't",
                           @"not",
                           @"can't",
                           @"cannot",
                           @"doesn't",
                           @"hadn't",
                           @"hasn't",
                           @"mustn't",
                           @"needn't",
                           @"shouldn't",
                           @"won't",
                           @"wasn't",
                           @"isn't",
                           @"never", nil
                               ];

    }
    return self;
}

-(NSNumber *) scoreForPost:(FSNPost*) post{
    float score = 0;
    
    NSMutableString *content = [[NSMutableString alloc] initWithString:post.content];
    CFMutableStringRef xcontent = (__bridge CFMutableStringRef) content;
    
    NSMutableArray *stringArray = [NSMutableArray array];
    
    CFStringTokenizerTokenType type;
    
    CFStringTokenizerRef tokenizer = CFStringTokenizerCreate(nil, xcontent, CFRangeMake(0, CFStringGetLength(xcontent)), 0, CFLocaleCopyCurrent());
    
    do {
        type = CFStringTokenizerAdvanceToNextToken(tokenizer);
        CFRange range = CFStringTokenizerGetCurrentTokenRange(tokenizer);
        NSString *word = CFBridgingRelease(CFStringCreateWithSubstring(nil, xcontent, range));
        [stringArray addObject:word];
        //
    } while (type != kCFStringTokenizerTokenNone);
    
    for (int i = 0; i < stringArray.count; i++){
        NSString* word = [stringArray[i] lowercaseString];
        if (self.sentimentDict[word]){
            NSNumber *wordScore = self.sentimentDict[word];
            float multipler = 1;
            if (i>=2) {
                multipler = [self findMultiplier:stringArray[i-2] secondWord:stringArray[i-1] sentimentWord:stringArray[i]];
            }else if (i == 1){
                multipler = [self findMultiplier:stringArray[i-1] sentimentWord:stringArray[i]];
            }
            score += (wordScore.floatValue * multipler);
            NSLog(@"word is %@, score is %f", word, wordScore.floatValue);
        }
    }
    
    NSLog(@"score is %f",score);
    
    return [NSNumber numberWithFloat:score];
}

-(float) findMultiplier:(NSString*) firstWord secondWord:(NSString*)secondWord sentimentWord:(NSString*) sentimentWord{
    
    float multipler = 1;
    
    if ([self.negators containsObject:secondWord]){
        //word before is a negator : ex) don't like
        
        multipler = -multipler;
        
        if ([self.intensifiers containsObject:firstWord]){
            // word after negator is an intensifier : ex) really don't like
            
            multipler = multipler * 2;
        }
    }else if ([self.intensifiers containsObject:secondWord]){
        //word before is a negator : ex) really like
        
        multipler = multipler * 2;
        
        if ([self.negators containsObject:firstWord]){
            // word after negator is an intensifier : ex) don't really like
            
            multipler = - multipler / 4;
        }
    }
    
    return multipler;
}

-(float) findMultiplier:(NSString*) firstWord sentimentWord:(NSString*) sentimentWord{
    
    float multipler = 1;
    
    if ([self.negators containsObject:firstWord]){
        //word before is a negator : ex) don't like
        
        multipler = -multipler;
        
    }else if ([self.intensifiers containsObject:firstWord]){
        //word before is a negator : ex) really like
        
        multipler = multipler * 2;
        
    }
    
    return multipler;
}

@end
