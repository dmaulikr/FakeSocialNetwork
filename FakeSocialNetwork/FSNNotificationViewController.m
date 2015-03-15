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
#import "FSNPost.h"

@interface FSNNotificationViewController ()

@end

@implementation FSNNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareMockData];
    
    self.tableView.estimatedRowHeight = 50.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - Mock data

- (void)prepareMockData {
    // mock users
    FSNUser *renato = [[FSNUser alloc] initWithName:@"Renato Camilio" andUserID:@"@recamilio" andAvatar:[UIImage imageNamed:@"renato"]];
    FSNUser *cory = [[FSNUser alloc] initWithName:@"Cory CoolKid" andUserID:@"@deCooler" andAvatar:[UIImage imageNamed:@"cory"]];
    FSNUser *danny = [[FSNUser alloc] initWithName:@"Danny Mathews" andUserID:@"@notSoFunny" andAvatar:[UIImage imageNamed:@"danny"]];
    
    // mock posts
    FSNPost *renatoPost = [[FSNPost alloc] initWithContent:@"I'm a very humid person. No, seriously..." andAuthor:renato];
    FSNPost *dannyPost = [[FSNPost alloc] initWithContent:@"In this fake social network I'll get people laughing of my jokes, just loved it! So cooollll!!!" andAuthor:danny];
    FSNPost *coryPost = [[FSNPost alloc] initWithContent:@"Are you talking about me, guys? @recamilio @notSoFunny" andAuthor:cory];
    
    // mock notification
    FSNNotification *n1 = [FSNNotification followNotificationWithUser:renato];
    FSNNotification *n2 = [FSNNotification likeNotificationWithPost:dannyPost andUser:cory];
    FSNNotification *n3 = [FSNNotification repostNotificationWithPost:renatoPost andUser:cory];
    FSNNotification *n4 = [FSNNotification followNotificationWithUser:cory];
    FSNNotification *n5 = [FSNNotification likeNotificationWithPost:coryPost andUser:danny];
    
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
    FSNNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FSNNotificationCell class]) forIndexPath:indexPath];
    
    [cell configureWithNotification:self.notifications[indexPath.row]];
    
    return cell;
}


@end
