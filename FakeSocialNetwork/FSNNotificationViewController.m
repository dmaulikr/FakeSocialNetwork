//
//  FSNNotificationViewController.m
//  FakeSocialNetwork
//
//  Created by Cory Alder on 2015-03-13.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNNotificationViewController.h"
#import "FSNNotification.h"
#import "FSNNotificationCell.h"

@interface FSNNotificationViewController ()

@end

@implementation FSNNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // note, need to set user on these notifications
    FSNNotification *n1 = [[FSNNotification alloc] initWithType:FSNNotificationTypeFollow];
    FSNNotification *n2 = [[FSNNotification alloc] initWithType:FSNNotificationTypeLike];
    FSNNotification *n3 = [[FSNNotification alloc] initWithType:FSNNotificationTypeRepost];
    FSNNotification *n4 = [[FSNNotification alloc] initWithType:FSNNotificationTypeFollow];
    FSNNotification *n5 = [[FSNNotification alloc] initWithType:FSNNotificationTypeLike];
    
    self.notifications = @[n1, n2, n3, n4, n5];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.notifications count];
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    FSNNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotificationCell" forIndexPath:indexPath];
    
    [cell configureWithNotification:self.notifications[indexPath.row]];
    
    return cell;
}


@end
