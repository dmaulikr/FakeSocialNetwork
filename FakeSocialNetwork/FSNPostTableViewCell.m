//
//  FSNPostTableViewCell.m
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-11.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNPostTableViewCell.h"
#import "FSNPost.h"

@implementation FSNPostTableViewCell

- (void)awakeFromNib {
    self.avatarImageView.layer.cornerRadius = 8.0;
    self.avatarImageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureWithPost:(FSNPost *)post {
    
    FSNUser *poster = (post.originalAuthor ? post.originalAuthor : post.author);
    
    self.avatarImageView.image = poster.avatar;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM, dd"];
    self.postDate.text = [dateFormatter stringFromDate:post.postedDate];
    
    self.postText.text = post.content;
    self.userName.text = poster.name;
    self.userID.text = poster.userID;
    
    if (post.originalAuthor == nil) {
        self.annotationBanner.text = nil;
    } else {
        self.annotationBanner.text = [NSString stringWithFormat:@"Retweeted by %@", post.author.userID];
    }
}

@end
