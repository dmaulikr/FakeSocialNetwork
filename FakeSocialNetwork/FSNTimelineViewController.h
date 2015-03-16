//
//  FSNTimelineViewController.h
//  FakeSocialNetwork
//
//  Created by Renato Camilio on 2015-03-09.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSNPostTableViewCell.h"
#import "FSNUser.h"
#import "FSNPost.h"
#import "UIColor+FSNColor.h"
#import "FSNTabBarHandler.h"
#import "FSNComposeViewController.h"
#import "FSNSentiment.h"


@interface FSNTimelineViewController : UITableViewController <FSNPostDelegate>

@end
