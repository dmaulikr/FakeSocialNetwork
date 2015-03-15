//
//  FSNNotificationCell.h
//  FakeSocialNetwork
//
//  Created by Cory Alder on 2015-03-13.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FSNNotification;

@interface FSNNotificationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;
@property (weak, nonatomic) IBOutlet UILabel *notificationDateLabel;

-(void)configureWithNotification:(FSNNotification *)note;

@end
