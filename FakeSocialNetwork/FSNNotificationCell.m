//
//  FSNNotificationCell.m
//  FakeSocialNetwork
//
//  Created by Cory Alder on 2015-03-13.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNNotificationCell.h"
#import "FSNNotification.h"
#import "FSNUser.h"
#import "FSNPost.h"

@implementation FSNNotificationCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)configureWithNotification:(FSNNotification *)note {
    
    NSString *typeStr = nil;
    
    if (note.type == FSNNotificationTypeFollow) {
        typeStr = [NSString stringWithFormat:@"%@ started following you", note.user.userID];
    } else if (note.type == FSNNotificationTypeLike) {
        typeStr = [NSString stringWithFormat:@"%@ liked your post (%@)", note.user.userID, note.post.content];
    } else if (note.type == FSNNotificationTypeRepost) {
        typeStr = [NSString stringWithFormat:@"%@ reposted your post (%@)", note.user.userID, note.post.content];
    }
    
    self.notificationLabel.text = typeStr;
    self.notificationDateLabel.text = [NSString stringWithFormat:@"Mar 20"];
}

@end
