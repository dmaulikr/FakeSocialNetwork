//
//  FSNComposeViewController.h
//  FakeSocialNetwork
//
//  Created by Cory Alder on 2015-03-13.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSNPost.h"


@interface FSNComposeViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextView *composeTextView;
@property (weak, nonatomic) id<FSNPostDelegate> delegate;

- (IBAction)cancelButtonAction:(id)sender;

@end
