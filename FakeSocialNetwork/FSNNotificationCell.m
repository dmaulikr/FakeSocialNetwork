//
//  FSNNotificationCell.m
//  FakeSocialNetwork
//
//  Created by Cory Alder on 2015-03-13.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNNotificationCell.h"
#import "FSNNotification.h"

@implementation FSNNotificationCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)configureWithNotification:(FSNNotification *)note {
    
    NSString *typeStr = nil;
    
    if (note.type == FSNNotificationTypeFollow) {
        typeStr = [NSString stringWithFormat:@"%@ started following you", note.user];
    } else if (note.type == FSNNotificationTypeLike) {
        typeStr = [NSString stringWithFormat:@"%@ liked your post (%@)", note.user, note.post];
    } else if (note.type == FSNNotificationTypeRepost) {
        typeStr = [NSString stringWithFormat:@"%@ reposted your post (%@)", note.user, note.post];
    }
    
    
    self.textLabel.text = typeStr;
    self.detailTextLabel.text = [NSString stringWithFormat:@"Mar 20"];
}

@end
