//
//  FSNComposeViewController.m
//  FakeSocialNetwork
//
//  Created by Cory Alder on 2015-03-13.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNComposeViewController.h"

@interface FSNComposeViewController ()

@end

@implementation FSNComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setContentInset:(UIEdgeInsets){20,0,0,0}];
}

-(void)viewWillAppear:(BOOL)animated {
    
}

- (IBAction)cancelButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)postButtonAction:(id)sender {
    FSNUser *cory = [[FSNUser alloc] initWithName:@"Cory CoolKid" andUserID:@"@deCooler" andAvatar:[UIImage imageNamed:@"cory"]];
    FSNPost *post = [[FSNPost alloc] initWithContent:self.composeTextView.text andAuthor:cory];

    [self.delegate didCreatePost:post];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
