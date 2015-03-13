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
@end
