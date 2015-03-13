//
//  FSNPostTableViewCell.h
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-11.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FSNPost;

@interface FSNPostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *annotationBanner;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userID;
@property (weak, nonatomic) IBOutlet UILabel *postDate;
@property (weak, nonatomic) IBOutlet UILabel *postText;

-(void)configureWithPost:(FSNPost *)post;

@end
