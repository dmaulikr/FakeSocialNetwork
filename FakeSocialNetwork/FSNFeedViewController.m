//
//  FSNFeedViewController.m
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-09.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "FSNFeedViewController.h"
#import "FSNFeedCollectionViewController.h"

@interface FSNFeedViewController ()

@end

@implementation FSNFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareNavbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"feedCollectionViewContainer"]) {
        // preload some data for the collectionview
        FSNFeedCollectionViewController *feedCollectionViewController = (FSNFeedCollectionViewController *)segue.destinationViewController;
        feedCollectionViewController.feedItems = [NSMutableArray arrayWithArray:@[@{@"color": @"yellowColor"},
                                                                                  @{@"color": @"blueColor"},
                                                                                  @{@"color": @"redColor"}]];
    }
}

- (void)prepareNavbar {
    // Search field
    UITextField *searchField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 400.0f, 30.0f)];
    searchField.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    searchField.tintColor = [UIColor whiteColor];
    searchField.textColor = [UIColor whiteColor];
    searchField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    searchField.borderStyle = UITextBorderStyleRoundedRect;
    searchField.placeholder = @"Search";
    
    self.navigationItem.titleView = searchField;
    
    // Right button
    
}

@end
